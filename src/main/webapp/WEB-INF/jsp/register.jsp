<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>欢迎光临 Music Store</title>
    <link type="text/css" rel="Stylesheet" href="static/register_files/front.css">
    <script type="text/javascript" src="static/register_files/jquery-1.js"></script>
    <script type="text/javascript" src="static/register_files/jquery.js"></script>
    <script type="text/javascript">
        //扩展验证方式：正则验证
        $.validator.addMethod(
            "regExp",
            function(value, element, expression) {
                var rexp = new RegExp(expression);
                return rexp.test(value);
            },
            "所填写资料不符合格式。"
        );
        $(function () {
            $('#loginForm').validate({
                rules: {
                     'username': { required: true , remote: 'checkUsernameNotDuplicated'},
                    'password': { required: true },
                    passwordAgain: { equalTo: "#password" },
                    'email': { email: true }
                },
                messages: {
                     'username': { required: "请填写用户名", remote: '用户名已重复，请重新指定' },
                    'password': { required: "请填写密码" },
                    passwordAgain: { equalTo: "两次输入的密码应一致" },
                    'email': { email: "email格式应符合规范" }
                }
            });
        });
    </script>
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
    <c:import url="../commom/header.jsp"></c:import>

    <div id="autoComplete">
        <table>
            <tbody id="autoComplete_info">
            </tbody>
        </table>
    </div>
    <div id="content">
        <c:import url="../commom/left.jsp"/>
        <div id="main">
            <h3 id="main-title">用户注册</h3>
            <form id="loginForm" name="loginForm" action="register" method="post">
                <table class="wwFormTable"></table><table>
                <tbody><tr>
                    <td>用户名：</td>
                    <td><input class="txt" id="username" name="username" type="text"><label style="color: red;">${msg}</label>
                    </td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input class="txt" id="password" name="password" type="password">
                    </td>
                </tr>
                <tr>
                    <td>密码确认：</td>
                    <td><input class="txt" id="passwordAgain" name="passwordAgain" type="password">
                    </td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td><input class="txt" id="name" name="name" type="text"></td>
                </tr>
                <tr>
                    <td>地址：</td>
                    <td><input class="txt" id="address" name="address" type="text"></td>
                </tr>
                <tr>
                    <td>电话：</td>
                    <td><input class="txt" id="phone" name="phone" type="text"></td>
                </tr>
                <tr>
                    <td>Email：</td>
                    <td><input class="txt" id="email" name="email" type="text">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input id="btnSubmit" name="btnSubmit" value="注册" type="submit">
                    </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                </tr>
                </tbody></table>
            </form>
        </div>
        <div class="clearBoth"></div>
    </div>
    <jsp:include page="../commom/footer.jsp"/>
</div>

</body></html>