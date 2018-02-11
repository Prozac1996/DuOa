<%@ page import="model.User" %>
<%@ page import="static java.awt.SystemColor.window" %><%--
  Created by IntelliJ IDEA.
  User: liufangzheng
  Date: 18-2-2
  Time: 上午10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>肚Oa-业务</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery.form.min.js"></script>


    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
    <script src="../js/script.js"></script>
    <link href="../css/style.css" rel="stylesheet">

    <link href="../css/bootstrap.css" rel="stylesheet">
    <script src="../js/bootstrap.js"></script>
    <script>

        $(document).ready(function () {

            $.ajax({
                url:"../data/reportMySelf",
                success:function(result){
                    var table = $('#table_id_example').DataTable({
                        data:result,
                        columns: [
                            { data: 'id' },
                            { data: 'title' },
                            { data: 'content' },
                            { data: 'state' }
                        ],
                        "order":[0,'desc'],
                        "oLanguage": {//插件的汉化
                            "sLengthMenu": "每页显示 _MENU_ 条记录",
                            "sZeroRecords": "抱歉， 没有找到",
                            "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                            "sInfoEmpty": "没有数据",
                            "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                            "oPaginate": {
                                "sFirst": "首页",
                                "sPrevious": "前一页",
                                "sNext": "后一页",
                                "sLast": "尾页"
                            },
                            "sZeroRecords": "没有检索到数据",
                            "sProcessing": "<img src='' />",
                            "sSearch": "搜索"
                        }
                    });
                    $('#table_id_example').on('click','tr',function () {
                        var data = table.row(this).data();
                        window.location.href = "../manage/detailEdit?id="+data.id;

                    });
                }
            })

            $("#submit").click(function () {
                if(!report_check())
                    return;
                $("#report_add").ajaxSubmit({
                    dataType:"json",
                    success:function(data){
                        if(data.flag){
                            alert(data.msg);
                            window.location.reload();
                        }else{
                            alert(data.msg);
                        }
                    }

                })
            });


        });

        function report_check() {
            var title = $("input[name='title']").val();

            if( title == '' ){
                alert("题目不可以为空!");
                return false;
            }
            return true;

        }

        function logout() {
            $.ajax({
               url:"../user/logout",
               success:function(result){
                   alert(result.msg);
                   if(result.flag){
                       window.location.reload();
                   }
               }
            });
        }

    </script>

</head>

<%
    User user = (User) session.getAttribute("user");
%>

<body>

<div class="container">
    <div class="row">
        <h1 class="col-md-9 col-xs-12">肚Oa</h1>
        <div id="top" class="col-md-3 col-xs-10 text-right" style="">
            欢迎——<%=user.get("username")%> !
            <div class="btn btn-danger" onclick="logout()">退出登录</div>
        </div>
    </div>
    <br/>
    <br/>
    <div class="row">
        <div class="col-md-4">
            <form id="report_add" action="../data/reportAdd" method="post">
                <input type="text" class="form-control" placeholder="提报题目" name="title">
                <br/>
                <textarea rows="20" id="content" name="content" class="form-control col-md-12" placeholder="提报内容"></textarea>
                <br/>
                <div id="submit" class="btn btn-primary col-md-12 col-xs-12">新增提报</div>
            </form>
        </div>

        <div class="col-md-8">
            <table id="table_id_example" class="hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>提报</th>
                    <th>内容</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>
