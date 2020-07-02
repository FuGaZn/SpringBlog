<%@ page import="com.fjx.blog.spring.entity.User" %>
<%@ page import="com.fjx.blog.spring.entity.Article" %>
<%@ page import="org.springframework.ui.Model" %>
<%@ page import="java.net.URLDecoder" %><%--
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
            color: #636363;font-size: 20px; margin-left: 20px; width: 50%; padding: 8px;border: 1px solid #adadad;border-radius: 3px
        }
        .authorInput{
            color: #636363;font-size: 18px; margin-left: 5px; width: 140px; padding: 8px;border: 1px solid #adadad;border-radius: 3px
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
<%
    User user = (User) request.getSession().getAttribute("user");
    String name = user.getName();
    Article myArticle = (Article) request.getAttribute("article");
    String content = "";
    int aid = 0;
    if (myArticle!=null) {
        content = URLDecoder.decode(myArticle.getContent(), "UTF-8");
        aid = myArticle.getAid();
    }
%>

<div style="height: 50px;">
    <a style="margin-left: 30px;font-size: 22px; font-weight: bold; color: #555555" href="/admin">文章管理</a>
    <input class="titleInput" id="titleInput" placeholder="输入文章标题" value="${article.title}"/>
    <input class="authorInput" id="authorInput" placeholder="作者" value="${article.author}"/>
    <input id="saveArticle" class="saveArticle" type="button" value="保存文章"/>
    <input id="publishArticle" class="publishArticle" type="button" value="发布文章"/>

</div>


<div>
    <div style="width: 100%;height: 600px" class="zhy-editor-writing">
        <!--MarkDown的id标志 -->
        <div id="my-editormd">
            <!-- 书写与实时显示的textarea -->
            <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"><%=content%></textarea>
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

    $('#saveArticle').click(function () {
        var title = $('#titleInput').val()
        var blogcontent = encodeURIComponent(editor.getMarkdown())
        var authorName = $('#authorInput').val()
        if (authorName == null || authorName.length == 0) {
            authorName ='<%=name%>'
        }
        var obj = {
            'title':title,
            'author':authorName,
            'content':blogcontent,
            'status':'0',
            'aid':'0'
        }
        obj.aid = '<%=aid%>'
        $.ajax({
            type: "POST",
            url: '/admin/save',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: obj,
            dataType: 'json',
            success:function (data) {
                window.location.href='/admin'
            }
        })
    })

    $('#publishArticle').click(function () {
        var title = $('#titleInput').val()
        var blogcontent = encodeURIComponent(editor.getMarkdown())
        var authorName = $('#authorInput').val()
        if (authorName == null || authorName.length == 0) {
            authorName ='<%=name%>'
        }
        var obj = {
            'title':title,
            'author':authorName,
            'content':blogcontent,
            'status':'1',
            'aid':'0'
        }
        obj.aid = '<%=aid%>'
        $.ajax({
            type: "POST",
            url: '/admin/save',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: obj,
            dataType: 'json',
            success:function (data) {
                window.location.href='/admin'
            }
        })
    })

</script>

</html>
