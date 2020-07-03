<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/3
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/resource/assets/js/jquery.min.js"></script>
    <title>Title</title>
    <style type="text/css">
        .navBarUL{
            width: 150px;
            list-style-type: none;
        }
        .navItem{
            font-size: 16px;
            color: #555555;
            width: 100%;
            height: 50px;
            line-height: 50px;
            margin-left: 14px;
        }
        .createArticle{ /* 按钮美化 */
            position: absolute;
            left: 40px;
            top: 100px;
            margin-left: 10px;
            width: 150px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 50px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .createArticle:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        .navItem a{
            text-decoration: none;
            cursor: pointer;
        }
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
    </style>
</head>
<body>

<input id="createArticle" class="createArticle" type="button" value="新建文章"/>
<div style="position: absolute;left: 40px;top:150px;">
    <ul class="navBarUL">
        <li>
            <div class="navItem">
                <a href="/admin">文章管理</a>
            </div>
            <div class="navItem">
                <a href="/admin/comment">评论管理</a>
            </div>
            <div class="navItem">
                <a href="/admin/category">分类管理</a>
            </div>
        </li>
    </ul>
</div>
<script type="text/javascript">
    $('#createArticle').click(function () {
        window.location.href="/admin/edit"
    })
</script>
</body>
</html>
