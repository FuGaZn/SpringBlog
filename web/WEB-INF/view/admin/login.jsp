<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/30
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Blog</title>
    <link rel="stylesheet" href="/resource/assets/plugin/font-awesome/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/resource/assets/img/logo.png">
    <link rel='stylesheet' id='dashicons-css'  href='/resource/assets/plugin/login/dashicons.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='buttons-css'  href='/resource/assets/plugin/login/buttons.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='forms-css'  href='/resource/assets/plugin/login/forms.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='l10n-css'  href='/resource/assets/plugin/login/l10n.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='login-css'  href='/resource/assets/plugin/login/login.min.css' type='text/css' media='all' />
    <style type="text/css">
        body{
            font-family: "Microsoft YaHei", Helvetica, Arial, Lucida Grande, Tahoma, sans-serif;
            background: url("/resource/assets/img/loginBg.jpg");
            width:100%;
            height:100%;
        }
        .input{
            width: 200px;
            font-size: 16px;
            padding: 5px;
            margin-top: 10px;
            margin-left: 45px;
        }
        .forgetmenot{
            margin-left: 166px;
        }
        .submit {
            cursor: pointer;
            margin-left: 45px;
            position: relative;
            display: inline-block;
            width: 190px;
            text-align: center;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 5px;
            overflow: hidden;
            color: #177bc7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
            font-size: 16px;
        }
        .submit input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            cursor: pointer;
        }
        .submit:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
            cursor: pointer;
        }

    </style>
    <meta name='robots' content='noindex,follow' />
    <meta name="viewport" content="width=device-width" />
    <style>
        body {
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-attachment: fixed;
        }
    </style>
</head>
<body>

<div id="login" style="position: absolute; width: 300px;height: 250px;background-color:rgba(246,246,246,0.5);top: 120px;left: 50%;margin-left: -150px">
    <h1 style="width: 300px; text-align: center;margin-top: -60px">后台管理</h1>
    <%
        String username = "", password = "";
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {//对cookies中的数据进行遍历，找到用户名、密码的数据
            if ("username".equals(cookies[i].getName())) {
                username = cookies[i].getValue();
            } else if ("password".equals(cookies[i].getName())) {
                password = cookies[i].getValue();
            }
        }
    %>
    <form name="loginForm" id="loginForm" method="post">
        <input type="text" placeholder="用户名" name="username" id="user_login" class="input" value="<%=username%>" size="20" required/>
        <input type="password" placeholder="密码" name="password" id="user_pass" class="input" value="<%=password%>" size="20" required/>
        <p class="forgetmenot"><label for="rememberme"><input name="rememberme" type="checkbox" id="rememberme" value="1" checked /> 记住密码</label></p>
        <a class="submit">登陆
            <input type="button" name="wp-submit" id="submit-btn" value="登录" />
        </a>
        <p id="backtoblog" style="margin-left: 160px;color: black"><a href="/">&larr; 返回到博客</a></p>
    </form>

</div>
<script src="/resource/assets/js/jquery.min.js"></script>
<script type="text/javascript">
    $("#submit-btn").click(function () {
        var user = $("#user_login").val();
        var password = $("#user_pass").val();
        console.log(user+' '+password)
        if(user=="") {
            alert("用户名不可为空!");
        } else if(password==""){
            alert("密码不可为空!");
        } else {
            $.ajax({
                async: false,//同步，待请求完毕后再执行后面的代码
                type: "POST",
                url: '/loginVerify',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: $("#loginForm").serialize(),
                dataType: "json",
                success: function (data) {
                    if(data.code==0) {
                        alert(data.msg);
                    } else {
                        window.location.href="/admin";
                    }
                },
                error: function () {
                    alert("数据获取失败")
                }
            })
        }
    })
</script>
</body>
</html>
