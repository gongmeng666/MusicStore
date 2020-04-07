<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="sidebar">
    <h3>唱片分类</h3>
    <ul class="categories">
        <c:forEach items="${genres}" var="genre" varStatus="a">
            <c:if test="${(a.index+1)%2==1}">
                <li><a href="/MusicStore/albumList?genreId=${genre.id}">${genre.name}</a></li>
            </c:if>
            <c:if test="${(a.index+1)%2!=1}">
                <li><a href="/MusicStore/albumList?genreId=${genre.id}" class="even">${genre.name}</a></li>
            </c:if>
        </c:forEach>
    </ul>
</div>
</body>
</html>
