<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" class="com.BaseDao" scope="page"></jsp:useBean>

<html>
<head>
<!-- META -->
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TITLE -->
<title>四则运算在线答题系统</title>

<link rel="stylesheet" href="./css/index.css" />

<script type="text/javascript" src="./js/jquery.js"></script>


<style type="text/css">

body{
  background:url(./images/bg2.jpg) repeat-y;
  opacity: 0.9;
  filter:alpha(opacity=80); 
  color: white;
   width:100%;  
  background-size:100% auto;
}
.yonghu{
  margin:17px;
  float: left;
}
a{
  color: white;
}
td{
  border:solid #add9c0; 
  border-width:0px 1px 1px 0px; 
  padding:10px 0px;
  /*color: #FFFFF0;*/
}
td{
  border:solid  #D3D3D3; 
  border-width:1px; 
  padding:12px 0px;
  /*color: #FFFFF0;*/
}
.time{
  background-color:grey;
  float:left;
  margin-left:390px;
}
.table{
  color:black;
  float: left;
  padding: 20px;
  text-align: center;
  background-color: #FFFAFA;
  margin-left: 120px;
}
 table{
 float:left;
  text-align: center;
  margin: 0px auto;
  border:solid #add9c0; 
  border-width:1px 0px 0px 1px;
}
button{
  margin: 20px;
}
button a{
  color: black;
}

 </style>
 
</head>
  
  
<body>
<div class="main">
  <div class="header">
  <div class="container">
		<%
		String User = (String)session.getAttribute("User");
		if(User==null){
			%>
				<script>alert("请登录");
				window.location.href="index.jsp"; 
				</script>
			<%
		}
			
	 %>
        <h2><a href="#" style="text-decoration:none">四则运算在线答题系统-在线答题</a></h2>
        <div class="yonghu"><p><%=session.getAttribute("User") %>你好</p></div>
        <div class="nav">
        <ul>
          <li><a href="./main.jsp">返回首页</a></li>
        </ul>
        </div>
  </div>
</div>



<div class="container">
  <div class="table">
   <%
   		String sql = "select count(*) from Formula where username='"+User+"' and id>="+session.getAttribute("startID");
   		ResultSet rs = connDB.executeQuery(sql);
   		rs.next();
   		int total = rs.getInt(1);
   		sql = "select count(*) from Formula where username='"+User+"' and UserAns=RightAns and id>="+session.getAttribute("startID");
   		rs = connDB.executeQuery(sql);
   		rs.next();
   		int right = rs.getInt(1);
   		double per = right*10/(10.0*total);
   		sql = "insert Score(username, per) values('"+User+"', "+per+")";
   		connDB.executeUpdate(sql); 
   		sql = "SELECT TOP 1 per FROM Score ORDER BY id DESC";
   		rs = connDB.executeQuery(sql);
   		rs.next();
    %>
    <div class="time" >
	  <form>
	  <table >
	    <tr>
	        <td>用时</td>
	        <td>正确率</td>
	    </tr>
		<tr>
	        <td><%=session.getAttribute("startTime") %></td>
	        <td><%=rs.getString(1) %></td>
	    </tr>
	  </table></form></div>
	  
	  <div class="table" style="float:left;margin:0 80px;">
	  <form>
	  <table>
	 <tr>
        <td style="color:red">错误题目</td>
        <td>您的答案</td>
        <td>正确答案</td>
    </tr>
   <%
  	sql = "select * from Formula where username = '"+User+"' and id>="+session.getAttribute("startID")+" except(select * from Formula where username = '"+User+"' and UserAns=RightAns and id>="+session.getAttribute("startID")+")";
  	rs = connDB.executeQuery(sql);
  	while(rs.next()){
   %>
    <tr>
      <td><input type="text" name="quest" value="<%=rs.getString("formula") %>" readonly>  </td> 
      <% String UserAns =  rs.getString("UserAns");
      	if(UserAns==null)
      		UserAns = "您未答此该题";
      %>
      <td><input type="text" name="answer" value="<%=UserAns%>"></td> 
      <td><input type="text" name="result" value="<%=rs.getString("RightAns")%>"> </td> 
    </tr>
    <%} %>
    <tr>
    	<td colspan="3" style="width:1000px;color:red;">到底啦~</td>
    </tr>
    </table>
	  </form>
</div>

 </div>
</div>
</div>


  </body>
</html>