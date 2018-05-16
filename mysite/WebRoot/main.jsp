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
<link rel="stylesheet" type="text/css" href="./css/style.css">
<!-- External libraries: jQuery & GreenSock -->
<script type="text/javascript" src="./js/jquery.js" ></script>
<script type="text/javascript" src="./js/jquery.min.js" ></script>
<script type="text/javascript" src="./js/index.js" ></script>
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
	<%
		String User = (String)session.getAttribute("User");
		if(User==null){
			%>
				<script>
				alert("请登录");
				window.location.href="index.jsp"; 
				</script>
			<%
		}

	 %>
	<div class="nav">
	<ul>
		<li><a href="./loginout.jsp" data-localize="main.switchUsers">切换用户</a></li>
		<li><a href="./history.jsp" data-localize="main.history">查询历史题目</a></li>
		<li id="sctm"><a href="#upload" data-localize="main.sc" >上传题目</a></li>
		<li><a href="#zuoTiInput" data-localize="main.answer">在线做题</a></li>
		
	</ul>

	<script>
		$("#sctm").click(function(){
			$("#upload").css("display","block");
	});
	</script>
	</div>
		<div class="select" align="right">
		 <select id="ddlSomoveLanguage" onchange="chgLang();" >  
		 		<option data-localize="main.select"></option>  
               <option value="zh">中文简体</option>  
               <option value="en">ENGLISH</option>  

           </select> 
           </div>

	</div>
</div>


<!-- ----------------------主页显示--------------- -->
<div class="wrapper">
<div class="box">

	<div class="ls-l" data-ls="offsetxin:0;delayin:1000;easingin:easeInOutQuart;scalexin:0.7;scaleyin:0.7;offsetxout:-800;durationout:1000;">
		<div class="videopreview" data-ls="offsetxin:-200;durationin:2000;offsetxout:-200;">
			<img src="images/timg.png" alt="" width="443px"/>
		</div>
		<div class="text">
		<h2 class="l1" data-localize="main.replyOnline">在线四则训练</h2>
		<h2 class="l2" data-localize="main.text1">无论何时何地都可以好好练习，你最好的选择！</h2>	
	</div>
	</div>



</div>
</div>


<!-- ----------------------上传题目--------------- -->

<div class="container sctm" id="upload" style="display:none;">
			<form action="servlet/UploadHandleServlet" enctype="multipart/form-data" method="post">
			        <h2>我要自己上传题目: </h2>
			        <h4>One machine can do the work of fifty ordinary men. No machine can do the work of one extraordinary man</h4>
			<div class="table1" > 
			        	<li>上传题目：<input   type="file" name="file"></li>
			       
			       <div> <input  class="sub rkmd-btn btn-lightBlue ripple-effect" type="submit" value="提交"></div>
			</div>   
			</form>
</div>


<!-- ----------------------在线答题--------------- -->
<div class ="zuoTiInput" id="zuoTiInput" >
	<div class="container">

				<h2 data-localize="main.title2">请选择你想要的题库：</h2>
				<h4>One machine can do the work of fifty ordinary men. No machine can do the work of one extraordinary man</h4>
				
				<div class="table2">
				
				
			    
			<form action="servlet/getParam" method="post" onSubmit="return check()">
			
				<li>
					<label data-localize="numInfo">题目数量：</label>
					<input type="text" name="num_of_formula" required="" value="10" id="numInfo">
				</li>
				<li>
					<label data-localize="maxNumInfo">算式最大值:</label>
					<input type="text" name="high" value="100" required="" id="maxNumInfo">
				</li>
				<li>
					<label data-localize="minNumInfo">算式最小值:</label>
					<input type="text" name="low" value="1" required="" id="minNumInfo">
				</li>
				<li>
					<label data-localize="numOperators">运算符数目：</label>
					<input type="text" name="maxmum_of_operation" required="" value="1" id="numOperators">
				</li>
				<li>
					<label data-localize="chengchu">是否包含乘除法:</label>
					<label>无<input type="radio" name="kind_of_operation" value="2" checked="checked"></label>
					<label>有<input type="radio" name="kind_of_operation" value="4"></label>
				</li>
				<li>
					<label data-localize="kuohao">是否包含括号:</label>
					<label>无<input type="radio" name="isBracket" value="0" checked="checked"></label>
					<label>有<input type="radio" name="isBracket" value="1"></label>
				</li>

		            <div class="sub">
		            	<input  class="rkmd-btn btn-lightBlue ripple-effect" type="button" value="提交" id="submit" data-localize="submit">

		            	<input  class="rkmd-btn btn-lightBlue ripple-effect" type="reset" value="重置" id="reset" data-localize="reset">
		            </div>
			</form></div>
		</div>
</div>

<script type="text/javascript">
$(function check(){
var a=new Array();
for(i=0;i<5;i++)
	a[i]=false;
	//添加必填标识
	$("form :input.required").each(function(){
            var $required = $("<strong class='high'> *</strong>"); //创建元素
            $(this).parent().append($required); //然后将它追加到文档中
            
    });

    $('form :input').blur(function(){
             var $parent = $(this).parent();
             var $max = $('#maxNumInfo').val();
             $parent.find(".formtips").remove();
             
             
             
             //验证题目数量
             if( $(this).is('#numInfo') ){
                if( this.value=="" || this.value > 100 ){
                    var errorMsg = '一次建议只做100题哦~.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[0]=false;
                    return false;
                }else if(this.value!="" && !/^\+?[1-9][0-9]*$/.test(this.value)){
                	var errorMsg = '不要皮，请输入数字~.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[0]=false;
                    return false;
                }
                else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                    a[0]  =true;
                    
                     
                }
             }
            //验证算式数值范围max
            
            if( $(this).is('#maxNumInfo') ){
            	
                if( this.value=="" || this.value > 1000 || this.value < 50){
                     errorMsg = '数值上限应在50~1000.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[1]=false;
                    return false;
                }
                else if(this.value!="" && !/^\+?[1-9][0-9]*$/.test(this.value)){
                	var errorMsg = '不要皮，请输入数字~.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[1]=false;
                    return false;
                }
                else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                    a[1]  =true;
                    
                }
             }
             
             //min
             if( $(this).is('#minNumInfo') ){
             	
                if( this.value=="" || this.value < 1 ||this.value > 100){
                     errorMsg = '数值下限应在1~100.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[2]=false;
                    return false;
                }
                else if(this.value!="" && !/^\+?[1-9][0-9]*$/.test(this.value)){
                	var errorMsg = '不要皮，请输入数字~.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[2]=false;
                    return false;
                }
                else if(this.value>=$max){
                	errorMsg = '数值下限应小于上限.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[2]=false;
                    return false;
                }
                else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                    a[2]  =true;
                }
             }
             //运算符数目
             if( $(this).is('#numOperators') ){
                if( this.value=="" || this.value < 1 || this.value > 10||(this.value!="" && !/^\+?[1-9][0-9]*$/.test(this.value))){
                     errorMsg = '运算符数目应在1~10.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[3]=false;
                    return false;
                }
                else if(this.value!="" && !/^\+?[1-9][0-9]*$/.test(this.value)){
                	var errorMsg = '不要皮，请输入数字~.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    $("#submit").attr('type','button');  
                    a[3]=false;
                    return false;
                }
                else{
                    var okMsg = '输入正确.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                    a[3]  =true;
                }
             }
            
});
		$("#submit").click(function(){
            if(a[0]&&a[1]&&a[2]&&a[3]){
            	$("#submit").attr('type','submit'); 
            }
		});
})
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
