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
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery.form.min.js"></script>


    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
    <script src="../js/script.js"></script>

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


<div style="float: left;margin-right: 20px">
    <div id="top">肚Oa： 欢迎——<%=user.get("username")%> !
        <a href="javascript:void(0);" onclick="logout()">退出登录</a></div>
    <form id="report_add" action="../data/reportAdd" method="post">
        新增提报：
        <input id="title" name="title" type="text" placeholder="题目">
        <br/>
        <br/>
        <textarea id="content" name="content" style="width: 260px;height: 300px" placeholder="提报内容"></textarea>
        <br/>
        <br/>
        <input style="width: 100%" type="button" value="提交" id="submit">
    </form>
</div>

<div style="float: left; width: 70%;">
    我的提报：<br/>
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
</body>
</html>
