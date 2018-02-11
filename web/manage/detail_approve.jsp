<%@ page import="model.Report" %>
<%@ page import="com.sun.org.apache.regexp.internal.RE" %>
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
    <title>肚Oa-审批</title>
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery.form.min.js"></script>

    <link href="../css/bootstrap.css" rel="stylesheet">
    <script src="../js/bootstrap.js"></script>
    <script>
        function pass() {
            var id = $("#id").val();
            var feedback = $("#feedback").val();
            var state = 1;
            $.ajax({
                url: "../data/feedbackReport",
                type: "post",
                data: {
                    id: id,
                    feedback: feedback,
                    state: state
                },
                success: function (data) {
                    alert(data.msg);
                    if (data.flag) {
                        back();
                    }
                }
            });
        }
        function refuse() {
            var id = $("#id").val();
            var feedback = $("#feedback").val();
            var state = 2;
            $.ajax({
                url: "../data/feedbackReport",
                type: "post",
                data: {
                    id: id,
                    feedback: feedback,
                    state: state
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
            window.location.href = "console";
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
                    <td>提报人</td>
                    <td><%=user.get("username")%></td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td><%=stateCn%></td>
                </tr>
                <tr>
                    <td>题目</td>
                    <td><%=report.get("title")%></td>
                </tr>
                <tr>
                    <td>内容</td>
                    <td><%=report.get("content")%></td>
                </tr>
                <tr>
                    <td>反馈</td>
                    <td><textarea id="feedback" name="feedback"
                                  style="width: 100%;height: 300px"><%=report.get("feedback")%></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="col-md-4 btn btn-success" onclick="pass();">通过</div>
                        <div class="col-md-offset-1 col-md-4 btn btn-danger" onclick="refuse();">拒绝</div>
                    </td>
                </tr>
            </ul>
        </table>
    </div>
</body>
</html>
