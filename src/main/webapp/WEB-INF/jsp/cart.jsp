<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>购物车</title>
<link type="text/css" rel="Stylesheet" href="static/cart_files/front.css">
<script type="text/javascript" src="static/cart_files/jquery-1.js"></script>
</head>

<body>
	<div id="wrapper">


		<style type="text/css">
#autoComplete {
	position: absolute;
	border: solid 1px silver;
	background-color: #FFF;
	width: 150px;
	display: none;
}

#autoComplete_info, #autoComplete_info tr, #autoComplete_info td {
	width: 148px;
}

#autoComplete_info tr:hover {
	background-color: #96BFF0;
}

#autoComplete_info tr {
	cursor: pointer;
}
</style>

		<script type="text/javascript">
    $(function() {
        //键入后执行关键字查询
        $('#keyword').keyup(txtSearch_keyup).blur(txtSearch_blur);         
        //把单击的候选项放置到文本框
        $('#autoComplete_info td').live('click', function() {
            $('#keyword').val($(this).text());
            $('#autoComplete').hide();
        });
    });
    function txtSearch_blur() {
        //不能马上消失，否则点击选择时txt失焦，该table会造马上消失无法选择
        setTimeout(function() { $('#autoComplete').hide() }, 200); 
    };
    function txtSearch_keyup(event) {
        var word = encodeURIComponent($(this).val());
        if ($.trim(word) != "") {
            $.getJSON('json/searchAutoComplete?prefix='+word,successCallback);   //异步调用JSON请求
        }
    };
    //成功回调
    function successCallback(returnValue) {
        var x = $('#keyword').offset().left;
        var y = $('#keyword').offset().top + $('#keyword').outerHeight(true) + 1;
        $('#autoComplete_info').empty();
        $('#autoComplete').css({ 'left': x, 'top': y }).show();
        for (var i = 0; i < returnValue.titles.length; i++) {
            var html = '<tr><td>' + returnValue.titles[i] + '</tr></td>'
            $('#autoComplete_info').append($(html));
        }
    };
</script>
		<c:import url="../commom/header.jsp"/>

		<div id="autoComplete">
			<table>
				<tbody id="autoComplete_info">
				</tbody>
			</table>
		</div>
		<div id="content">
		 <c:import url="../commom/left.jsp"/>
			<div id="main">
				<h3 id="main-title">购物车</h3>

				<table id="shoppingCart">
					<tbody>
						<tr>
							<th>唱片</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
							<th>删除</th>
						</tr>

						<tr>
							<td>恋曲2000</td>
							<td>￥20.50</td>
							<td>1</td>
							<td>￥20.50</td>
							<td>
								<form id="removeAlbumFromShoppingCart"
									name="removeAlbumFromShoppingCart"
									action="/musicstore/removeAlbumFromShoppingCart.action"
									method="post">
									<input value="删除" type="submit">
									<table class="wwFormTable">
										<input name="albumId" value="1" type="hidden">

									</table>
								</form>
							</td>
						</tr>

						<tr>
							<td>皇后大道东</td>
							<td>￥20.00</td>
							<td>1</td>
							<td>￥20.00</td>
							<td>
								<form id="removeAlbumFromShoppingCart"
									name="removeAlbumFromShoppingCart"
									action="/musicstore/removeAlbumFromShoppingCart.action"
									method="post">
									<input value="删除" type="submit">
									<table class="wwFormTable">
										<input name="albumId" value="2" type="hidden">

									</table>
								</form>
							</td>
						</tr>

						<tr>
							<td></td>
							<td></td>
							<td>合计</td>
							<td>￥40.50</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<form id="orderConfirm" name="orderConfirm"
					action="/musicstore/orderConfirm.action" method="post">
					<input id="orderSubmit" value="订单确认" type="submit">
					<table class="wwFormTable">

					</table>
				</form>
			</div>
			<div class="clearBoth"></div>
		</div>



		<c:import url="../commom/footer.jsp"/>
	</div>


</body>
</html>