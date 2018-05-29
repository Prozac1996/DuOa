<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: liufangzheng
  Date: 18-2-7
  Time: 下午3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>肚Oa-控制台</title>

    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery.form.min.js"></script>

    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
    <script src="../js/script.js"></script>

    <link href="../css/bootstrap.css" rel="stylesheet">
    <script src="../js/bootstrap.js"></script>


    <%--<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css">--%>
    <%--<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>--%>

    <script>

        $(document).ready(function () {

            var table = $('#table_report').DataTable({
                columns: [
                    { "data": 'id' },
                    { "data": 'username' },
                    { "data": 'title' },
                    { "data": 'content' },
                    { "data": 'dateTime'},
                    { "data": 'state' }
                ],
                columnDefs : [{
                    orderable:false,//禁用排序
                    targets:[1,2,3]   //指定的列
                }
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
                    "sProcessing": "正在加载中",
                    "sSearch": "搜索"
                },
                "lengthChange":false,
                "processing":true,
                "serverSide":true,
                "searchable":true,
                "ajax": {
                    "url":"../data/reportPageData"
                },

            });

            $('#table_report').on('click','tr',function () {
                var data = table.row(this).data();
                window.location.href = "../manage/detailApprove?id="+data.id;

            })
        });

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
//    String userId = (String) session.getAttribute("userId");
//    String userPower = (String) session.getAttribute("userPower");
%>
<body>
    <div class="container">
        <div class="row">
            <h1 class="col-md-4">肚Oa</h1>
            <div id="top" class="col-md-offset-5 col-md-3 text-right" style="margin-top: 20px">
                欢迎——<%=user.get("username")%> !
                <div class="btn btn-danger" onclick="logout()">退出登录</div>
            </div>
        </div>
        <table id="table_report" class="hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>提报人</th>
                <th>题目</th>
                <th>内容</th>
                <th>时间</th>
                <th>状态</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</body>
</html>
