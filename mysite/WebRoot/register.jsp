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
                        <h3>ע��</h3>
                          <p>�������û��������룺</p>
                      </div>

                      <div class="form-top-right">
                        <i class="fa fa-key"></i>
                      </div>
                      </div>

        <div class="form-bottom">

          <form action="doRegister" method="post"  namespace="/">

            <div class="form-group">
              <label class="sr-only" for="form-username">�û���:</label>
                <input type="text" name="username" placeholder="�û���..." required="" class="form-username form-control" id="form-username">
              </div>

              <div class="form-group">
                <label class="sr-only" for="form-password">���룺</label>
                <input type="password" name="pwd" placeholder="����..." required="" class="form-password form-control" id="form-password">
              </div>

                     <button type="submit" class="btn">ע��.</button>

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
        
    </body>


   
  </body>
</html>
