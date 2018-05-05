<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<!-- META -->
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- TITLE -->
<title>四则运算在线答题系统</title>

<!-- Main StyleSheet -->
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/index.css" />
<link rel="stylesheet" type="text/css" href="./fonts/font.css">

<script type="text/javascript" src="./js/jquery.js" ></script>
<script type="text/javascript" src="./js/slide.js"></script>

<!-- 未引入 不知道为啥子 -->
<script type="text/javascript" src="./js/zuoTiInput.js"></script>
<script type="text/javascript" src="./js/language-coockies.js"></script>
<script type="text/javascript" src="./js/jquery.locale.js"></script>
<script>
		$(document).ready(function(){
			$('#nav').zlightMenu();
		});
	</script>


	
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


</head>

<body>
<%=session.getAttribute("User") %>
<!-- ----------------------导航栏--------------- -->
<div class="header">
	<div class="container">

				<a href="#">欢迎来到四则运算在线答题系统噢~</a>
				
				<div class="nav">
				<ul>
					<li>
					</li>
					<li><a href="#zuoTiInput">做题</a></li>
					<li><a href="#features">查询历史题目</a></li>
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


<!-- 轮播 -->

	<div class="box">
			<div class="lunbo">
					<img src="./images/1.jpg">
					<img src="./images/2.jpg">
					<img src="./images/3.jpg">
					<ul>
						<li id="check"></li>
						<li></li>
						<li></li>
					</ul>
			</div>
			<a href="javascript:" class="left">&lt;</a>
			<a href="javascript:" class="right">&gt;</a>
		</div>

<!-- zuoTiInput -->
<div class ="zuoTiInput" id="zuoTiInput" >
	<div class="container">

				<h2>请选择你想要的题库：</h2>
				<h4>One machine can do the work of fifty ordinary men. No machine can do the work of one extraordinary man</h4>
				
				<div class="table">
			<form action="servlet/getParam" method="post">
			<li>
				<label>题目数量：</label>
				<input type="text" name="num_of_formula" value="20">
			</li>
			<li>
				<label>算式最大值:</label>
				<input type="text" name="high" value="100">
			</li>
			<li>
				<label>算式最小值:</label>
				<input type="text" name="low" value="1">
			</li>
			<li>
				<label>运算符数目：</label>
				<input type="text" name="maxmum_of_operation" value="1">
			</li>
			<li>
				<label>是否包含乘除法:</label>
				<label>无<input type="radio" name="kind_of_operation" value="2" checked="checked"></label>
				<label>有<input type="radio" name="kind_of_operation" value="4"></label>
			</li>
			<li>
				<label>是否包含括号:</label>
				<label>无<input type="radio" name="isBracket" value="0" checked="checked"></label>
				<label>有<input type="radio" name="isBracket" value="1"></label>
			</li>

	            <div class="sub">
	            	<input type="submit" value="提交" id="send">
	            	<input type="reset" type="reset" id="reset">
	            </div>
		</form>
			</div>
		</div>
</div>




<!-- 网站自适应 -->
<script type="text/javascript">

$(document).ready(function() {

	if($(window).width() <= 1200){
	$(function() {
		$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
		var target = $(this.hash);
		target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
		if (target.length) {
		$('html,body').animate({
		scrollTop: target.offset().top - 132
		}, 2000);
		return false;
		}
		}
		});
	});

	}

	});

</script> 
	 


</body>
</html>
