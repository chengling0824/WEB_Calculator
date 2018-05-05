<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" class="com.BaseDao" scope="page"></jsp:useBean>

<html>
  <head>
    
    <title>四则运算在线答题系统</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="./css/index.css" />
    <link rel="stylesheet" type="text/css" href="./fonts/font.css"> 

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
  </head>
  
  
  <body>
  
  <div class="header">
  <div class="container">

        <a href="#">四则运算在线答题系统~</a>
        
        <div class="nav">
        <ul>
          <li>
          </li>
          <li><a href="replyonline.jsp">下一题</a></li>

          <li><a>提交</a> </li>

          <li><a href="">主页</a></li>
        </ul>
        </div>

          <div class="select" align="right">
          <select id="ddlSomoveLanguage" onchange="chgLang();" >  
            <!-- <option data-localize="index.select"></option>   -->
                   <option data-localize="index.select" value="zh">中文简体</option>  
                   <option value="en">ENGLISH</option>  
                   <option value="zh_cn">中文繁体</option>
               </select> 
               </div>
  </div>
</div>

<div class="container">
<section id = "content">
  <div class="table" id="container">
		<form action="getResult" method="post" >
	  <%
	  	String User = (String)session.getAttribute("User");
		int id=(int)session.getAttribute("id");
	  	String sql = "select * from Formula where id="+id+"and username = '"+User+"'";
	  	ResultSet rs = connDB.executeQuery(sql);
	  	while(rs.next()){
	 %>
	  <table>
	    <tr>
	      <td><%=rs.getString("formula") %> </td> 
	      <td><input type="text" name="UserAns"></td>
	      <td><input type="submit" value="提交" id="send"/></td>
	    </tr>
	   	<input type="text" name="id" value=<%=rs.getString("id") %> style="{display:none}"/>
	    </table>
	   <% }%>
	  </form>
  		<div class="visibility" style="visibility: hidden;">
    		<input type="text" name="chuan">
  		</div>
	</div>
</section>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jq-load.js"></script>
</div>



  </body>
</html>
