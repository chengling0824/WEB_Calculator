<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<!-- META -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- TITLE -->
<title data-localize="main.title">四则运算在线答题系统</title>

<!-- Main StyleSheet -->
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/index.css" />
<link rel="stylesheet" type="text/css" href="./fonts/font.css">

<!-- table -->
<link rel="stylesheet" type="text/css" href="./css/table.css">

<!-- External libraries: jQuery & GreenSock -->
<script type="text/javascript" src="./js/jquery.js" ></script>


<script type="text/javascript" src="./js/jquery.locale.js"></script>
<script type="text/javascript" src="./js/language-coockies.js"></script>



	
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

<!-- ----------------------导航栏--------------- -->
<div class="header">
	<div class="container">

	<h2 style="font-size: 36px; float: left; " data-localize="main.title">四则运算在线答题系统</h2>
	

	<div class="nav">
	<ul>
		<li><a href="./loginout.jsp"  data-localize="main.switchUsers">切换用户</a></li>

		<li><a href="./history.jsp" data-localize="main.history">查询历史题目</a></li>
		<li><a href="#zuoTiInput" data-localize="main.answer">做题</a></li>
	</ul>
	</div>
		<div class="select" align="right">
		 <select id="ddlSomoveLanguage" onchange="chgLang();" >  
		 		<option data-localize="main.select"></option>  
               <option value="zh">中文简体</option>  
               <option value="en">ENGLISH</option>  
               <option value="zh_cn">中文繁体</option>
           </select> 
           </div>

	</div>
</div>


<div class="wrapper">
<div class="box">

	<div class="ls-l" data-ls="offsetxin:0;delayin:1000;easingin:easeInOutQuart;scalexin:0.7;scaleyin:0.7;offsetxout:-800;durationout:1000;">
		<div class="videopreview" data-ls="offsetxin:-200;durationin:2000;offsetxout:-200;">
			<img src="images/timg.png" alt="" width="443px"/>
		</div>
		<div class="text">
		<h2 class="l1" data-localize="main.replyOnline">在线四则训练</h2>
		<h2 class="l2" data-localize="main.text1">无论何时何地都可以好好练习，你最好的选择！</h2>
	</div></div>

	<div class="button1" data-ls="offsetxin:0;delayin:1000;easingin:easeInOutQuart;scalexin:0.7;scaleyin:0.7;offsetxout:-800;durationout:1000;">
		<a href="#zuoTiInput" data-localize="main.bt1">开始训练！</a>
	</div>
	
</div>
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
					<input type="text" name="num_of_formula" value="10" id="numInfo">
				</li>
				<li>
					<label>算式最大值:</label>
					<input type="text" name="high" value="100" id="maxNumInfo">
				</li>
				<li>
					<label>算式最小值:</label>
					<input type="text" name="low" value="1" id="minNumInfo">
				</li>
				<li>
					<label>运算符数目：</label>
					<input type="text" name="maxmum_of_operation" value="5" id="numOperators">
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
		            	<input type="submit" value="提交" onclick='window.open("./replyonline.jsp")' />

		            	<input type="reset" value="重置" id="reset">
		            </div>
			</form></div>
		</div>
</div>

<script type="text/javascript">

$(function(){

	//添加必填标识
	$("form :input.required").each(function(){
            var $required = $("<strong class='high'> *</strong>"); //创建元素
            $(this).parent().append($required); //然后将它追加到文档中
    });

    $('form :input').blur(function(){
             var $parent = $(this).parent();
             $parent.find(".formtips").remove();
             //验证题目数量
             if( $(this).is('#numInfo') ){
                if( this.value=="" || this.value > 50 ){
                    var errorMsg = '一次最多只能做100道哦~）.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
             }
            //验证算式数值范围max
            if( $(this).is('#maxNumInfo') ){
                if( this.value=="" || this.value > 1000 || this.value < 50){
                     errorMsg = '数值上限应在50~1000.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
             }
             //min
             if( $(this).is('#minNumInfo') ){
                if( this.value=="" || this.value < 1 ||this.value > 100){
                     errorMsg = '数值下限应在1~100.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
             }
             //运算符数目
             if( $(this).is('#numOperators') ){
                if( this.value=="" || this.value < 1 || this.value > 10){
                     errorMsg = '运算符数目应在1~10.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
             }

         });
});
</script>


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
