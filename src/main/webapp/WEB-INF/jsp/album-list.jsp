<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>欢迎光临 Music Store</title>
    <link type="text/css" rel="Stylesheet" href="static/album-list_files/front.css">
    <script type="text/javascript" src="static/album-list_files/jquery-1.js"></script>
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
            <h3 id="main-title">唱片列表</h3>
            <c:forEach items="${albums}" var="album">
                <table class="albumItem">
                    <tbody>
                        <tr>
                            <td rowspan="3" class="albumItem-image"><img src="./static/CoverImages/${album.id}.jpg"/></td>
                            <td colspan="2" class="albumItem-title">
                                <a href="/MusicStore/album?albumId=${album.id}">${album.title}</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="albumItem-artist"><strong>歌手：</strong>${album.artist}</td>
                            <td class=".albumItem-price"><strong>定价：</strong>￥${album.price}</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                ${album.description}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </c:forEach>
            <hr>
            <c:if test="${page>1}">
                <a href="/MusicStore/albumList?pageNum=${page-1}&amp;genreId=${genreId}&amp;title=${title}">上一页</a>
            </c:if>
            <c:if test="${page<pages}">
            <a href="/MusicStore/albumList?pageNum=${page+1}&amp;genreId=${genreId}&amp;title=${title}">下一页</a>
            </c:if>
            &nbsp;共${pages}页，第${page}页。

        </div>
        <div class="clearBoth"></div>
    </div>
<jsp:include page="../commom/footer.jsp"/>
</div>


</body></html>