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
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/jq-load.js"></script>
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
  margin: 20px 180px;
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
  margin:60px 220px;
  margin-top: 60px;
}
.bt{
  -webkit-transition: all 300ms cubic-bezier(0.19, 1, 0.22, 1);
  transition: all 300ms cubic-bezier(0.19, 1, 0.22, 1);
  -webkit-transform: translateX(47px);
  will-change: transform;
  z-index: 3;
  overflow: hidden;
  border-radius: 40px;
  padding: 12px 15px;
  background: #43CB9D;
  color: white;
  font-size: 16px;
  font-weight: 500;
  letter-spacing: 1px;
  line-height: 1;
  text-transform: uppercase;
}
.bt:before {
  -webkit-transition: opacity 300ms ease-out, -webkit-transform 0ms 300ms;
  transition: opacity 300ms ease-out, -webkit-transform 0ms 300ms;
  transition: opacity 300ms ease-out, transform 0ms 300ms;
  transition: opacity 300ms ease-out, transform 0ms 300ms, -webkit-transform 0ms 300ms;
  opacity: 0;
  -webkit-transform-origin: center center;
          transform-origin: center center;
  -webkit-transform: scale(0);
          transform: scale(0);
  will-change: transform, opacity;
  content: "";
  display: block;
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #3FE2D9;
  border-radius: 40px;
}
.bt{
  float: left;
}

.formtips{
	width: 200px;
	margin:2px;
	padding:2px;
}
.onError{
    background:#FFE0E9 url(./images/reg3.gif) no-repeat 0 center;
	padding-left:25px;
}
.onSuccess{
    background:#E9FBEB url(./images/reg4.gif) no-repeat 0 center;
	padding-left:25px;
}
.high{
    color:red;
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
        <h2><a href="#">四则运算在线答题系统-在线答题</a></h2>
        <div class="yonghu"><p><%=session.getAttribute("User") %>你好</p></div>
        <div class="nav">
        <ul>
          <li><a href="./main.jsp">放弃答题</a></li>
        </ul>
        </div>



</div>



<div class="container">
  <div class="table" >
<header>
 <nav>
<%
	String qs = request.getQueryString();
	int id = Integer.parseInt(qs.split("=")[1]);
	int start = (int)session.getAttribute("startID");
	String sql = "select count(*) from Formula";
	ResultSet rs = connDB.executeQuery(sql);
	rs.next();
	int total = rs.getInt(1);
	if(id>total){
%>
		<script>
			alert("URL错误");
			window.location.href="main.jsp";
		</script>
<%}
	if(id>start){
%>
		<a href="replyonline.jsp?id=<%=id-1 %>" class="current" style="float: left;color:black;">上一题</a>
	<%} 
		else{
			%>
			<a class="current" style="float: left;color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			<%
		}
	%>
		<div style="float: left; margin-left: 240px; color: black;">第<%=id %>题</div>
	<% if(id<total){ %>
		<a href="replyonline.jsp?id=<%=id+1 %>" style="float: right;color:black;">下一题</a>
	<%}%>
</nav>
</header>
  <section id="content">
   <div id="container">
	  <form action="getResult" method="post" onSubmit="return check()">
	   <%
		  	sql = "select * from Formula where id="+id+"and username = '"+User+"'";
		  	rs = connDB.executeQuery(sql);
		  	while(rs.next()){
		 %>
	  <table>
	    <tr>
	        <td>题目</td>
	        <td>你的答案</td>
	    </tr>
	    <tr>
	      <td><%=rs.getString("formula") %></td>
	      <td><input type="text" name="UserAns" id="qs" required="" ></td>
	    </tr>
	  </table>
	     <% }%>
	     <div class="visibility" style="visibility: hidden;">
    		<input type="text" name="qs"  value="<%=request.getQueryString() %>">
  		</div>
	    <div class="button">
	      <input type="submit" name="ok" value="提交" class="bt" id="submit">
	  	</div>
	  </form>
	  <script type="text/javascript">
$(function check(){
	//添加必填标识
	$("form :input.required").each(function(){
            var $required = $("<strong class='high'> *</strong>"); //创建元素
            $(this).parent().append($required); //然后将它追加到文档中
    });

    $('form :input').blur(function(){
             var $parent = $(this).parent();
             $parent.find(".formtips").remove();
             
             //验证答案为数字
             if( $(this).is('#qs') ){
                if( this.value=="" || (this.value!="" && !/^\+?[1-9][0-9]*$/.test(this.value))){
                    var errorMsg = '只能填数字哦~';
                    $parent.append('<br/><span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    return false;
                }else{
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                    $("#submit").attr('type','submit');  
                }
             }
            
		});
		})
	</script>
</div>
</section>

 </div>
</div>
</div>


  </body>
</html>