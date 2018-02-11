<%@ page import="model.Report" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: liufangzheng
  Date: 18-2-7
  Time: 下午4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>肚Oa-编辑</title>
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery.form.min.js"></script>

    <link href="../css/bootstrap.css" rel="stylesheet">
    <script src="../js/bootstrap.js"></script>

    <script>

        function update() {
            var id = $("#id").val();
            var title = $("#title").val();
            var content = $("#content").val();

            $.ajax({
                url: "../data/updateReport",
                type: "post",
                data: {
                    id: id,
                    title: title,
                    content: content
                },
                success: function (data) {
                    alert(data.msg);
                    if (data.flag) {
                        back();
                    }
                }
            });
        }

        function back() {
            window.location.href = "bussiness";
        }
    </script>

</head>
<%
    String id = request.getParameter("id");
    Report report = Report.dao.findById(id);
    int user_id = report.get("user_id");
    User user = User.dao.findById(user_id);

    String stateCn = report.getStateCn();

%>
<body>
<div class="container">
    <table class="table">
        <ul>
            <tr>
                <td width="100px">提报ID</td>
                <td width="300px"><input name="id" id="id" disabled="disabled" value="<%=id%>"></td>
            </tr>
            <tr>
                <td>状态</td>
                <td><%=stateCn%>
                </td>
            </tr>
            <tr>
                <td>题目</td>
                <td><input id="title" name="title" style="width: 100%;" type="text" value="<%=report.get("title")%>"></td>
            </tr>
            <tr>
                <td>内容</td>
                <td><textarea id="content" name="content"
                              style="width: 100%;height: 300px"><%=report.get("content")%></textarea></td>
            </tr>
            <tr>
                <td>反馈</td>
                <td width="300px"><%=report.get("feedback")%></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <div class="col-md-4 btn btn-success" onclick="update();">保存</div>
                    <div class="col-md-offset-1 col-md-4 btn btn-default" onclick="back();">返回</div>
                </td>
            </tr>
        </ul>
    </table>
</div>
</body>
</html>
