<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/style/front.css"/>
</head>
<body>
<div id="header">
    <div id="header-logo">
        <a href="/MusicStore/index"><img src="${pageContext.request.contextPath}/static/register_files/logo.png" alt=""></a>
    </div>
    <div id="header-login"><a href="/MusicStore/login">登录</a> | <a href="/MusicStore/register">注册</a></div>
    <div class="clearBoth"></div>
    <div id="header-search">
        <form action="albumList" method="get">
            <input id="keyword" name="title" autocomplete="off" type="text"><input id="btnSearch" value="搜索" type="submit">
        </form>
    </div>
    <div id="header-nav">
        <ul>
            <li><a href="/index">首页</a></li>
            <li><a href="http://localhost:8080/musicstore/albumList">商店</a></li>
            <li><a href="http://localhost:8080/MusicStore/cart">购物车</a></li>
            <li><a href="#">个人信息</a></li>
            <li><a href="/MusicStore/admin/index">${loginUser.username=="gdglc"?"后台管理":" "}</a></li>

        </ul>
        <label id="welcome">您好, ${loginUser.username}</label>
    </div>
</div>
</body>
</html>
