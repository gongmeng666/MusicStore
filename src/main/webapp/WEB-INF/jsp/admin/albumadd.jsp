<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
    <title>Music Store 后台商品编辑</title>
	<link type="text/css" rel="Stylesheet" href="${pageContext.request.contextPath}/static/admin-album-edit_files/admin.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin-album-edit_files/jquery-1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin-album-edit_files/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin-album-edit_files/jquery-ui-1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin-album-edit_files/jquery_002.js"></script>
	<script type="text/javascript">
 		$(function () {
            $('#albumEditForm').validate({
                    rules: {
                        "album.title": { required: true },
                        "album.artist": { required: true },
                        "album.price": { required: true, number: true, range: [0, 1000]  },
                        "album.stock": { required: true, digits: true, range: [0, 100000]  },
                        uploadCover: { accept: "jpeg|jpg" },
                        "album.dateReleased": { required: true, dateISO: true }
                    },
                    messages: {
                        "album.title": { required: "请输入唱片标题" },
                        "album.artist": { required: "请输入歌手" },
                        "album.price": { required: "请输入单价", number: "单价应为数值", range:"单价应在0-1000元之间"},
                        "album.stock": { required: "请输入库存", digits: "库存应为正整数", range: "库存量在0-100000之间" },
                        uploadCover: { accept: "图片格式应为jpeg" },
                        "album.dateReleased": { required: "请输入发行日期", dateISO: "日期格式应为yyyy-mm-dd" }
                    }
            });
            //日期控件
            $("#dateReleased").datepicker({dateFormat:"yy-mm-dd"});
        });
	</script>
	<style type="text/css">
		#albumEdit{
			margin:0 0 0 40px;
			line-height:2;
		}
		#albumEdit input.txt, #albumEdit select, #albumEdit textarea.txt{
			width:200px;
		}
		#albumEdit img{
			width:100px;
		}
	</style>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/admin-album-edit_files/jquery-ui-1.css">
  </head>
  
  <body>
    <div id="wrapper">
		
		<div id="header">
			<div id="header-logo">
				<a href="http://localhost:8080/musicstore/index"><img src="${pageContext.request.contextPath}/static/admin-album-edit_files/logo.png" alt=""></a>
			</div> 
			<div id="header-nav">
				<h3>后台管理</h3>
				<ul>
					<li><a href="http://localhost:8080/musicstore/admin/albumManagement">商品管理</a></li>
					<li><a href="http://localhost:8080/musicstore/admin/orderManagement">订单管理</a></li>
				</ul>
			</div></div>
    	<div id="content">
    		<div id="content-title">
				<h3>添加商品</h3>
			</div>
			<div id="content-main">
				<form id="albumEditForm" action="albumadd" method="post" enctype="multipart/form-data">
				<input id="id" name="id" value="${album==null?0:album.id}" type="hidden">
    			<table id="albumEdit">
    				<tbody><tr>
    					<td>唱片名称：</td>
    					<td><input class="txt" id="title" name="title"  type="text">
    						</td>
    				</tr>
    				<tr>
    					<td>唱片封面：</td>
    					<td>
    					<img src="admin-album-edit_files/1.jpg" alt=""><br>
    					<input type="file" name="CoverImages" "/>
    					</td>
    				</tr>
    				<tr>
    					<td>歌手：</td>
    					<td><input class="txt" id="artist" name="artist"  type="text">
    						</td>
    				</tr>
    				<tr>
    					<td>唱片分类：</td>
    					<td>
    						<select name="genreId">
							<c:forEach var="c" items="${genres}">
								<c:if test="${c.id==genre.genreId}">
									<option value="${c.id}" selected="selected">${c.name}</option>
								</c:if>
								<c:if test="${c.id!=genre.genreId}">
									<option value="${c.id}">${c.name}</option>
								</c:if>
							</c:forEach>
						</select>
    					</td>
    				</tr>
    				<tr>
    					<td>单价：</td>
    					<td><input class="txt" id="price" name="price"  type="text">
    						</td>
    				</tr>
    				<tr>
    					<td>库存：</td>
    					<td><input class="txt" id="stock" name="stock"  type="text">
    						</td>
    				</tr>
    				<tr>
    					<td>发行日期：</td>
    					<td><input class="txt hasDatepicker" id="dateReleased" name="dateReleased"  type="text">
    						</td>
    				</tr>
    				<tr>
    					<td>唱片详细信息：</td>
    					<td><textarea id="description" name="description" style="width:400px; height:120px;"></textarea>
    					</td>
    				</tr>
    				<tr>
    					<td></td>
    					<td>
    						<input id="btnSubmit" name="btnSubmit" value="保存" type="submit">
    					</td>
    				</tr>
    			</tbody></table>
    			</form>
			</div>
    	</div>
    	
		<div id="footer">
			<div id="footer-contactUs">
				<p>Sams Music Store</p>
				<p>Design by Sam Chen, July,2011.</p>
			</div>
		</div>
    </div>
  
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>