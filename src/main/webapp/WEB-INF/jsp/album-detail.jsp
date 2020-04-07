<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>唱片明细</title>
    <link type="text/css" rel="Stylesheet" href="static/album-detail_files/front.css">
    <script type="text/javascript" src="static/album-detail_files/jquery-1.js"></script>
</head>

<body>
<div id="wrapper">


    <style type="text/css">
        #autoComplete{
            position:absolute;
            border:solid 1px silver;
            background-color: #FFF;
            width: 150px;
            display: none;
        }
        #autoComplete_info,#autoComplete_info tr,#autoComplete_info td{
            width: 148px;
        }
        #autoComplete_info tr:hover{
            background-color:#96BFF0;
        }
        #autoComplete_info tr{
            cursor:pointer;
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
    <jsp:include page="../commom/header.jsp"/>
    <div id="autoComplete">
        <table>
            <tbody id="autoComplete_info">
            </tbody>
        </table>
    </div>
    <div id="content">
        <c:import url="../commom/left.jsp"/>
        <div id="main">
            <h3 id="main-title">唱片详细资料</h3>
            <table id="albumDetail">
                <tbody><tr>
                    <td rowspan="5" id="albumDetail-image"><img src="./static/CoverImages/${album.id}.jpg"/></td>
                    <td class="albumDetail-label">专辑名称：</td>
                    <td id="albumDetail-title">《${album.title}》</td>
                </tr>
                <tr>
                    <td class="albumDetail-label">歌手：</td>
                    <td>${album.artist}</td>
                </tr>
                <tr>
                    <td class="albumDetail-label">定价：</td>
                    <td>￥${album.price}</td>
                </tr>
                <tr>
                    <td class="albumDetail-label">发行时间：</td>
                    <td>${album.dateReleased}</td>
                </tr>
                <tr>
                    <td class="albumDetail-label"></td>
                    <td>
                        <form id="addAlbumToShoppingCart" name="addAlbumToShoppingCart" action="/addAlbumToShoppingCart.action" method="post">
                            <input value="购买" type="submit"><table class="wwFormTable">
                            <input name="albumId" value="1" type="hidden">

                        </table></form>
                    </td>
                </tr>
                <tr>
                    <td class="albumDetail-label center">详细介绍：</td>
                    <td colspan="3">
                        ${album.description}
                    </td>
                </tr>
                </tbody></table>
        </div>
        <div class="clearBoth"></div>
    </div>

<jsp:include page="../commom/footer.jsp"/>
</div>


</body></html>