<%--
  Created by IntelliJ IDEA.
  User: liufangzheng
  Date: 2018/3/17
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试</title>

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/jquery.form.min.js"></script>

    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>

    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>

    <script>
        $(document).ready(function () {

            var table = $('#table_test').DataTable({
                columns: [
                    { "data": 'id' },
                    { "data": 'username' },
                    { "data": 'title' },
                    { "data": 'content' },
                    { "data": 'state' }
                ],
//                "order":[0,'desc'],
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
                "searchable":false,
                "ajax":"data/reportPageData"

            });

            $('#table_test').on('click','tr',function () {
                var data = table.row(this).data();
                window.location.href = "../manage/detailApprove?id="+data.id;

            })
        });
    </script>
</head>
<body>
    <table id="table_test" class="hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>提报人</th>
            <th>题目</th>
            <th>内容</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

</body>
</html>
