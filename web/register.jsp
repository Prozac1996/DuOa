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
    <script src="js/jquery.form.min.js"></script>

    <script>

        $(document).ready(function () {
            $("#register").click(function () {

                if(!register_check())
                    return;
                $("#register_form").ajaxSubmit({
                    dataType:"json",
                    success:function(data){
                        if(data.flag){
                            alert(data.msg);
                        }else{
                            alert(data.msg);
                        }
                    }

                })
            });

            
        });


        function register_check() {
            var username = $("input[name='username']").val();
            var password = $("input[name='password']").val();
            var password_again = $("input[name='password_again']").val();

            if(username == '' || password == '' || password_again == ''){
                alert("請完善信息后再注册!");
                return false;
            }

            if(password != password_again){
                alert("两次密码输入不相同！");
                return false;
            }
            return true;

        }

        function back(){
            window.location.href = ".";
        }
    </script>
</head>
<body>
肚Oa-注册
<br/>
<form id="register_form" action="user/register" method="post">
    <label for="username">账号</label>
    <input id="username" name="username" type="text" placeholder="username"><br/>
    <label for="password">密码</label>
    <input id="password" name="password" type="password" placeholder="password"><br/>
    <label for="password_again">重复密码</label>
    <input id="password_again" name="password_again" type="password" placeholder="password_again"><br/>
    <input type="button" value="注册" id="register">
    <input type="button" value="返回" onclick="back()">
</form>
</body>
</html>
