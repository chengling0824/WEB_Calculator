package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BaseDao;
/**
 * Servlet implementation class Checkin
 */
@WebServlet("/Checkin")
public class Checkin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BaseDao connDB = new BaseDao();
		request.setCharacterEncoding("utf-8"); 
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String sql = "select * from Users where username = '"+username+"'";
		ResultSet rs = connDB.executeQuery(sql);
		try {
			rs.next();
			if(rs.getString("pwd").equals(pwd)){
				HttpSession session = request.getSession();
				session.setAttribute("User", username);
				request.getRequestDispatcher("/main.jsp").forward(request, response);
			}
			else{
				//用户名或密码错误
				response.sendRedirect("index.jsp");
			}
		}catch(NullPointerException e){
			//前端显示用户名不存在
			response.sendRedirect("index.jsp");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("index.jsp");
		}
		
	}

}
