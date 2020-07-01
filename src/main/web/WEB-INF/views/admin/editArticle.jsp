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
    <title>Blog</title>
    <link rel="stylesheet" href="/resource/assets/editormd/css/editormd.css"/>
    <link rel="stylesheet" href="/resource/assets/editormd/css/editormd.min.css"/>
    <script src="/resource/assets/js/jquery.min.js"></script>
    <script src="/resource/assets/editormd/editormd.min.js"></script>
</head>
<body>



<h1>编辑界面</h1>
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
    $(function() {
        editormd("my-editormd", {//注意1：这里的就是上面的DIV的id属性值
            width   : "90%",
            height  : 600,
            syncScrolling : "single",
            path    : "/resource/assets/editormd/lib/",//注意2：你的路径
            saveHTMLToTextarea : true//注意3：这个配置，方便post提交表单
        });
    });
</script>

</html>
