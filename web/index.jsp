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
    <script>
      function register() {
          window.location.href = "register"
      }

      function login() {
          var username = $("input[name='username']").val();
          var password = $("input[name='password']").val();

          if(username == '' || password == ''){
              alert("请完善信息后login!");
              return;
          }

          $.ajax({
              url:"http://localhost:8888/user/login",
              type:"post",
              data:{
                  username:username,
                  password:password
              },
              success:function(result){
                  alert(result);
              }

          })
      }
    </script>

  </head>
  <body>
  肚Oa
  <br/>
  <input name="username" type="text" placeholder="username"><br/>
  <input name="password" type="password" placeholder="password"><br/>
  <input type="button" value="登录" onclick="login();">
  <input type="button" value="注册" onclick="register();">
  </body>
</html>
