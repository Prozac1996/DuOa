<%--
  Created by IntelliJ IDEA.
  User: liufangzheng
  Date: 18-2-2
  Time: 上午9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>肚Oa</title>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/jquery.form.min.js"></script>
    <link rel="stylesheet" href="css/style.css" type="text/css" >
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" media="screen" href="css/style-bg.css">


    <script>

      $(document).ready(function () {
          $("#login").click(function () {
              if(!login_check())
                  return;
              $("#login_form").ajaxSubmit({
                  dataType:"json",
                  success:function(data){
                      if(data.flag){
                          alert(data.msg);
                          switch(data.index){
                              case 0:
                                  window.location.href = "manage/bussiness";
                                  break;
                              case 1:

                                  break;
                              case 2:
                                  window.location.href = "manage/console";
                                  break;
                          }
                      }else{
                          alert(data.msg);
                      }
                  }
              })
          });
      })

      function register() {
          window.location.href = "register"
      }

      function login_check() {
          var username = $("input[name='username']").val();
          var password = $("input[name='password']").val();

          if(username == '' || password == ''){
              alert("请完善信息后login!");
              return false;
          }
          return true;
      }
    </script>

  </head>
  <body>
  <div id="particles-js">
    <div class="container" style="position: absolute;">
      <div id="div_login" class="text-center">
        <font size="10">肚Oa-登录</font>
        <form id="login_form" action="user/login" method="post">
          <div class="input-group">
            <span class="input-group-addon" id="username_addon">账号</span>
            <input type="text" class="form-control" placeholder="Username" name="username" aria-describedby="username_addon">
          </div>
          <div class="input-group">
            <span class="input-group-addon" id="password_addon">密码</span>
            <input type="password" class="form-control" placeholder="Password" name="password" aria-describedby="password_addon">
          </div>
          <br/>
          <%--<label for="username">账号</label>--%>
          <%--<input id="username" name="username" type="text" placeholder="username"><br/>--%>
          <%--<label for="password">密码</label>--%>
          <%--<input id="password" name="password" type="password" placeholder="password"><br/>--%>
          <div class="btn btn-primary col-md-12" id="login">登录</div>
          <br/>
          <br/>
          <div class="btn btn-success col-md-12" onclick="register();">注册</div>
        </form>
      </div>
    </div>
  </div>
  <script src="js/particles.js"></script>
  <script src="js/app.js"></script>
  </body>
</html>
