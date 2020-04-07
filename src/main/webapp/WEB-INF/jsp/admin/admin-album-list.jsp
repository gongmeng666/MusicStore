<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Music Store 后台商品管理</title>
	<link type="text/css" rel="Stylesheet"
		href="../static/admin-album-list_files/admin.css">
</head>

<body>
	<div id="wrapper">
		&nbsp;

		<div id="header">
			<div id="header-logo">
				<a href="/index"><img
					src="../static/admin-album-list_files/logo.png" alt=""></a>
			</div>
			<div id="header-nav">
				<h3>后台管理</h3>
				<ul>
					<li><a href="/admin/albumManagement">商品管理</a></li>
					<li><a href="/admin/orderManagement">订单管理</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="content-title">
				<h3>商品管理</h3>
			</div>
			<div id="content-main">
				<form id="searchForm" action="/MusicStore/admin/albumManagement" method="get">
					唱片分类： <select id="id">
						<option value="0" selected="selected">所有分类</option>
						<c:forEach var="c" items="${genres}">
							<c:if test="${c.id==param.cid}">
								<option value="${c.id}" selected="selected">${c.name}</option>
							</c:if>
							<c:if test="${c.id!=param.cid}">
								<option value="${c.id}">${c.name}</option>
							</c:if>
						</c:forEach>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;唱片名称： <input id="title" name="title"
						type="text"> &nbsp;&nbsp;&nbsp;&nbsp;<input id="btnSearch"
						value="查询" type="submit">
				</form>
				<hr>
					<a href="albumadd">添加新唱片</a>
					<table id="album-list">
						<tbody>
							<tr>
								<th>唱片名称</th>
								<th>歌手</th>
								<th>单价</th>
								<th>库存</th>
								<th>编辑</th>
							</tr>
							<c:forEach items="${albumes}" var="album">
								<tr>
									<td>${album.title}</td>
									<td>${album.artist}</td>
									<td>${album.price}</td>
									<td>${album.stock}</td>
									<td><a
										href="/MusicStore/admin/albumEdit?id=${album.id}">编辑</a></td>
								</tr>
							</c:forEach>
							<tr>
								<td class="pager" colspan="5"><c:if test="${totalPages>0}">
										<c:if test="${page>1}">
											<a
												href="?page=${page-1}&cid=${param.cid}&title=${param.title}">[上一页]</a>
										</c:if>
										<c:if test="${page<=1}">
											<a>[上一页]</a>
										</c:if>
										<c:if test="${page<totalPages}">
											<a
												href="?page=${page+1}&cid=${param.cid}&title=${param.title}">[下一页]</a>
										</c:if>
										<c:if test="${page>=totalPages}">
											<a>[下一页]</a>
										</c:if>
		第 ${page} 页，共 ${totalPages} 页
	</c:if></td>
							</tr>
						</tbody>
					</table>
			</div>
		</div>

		<div id="footer">
			<div id="footer-contactUs">
				<p>Sams Music Store</p>
				<p>Design by Sam Chen, July,2011.</p>
			</div>
		</div>
	</div>


</body>
</html>