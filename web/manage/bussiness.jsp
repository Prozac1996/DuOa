<%--
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

    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
</head>

<%
    String username = (String) session.getAttribute("username");
%>

<body>
<div id="top">肚Oa： 欢迎——<%=username%> !</div>
<div id="bottom"></div>
<div style="float: left;margin-right: 20px">
新增提报：
    <input name="title" type="text" placeholder="题目">
    <br/>
    <br/>
    <textarea name="content" style="width: 260px;height: 300px" placeholder="提报内容"></textarea>
    <br/>
    <br/>
    <button style="width: 260px">提交提报</button>
</div>
<div >
    我的提报：

</div>
</body>
</html>
