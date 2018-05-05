<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" class="com.BaseDao" scope="page"></jsp:useBean>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>四则运算在线答题-结果出来了</title>

    <link rel="stylesheet" href="./css/index.css" />
    <link rel="stylesheet" type="text/css" href="./fonts/font.css"> 

        <!-- 导航栏固定显示 -->
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
     .a2{
     color:green;
     font-size:20px;
     margin-top:50px;
     line-height:50px;
     text-align: center;
     }
     .f{
    margin-left: 200px;
    color: white;
    }
     </style>
  </head>
  
  <body>
  
  <div class="header">
  <div class="container">

        <a href="#">欢迎来到四则运算在线答题系统噢~</a>
        
        <div class="nav">
        <ul>
          <li><a class="a2" data-localize="index.REPLYAGAIN">重新答题</a></li>
          <li><a class="a2" data-localize="index.makeOutAgain">重新出题</a></li>
          <li><a class="a2" href="/index.html">首页</a></li>
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
<div class="txt">
  <form action="getResult?" method="post">
  <table  align="left" border='1' cellspacing='0'>
  <%
  String num_of_formula = request.getParameter("num_of_formula");
  int nf = Integer.parseInt(num_of_formula);
  	String sql0 = "select count(*) from Formula";
	ResultSet rs0 = connDB.executeQuery(sql0);
	rs0.next();
  	int total=rs0.getInt(1);
  	int start = total-nf+1;
  	String sql = "select * from Formula where id>="+String.valueOf(start)+"and id<="+total;
  	ResultSet rs = connDB.executeQuery(sql);
  	while(rs.next()){
		rs.next();
 %>
    <tr>
        <td>题目</td>
    </tr>
	<div id='myDiv'></div>
        <tr>
            <td><%=rs.getString("formula") %></td>
        </tr>
	    <tr>
	        <td>您的答案</td>
	    </tr>
	    <tr>
	        <td><input type="text" name="UserAns"></td>
	    </tr>
	    <input type="text" name="id" value=<%=rs.getString("id") %> style={display:none}/>
	    <input type="submit" value="提交" id="send"/>
    <% }%>
    </table>
	</form>
  </body>
</html>
