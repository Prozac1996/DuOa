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
    <script src="jquery.form.min.js"></script>

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
                          window.location.href = "manage/bussiness";
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
  肚Oa-登录
  <br/>
  <form id="login_form" action="user/login" method="post">
    <label for="username">账号</label>
    <input id="username" name="username" type="text" placeholder="username"><br/>
    <label for="password">密码</label>
    <input id="password" name="password" type="password" placeholder="password"><br/>
    <input type="button" value="登录" id="login" >
    <input type="button" value="注册" onclick="register();">
  </form>
  </body>
</html>
