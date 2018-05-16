package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BaseDao;

/**
 * Servlet implementation class doRegister
 */
@WebServlet("/doRegister")
public class doRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BaseDao connDB = new BaseDao();
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String search = "select * from Users where username = '"+username+"'";
		ResultSet rs = connDB.executeQuery(search);
		try {
			if(rs.next()!=false){
				//«∞∂ÀÃ· æ
				response.sendRedirect("register.jsp");
			}
			else{
				String sql="insert into Users(username, pwd) values('"+ username +"','"+ pwd +"')";  
				connDB.executeUpdate(sql); 
				request.getRequestDispatcher("Checkin").forward(request,response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
