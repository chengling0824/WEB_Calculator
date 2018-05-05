<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>四则运算在线答题系统</title>

        <!-- CSS -->
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
		<link rel="stylesheet" href="./css/form-elements.css">
        <link rel="stylesheet" href="./css/login.css">



    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>四则运算</strong> 答题系统</h1>
                            <div class="description">
                            	<p>
	                            	随处可练的四则运算，一起来提升你的运算能力吧！你一定会喜欢这种方式的!
                            	</p>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">

                        		<div class="form-top-left">
                        			<h3>登录</h3>
                            		<p>请输入您的用户名和密码：</p>
                        		</div>

                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>

                            <div class="form-bottom">

			                    <form role="form" action="Checkin" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">用户名:</label>
			                        	<input type="text" name="username" placeholder="用户名..." class="form-username form-control" id="form-username">
			                        </div>

			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">密码：</label>
			                        	<input type="password" name="pwd" placeholder="密码..." class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn">登录</button>
			                    </form>
			                    <a href="register.jsp" class="btn"><button type="submit">注册</button></a>
		                    </div>
                        </div>
                    
                </div>
            </div>
            
        </div>
        
        <!-- Javascript -->
        <script src="./js/jquery.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/jquery.backstretch.min.js"></script>
        <script src="./js/scripts.js"></script>
        
    </body>

</html>