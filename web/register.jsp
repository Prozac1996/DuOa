<%--
  Created by IntelliJ IDEA.
  User: liufangzheng
  Date: 18-2-2
  Time: 上午10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>肚Oa-注册</title>

    <script src="js/jquery-3.1.1.min.js"></script>

    <script>

        function register() {
            var username = $("input[name='username']").val();
            var password = $("input[name='password']").val();
            var password_again = $("input[name='password_again']").val();

            if(username == '' || password == '' || password_again == ''){
                alert("请完善信息后register!");
                return;
            }

            if(password != password_again){
                alert("not xiang tong");
                return;
            }

            $.ajax({
                url:"http://localhost:8888/user/register",
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

        function back(){
            window.location.href = "/";
        }
    </script>
</head>
<body>
肚Oa
<br/>
<input name="username" type="text" placeholder="username"><br/>
<input name="password" type="password" placeholder="password"><br/>
<input name="password_again" type="password" placeholder="password_again"><br/>
<input type="button" value="注册" onclick="register();">
<input type="button" value="返回" onclick="back();">
</body>
</html>
