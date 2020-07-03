<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/3
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/resource/assets/js/jquery.min.js"></script>
    <style type="text/css">
        a:link {
            color: #555555;
            text-decoration: none;
        }
        a:visited {
            color: #555555;
            text-decoration: none;
        }
        a:hover {
            color: #555555;
        }
        .toIndex{
            font-size: 18px;
        }
        .exitBtn{ /* 按钮美化 */
            position: absolute;
            right: 40px;
            top: 24px;
            width: 60px; /* 宽度 */
            height: 30px; /* 高度 */
            border:1px solid #1E90FF;
            border-radius: 50px; /* 边框半径 */
            background: #ffffff; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: #1E90FF; /* 字体颜色 */
            font-size: 14px; /* 字体大小 */
        }
        .exitBtn:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: rgba(30, 144, 255, 0.5);

        }
    </style>
</head>
<body>
<div style="width: 100%; background: white;height: 80px;position: absolute; left: 0; top: 0;box-shadow: rgba(99,99,99,0.3) 0px 0px 0px 1px ;">
    <div style="margin-left: 40px; margin-top: 30px">
        <a class="toIndex" href="/index">&larr; 博客首页</a>
    </div>
    <input id="exitBtn" class="exitBtn" type="button" value="退出"/>
</div>
</body>
<script type="text/javascript">
    $('#exitBtn').click(function () {
        $.ajax({
            async: false,//同步，待请求完毕后再执行后面的代码
            type: "GET",
            url: '/logOut',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (data) {
                if(data.code==0) {
                    alert(data.msg);
                } else {
                    window.location.href="/index";
                }
            },
            error: function () {
            }
        })
    })

</script>
</html>
