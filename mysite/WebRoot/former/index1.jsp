<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>


<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>�����������ߴ���ϵͳ</title>

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
                    <h1><strong>��������</strong> ����ϵͳ</h1>
                    <div class="description">
                    	<p>
                        	�洦�������������㣬һ��������������������ɣ���һ����ϲ�����ַ�ʽ��!
                    	</p>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-sm-6 col-sm-offset-3 form-box">
                	<div class="form-top">

                		<div class="form-top-left">
                			<h3>��½</h3>
                    		<p>�����������û��������룺</p>
                		</div>

                		<div class="form-top-right">
                			<i class="fa fa-key"></i>
                		</div>
                    </div>

                    <div class="form-bottom">

	                    <form role="form" action="Checkin" method="post" class="login-form">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="form-username">�û���:</label>
	                        	<input type="text" name="username" value= "�û���..." class="form-username form-control" id="form-username">
	                        </div>

	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">���룺</label>
	                        	<input type="password" name="password" value ="����..." class="form-password form-control" id="form-password">
	                        </div>
	                        <div type="submit" class="btn" id="login">��½!
                            </div>
                             <div type="submit" class="btn" id="register">ע��.</div>
	                    </form>
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

<script type="text/javascript">
$("#login").click(function(){
     var name=$("#form-username").val();
     var pass=$("#form-password").val();
     if(name=="sc.chinaz.com" && pass=="sc.chinaz.com")
     {
      alert("��¼�ɹ���");
      $("#form-username").val("");
      $("#form-password").val("");

     }else{
      alert("�û������������");
     }
});

</script>

    </body>

</html>