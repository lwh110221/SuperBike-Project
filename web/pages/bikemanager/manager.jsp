<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>后台管理</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
    <style>
        h1 {
            text-align: center;
            margin-top: 200px;
            font-size: 50px;
            color: #ff6f00;
        }
        body{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<script>
    $(document).ready(function() {
        var msg = "${msg}";
        if (msg) {
            alert(msg);
        }
    });
</script>
<div id="main">
    <h1>欢迎进入后台管理系统</h1>
</div>
</body>
</html>
