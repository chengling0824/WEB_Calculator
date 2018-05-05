package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.BaseDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class getResult
 */
@WebServlet("/getResult")
public class getResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getResult() {
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
		String UserAns = request.getParameter("UserAns");
		String qs = request.getParameter("qs");
		int id = Integer.parseInt(qs.split("=")[1]);
		String sql="update Formula set UserAns='"+ UserAns +"' where id="+ id;
		connDB.executeUpdate(sql);
		sql="select count(*) from Formula";
		ResultSet rs = connDB.executeQuery(sql);
		int total = 0;
		try {
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

			if(id<total){
				id++;
				response.sendRedirect("replyonline.jsp?id="+id);
			}
			else if(id>=total){
				//前端显示
				HttpSession session = request.getSession();
				long cTime = Calendar.getInstance().getTimeInMillis();
				try{
					long startTime = (long)session.getAttribute("startTime");
					long t = cTime-startTime;
					SimpleDateFormat formatter = new SimpleDateFormat("00时mm分ss秒");
					Date date = new Date(t);
					String time = formatter.format(date);
					session.setAttribute("startTime", time);
				}catch(ClassCastException e){
				}
				response.sendRedirect("replyonlineFinal.jsp");
				
			}	
	}

}
