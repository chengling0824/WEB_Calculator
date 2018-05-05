package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Calendar;
import java.util.Enumeration;
import core.*;

import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BaseDao;

public class getParam extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public getParam() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	request.setCharacterEncoding("UTF-8");
		 	HttpSession session = request.getSession();
		 	String User = (String) session.getAttribute("User");
		 	if(User==null){
		 		response.sendRedirect("/index.jsp");
		 	}
			String num_of_formula = request.getParameter("num_of_formula");
			String high = request.getParameter("high");
			String low = request.getParameter("low");
			String maxmum_of_operation = request.getParameter("maxmum_of_operation");
			String kind_of_operation = request.getParameter("kind_of_operation");
			String isBracket = request.getParameter("isBracket");
			Command cmd = new Command();
			int len = 7;
			if(kind_of_operation.equals("4"))
				len++;
			if(isBracket.equals("1"))
				len++;
			String[] args = new String[len];
			args[0]="-n";
			args[1]=num_of_formula;
			args[2]="-m";
			args[3]=low;
			int l,h;
			l = Integer.parseInt(low);
			h = Integer.parseInt(high);
			if(l>=h){
				response.sendRedirect("../main.jsp");
				return;
			}
			args[4]=high;
			args[5]="-o";
			args[6]=maxmum_of_operation;
			if(len==9){
				args[7]="-c";
				args[8]="-b";
			}
			else if(len==8){
				if(kind_of_operation.equals("4"))
					args[7]="-c";
				else if(isBracket.equals("1"))
					args[7]="-b";
			}
			try {
				cmd.main(args);
				String[] fml = cmd.getString().split("<br>");
				int nf = fml.length;
				int[] RightAns = cmd.getAns();
				BaseDao connDB = new BaseDao();
				for(int i=0;i<nf;i++){
				    String sql="insert into Formula(username, formula, RightAns) values('"+ User +"','"+ fml[i] +"','"+ RightAns[i] +"')";  
				    connDB.executeUpdate(sql); 
				}
				String sql0 = "select count(*) from Formula";
				ResultSet rs0 = connDB.executeQuery(sql0);
				int start = 0;
				rs0.next();
				int total=rs0.getInt(1);
				start = total-nf+1;
				long startTime = Calendar.getInstance().getTimeInMillis();
				session.setAttribute("startID",	start);
				session.setAttribute("startTime",startTime);
			    connDB.closeStmt();         
			    connDB.closeConn();
			    response.sendRedirect("../replyonline.jsp?id="+start);
	            cmd.clear();
			} catch(NullPointerException e){
				response.sendRedirect("../main.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.sendRedirect("../main.jsp");
				e.printStackTrace();
			}
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
