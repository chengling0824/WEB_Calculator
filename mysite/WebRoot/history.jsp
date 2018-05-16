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
<link rel="stylesheet" type="text/css" href="./fonts/font.css"> 

<script type="text/javascript" src="./js/replyonline/replyonline.js"></script>

<script type="text/javascript">
$(function() {
  $(window).scroll(function() {
    if($(this).scrollTop() >= 15) {
      $('.header').addClass("header_fix");  
    } else {
       $('.header').removeClass("header_fix");
    }
  }); 
});
</script>

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
.table{
  float: left;
  /*height: 320px;*/
  padding: 20px;
  text-align: center;
  background-color: #FFFAFA;
  margin-left: 140px;
  margin: 40px auto;
}
 table{
  text-align: center;
  
  border:solid #add9c0; 
  border-width:1px 0px 0px 1px;
}
.zhengql{
  float: left;
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
        <h2><a href="#">四则运算在线答题系统-答题记录</a></h2>
        <div class="yonghu"><p><%=session.getAttribute("User") %>你好</p></div>
        <div class="nav">
        <ul>
<!--           <li><p>,,,你好</p></li> -->
          <li><a href="./main.jsp">返回主页</a></li>
        </ul>
        </div>

  </div>



<div class="container">
  <div class="zhengql">
  <%
  	String sql = "SELECT TOP 1 per FROM Score where username='"+User+"' ORDER BY per DESC";
  	ResultSet rs = connDB.executeQuery(sql);
  	String best = "";
  	if(!rs.next()){
  		best = "您未做过题目";
  	}
  	else best=rs.getString(1);
  	
   %>
   
  </div>
  <div class="table">
<p style="color:red">最佳正确率：<%=best %></p>
  <form>
  

   <table style="color:black;">
    <tr>
        <td>题目</td>
        <td>您的答案</td>
        <td>正确答案</td>
    </tr>
      <%
  	sql = "select * from Formula where username='"+User+"'";
  	rs = connDB.executeQuery(sql);
  	while(rs.next()){
   %>
    <tr>
      <td><input type="text" name="quest" value="<%=rs.getString("formula") %>" readonly>  </td> 
      <% 
      String UserAns =  rs.getString("UserAns");
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
  <div class="visibility" style="visibility: hidden;">
    <input type="text" name="chuan">
  </div>
  

</div>
</div>
</div>


  </body>
</html>