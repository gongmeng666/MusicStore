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
            <h3 id="main-title">最新热销唱片</h3>
            <div id="hotAlbums">
                   <c:forEach var="a" items="${albums}">
						<dl class="hotAlbumsItem">
							<dt>
								<a href="#"><img src="./static/CoverImages/${a.id}.jpg"
									alt="" /></a>
							</dt>
							<dd>${a.title}</dd>
						</dl>
					</c:forEach>
            </div>
        </div>
        <div class="clearBoth"></div>
    </div>
    <jsp:include page="../commom/footer.jsp"/>
</div>
</body>
</html>
