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
    <link rel="stylesheet" href="../jqgrid/css/ui.jqgrid.css">
    <link rel="stylesheet" href="../jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
    <script type="text/javascript" src="../jqgrid/js/jquery.jqGrid.src.js"></script>

    <script>
        $(document).ready(function () {
            jQuery("#reports").jqGrid({
                url:"data/report",
                dataType:"json",
                colNames:['ID','Title','Content','State'],
                colModel:[
                    {name:'id',index:'id',width:55},
                    {name:'title',index:'title',width:90},
                    {name:'content',index:'content',width:50},
                    {name:'state',index:'state',width:55}
                ],
                rowNum:10,
                pager:'pager',
                sortname:'id',
                sortorder:'desc',
                mtype:"post",
                viewrecords:true,
                caption:"Reports"
            });
            jQuery("#reports").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
        });
    </script>

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
<div style="float: left;">
    我的提报：<br/>
    <table id="reports"></table>
    <div id="pager"></div>
</div>
</body>
</html>
