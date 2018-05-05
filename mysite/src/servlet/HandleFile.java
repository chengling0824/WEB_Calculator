package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.fileupload.FileItem;

import com.BaseDao;

/**
 * Servlet implementation class getFile
 */
@WebServlet("/HandleFile")
public class HandleFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	 	HttpSession session = request.getSession();
	 	String User = (String) session.getAttribute("User");
	 	if(User==null){
	 		response.sendRedirect("/index.jsp");
	 	}
	 	
	 	
		String filePath = this.getServletContext().getRealPath("/WEB-INF/upload")+"/input.txt";
		File filename = new File(filePath); // 要读取以上路径的input.txt文件
		InputStreamReader reader = new InputStreamReader(
				new FileInputStream(filename)); // 建立一个输入流对象reader
		BufferedReader br = new BufferedReader(reader); // 建立一个对象，它把文件内容转成计算机能读懂的语言
		String line = "";
		line = br.readLine();
		
		
		BaseDao connDB = new BaseDao();
		String sql0 = "select count(*) from Formula";
		ResultSet rs0 = connDB.executeQuery(sql0);
		int start = 0;
		try {
			rs0.next();
			start = rs0.getInt(1);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		start++;
		while (line != null) {
			int ans=-1;
			line = line.replace('÷', '/');
			try{
				ScriptEngineManager manager = new ScriptEngineManager();
				ScriptEngine se = manager.getEngineByName("js");
				ans = (Integer) se.eval(line);
				line = line.replace('/', '÷')+"=";
				//write into database
				String sql="insert into Formula(username, formula, RightAns) values('"+ User +"','"+ line +"','"+ ans +"')";  
			    connDB.executeUpdate(sql); 
			}catch(ScriptException e){
				e.printStackTrace();
			}
			
		    //read next line
			line = br.readLine();
		}

		long startTime = Calendar.getInstance().getTimeInMillis();
		session.setAttribute("startID",	start);
		session.setAttribute("startTime",startTime);
	    connDB.closeStmt();         
	    connDB.closeConn();
	    response.sendRedirect("../replyonline.jsp?id="+start);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
