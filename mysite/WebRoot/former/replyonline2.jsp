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
<link rel="stylesheet" type="text/css" href="./css/style.css">

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/replyonline/replyonline.js"></script>
<script type="text/javascript" src="./js/replyonline/quiz.js"></script>

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

.main{
  background:url(./images/bg1.jpg) no-repeat;
  opacity: 0.9;
  filter:alpha(opacity=50); 
  color: white;
   width:100%;  
  height:100%;  
  background-size:100% 100%; 
}
.yonghu{
  margin:17px;
  float: left;
}
a{
  color: white;
}
.face {
  text-align: right;
  margin-right: 20px;
  /*margin: 20px;*/
  color: black;
  /*background-color: #FFFFF0;*/
  margin-bottom: 60px;
}

.face p {
  font-size: 30px;
}
td{
  border:solid  #D3D3D3; 
  border-width:1px; 
  padding:12px 0px;
  /*color: #FFFFF0;*/
}
.table{
  float: left;
  height: 320px;
  padding: 20px;
  text-align: center;
  background-color: #FFFAFA;
  margin-left: 180px;
}
 form table{
  float: left;
  margin: 20px 66px;
  border:solid #add9c0;
   text-align: center;
  border-width:1px 0px 0px 1px;
  margin-bottom: 30px;
}

button{
  margin: 20px;
}
button a{
  color: black;
}
.button{
  margin-left: 220px;
  margin-top: 60px;
}
.bt{
  float: left;
  margin-left: 20px;
}

 </style>
</head>
  
  
<body>
<div class="main">
  <div class="header">
  <div class="container">

        <h2><a href="#">四则运算在线答题系统-在线答题</a></h2>
        <div class="yonghu"><p>,,,你好</p></div>
        <div class="nav">
        <ul>
          <li><a href="./main.jsp">放弃答题</a></li>
        </ul>
        </div>
        <button><a href="./loginout.jsp">账号注销</a></button>

          <div class="select" align="right">
          <select id="ddlSomoveLanguage" onchange="chgLang();" >  
            <option data-localize="index.select"></option>  
                   <option value="zh">中文简体</option>  
                   <option value="en">ENGLISH</option>  
                   <option value="zh_cn">中文繁体</option>
               </select> 
               </div>
  </div>
</div>



<div class="container">
  

  <div class="table" >
<!-- 计时器 -->
  <form action="MathAction!submitAnswers.action"  method="post" namespace="/">
  <div class="face" >
       <p id="lazy"  >00:00:00</p> 
       <input type="hidden" id="timer" name="lazy"></input> 
  </div>
  </form>
<!-- 计时器结束 -->

  <input type="submit" align="middle" value="上一题" name="last" style="float: left;"></input>
  <div style="float: left; margin-left: 240px; color: black;">第x题</div>
  <input type="submit" align="middle" value="下一题" name="next" style="float: right;"></input>

  <form action="getResult" method="post" >
  <table>
  <%
	  	String User = (String)session.getAttribute("User");
		int id=(int)session.getAttribute("id");
	  	String sql = "select * from Formula where id="+id+"and username = '"+User+"'";
	  	ResultSet rs = connDB.executeQuery(sql);
	  	while(rs.next()){
	 %>
    <tr>
        <td>题目</td>
        <td>你的答案</td>
        <td>正确与否</td>
    </tr>
    <tr>
      <td><%=rs.getString("formula") %></td>
      <td><input type="text" name="UserAns"></td>
    </tr>
    </table>
     <% }%>
      <div class="visibility" style="visibility: hidden;">
    <input type="text" name="chuan">
  </div>
  
    <div class="button">
      <input type="submit" name="ok" value="提交" class="bt">
      <input type="submit" name="give_answer" value="显示答案" class="bt">
  </div>
  </form>
 
 </div>
</div>
</div>


  </body>
</html>