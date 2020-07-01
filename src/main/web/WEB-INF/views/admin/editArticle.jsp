<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/1
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写文章-Blog</title>
    <link rel="stylesheet" href="/resource/assets/editormd/css/editormd.css"/>
    <link rel="stylesheet" href="/resource/assets/editormd/css/editormd.min.css"/>
    <script src="/resource/assets/js/jquery.min.js"></script>
    <script src="/resource/assets/editormd/editormd.min.js"></script>
    <style type="text/css">
        .titleInput{
            color: #636363;font-size: 20px; margin-left: 30px; width: 60%; padding: 8px;border: 1px solid #adadad;border-radius: 3px
        }
        .publishArticle{ /* 按钮美化 */
            margin-left: 10px;
            width: 100px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .publishArticle:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        .saveArticle{ /* 按钮美化 */
            margin-left: 10px;
            width: 100px; /* 宽度 */
            height: 40px; /* 高度 */
            border-color: #1E90FF;
            border-width: 1px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #ffffff; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: #1E90FF; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .saveArticle:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: rgba(30, 144, 255, 0.5);

        }
    </style>
</head>
<body>



<div style="height: 50px;">
    <a style="margin-left: 30px;font-size: 22px; font-weight: bold; color: #555555" href="/admin">文章管理</a>
    <input class="titleInput" placeholder="输入文章标题"/>
    <input class="saveArticle" type="button" value="保存文章" onclick="saveArticle()"/>
    <input class="publishArticle" type="button" value="发布文章"/>

</div>


<div>
    <div style="width: 100%;height: 600px" class="zhy-editor-writing">
        <!--MarkDown的id标志 -->
        <div id="my-editormd">
            <!-- 书写与实时显示的textarea -->
            <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
            <!-- 用于后端获取md稳当内容，Java中：request.getParameter("my-editormd-html-code")。 -->
            <textarea id="my-editormd-html-code" name="my-editormd-html-code" style="display:none;"></textarea>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var editor;
    $(function() {
        editor = editormd("my-editormd", {//注意1：这里的就是上面的DIV的id属性值
            width   : "96%",
            height  : 600,
            syncScrolling : "single",
            path    : "/resource/assets/editormd/lib/",//注意2：你的路径
            saveHTMLToTextarea : true,//注意3：这个配置，方便post提交表单
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],//支持接收的图片上传的格式
            imageUploadURL : "/admin/uploadFile"
        });
    });

    function saveArticle() {
        var blogcontent = encodeURIComponent(editor.getMarkdown())
    }

</script>

</html>
