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

    <link rel="stylesheet" href="css/style.css" type="text/css" >
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" media="screen" href="css/style-bg.css">

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
<div id="particles-js">
    <div class="container" id="container" style="position:absolute;">
        <div id="div_register" class="text-center">
            <font size="10" color="white">肚Oa-注册</font>
            <form id="register_form" action="user/register" method="post">
                <div class="input-group">
                    <span class="input-group-addon" id="username_addon">账号</span>
                    <input type="text" class="form-control" placeholder="Username" name="username" aria-describedby="username_addon" autocomplete="off">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="password_addon">密码</span>
                    <input type="password" class="form-control" placeholder="Password" name="password" aria-describedby="password_addon" autocomplete="off">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="password_again_addon">重复密码</span>
                    <input type="password" class="form-control" placeholder="Password_again" name="password_again" aria-describedby="password_again_addon" autocomplete="off">
                </div>
                <br/>
                <div class="btn btn-success col-md-12" id="register">注册</div>
                <br/>
                <br/>
                <br/>
                <div class="btn btn-default col-md-12" onclick="back();">返回</div>
            </form>
        </div>
    </div>
</div>
<script src="js/particles.js"></script>
<script src="js/app.js"></script>
</body>
</html>
