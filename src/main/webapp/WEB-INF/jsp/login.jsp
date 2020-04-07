<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>欢迎光临 Music Store</title>
    <link type="text/css" rel="stylesheet" href="static/style/front.css"/>
</head>

<body>
<div id="wrapper">
    <jsp:include page="../commom/header.jsp"/>
    <div id="content">
        <c:import url="../commom/left.jsp"/>
        <div id="main">
            <form method="post" action="login" style="margin: auto;text-align: center">
                用户名:<input type="text" name="username"/><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;密码:<input type="password" name="password"/><br/>
                <button type="submit">登录</button><a href="">注册</a><br/>
                <label style="color: red;">${msg}</label>
            </form>
        </div>
        <div class="clearBoth"></div>
    </div>
    <jsp:include page="../commom/footer.jsp"/>
</div>
</body>
</html>
