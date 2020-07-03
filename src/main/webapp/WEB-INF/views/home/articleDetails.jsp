<%@ page import="com.fjx.blog.spring.entity.Article" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/2
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%
        Article article = (Article) request.getAttribute("article");
        int aid = article.getAid();
        String content = URLDecoder.decode(article.getContent(),"UTF-8");
        String author = article.getAuthor();
        String title = article.getTitle();
        int viewCount = article.getViewCount()+1;
        Date publishTime = article.getPublishTime();
    %>
    <title><%=title%>-blog</title>
    <link rel="stylesheet" href="/resource/assets/editormd/css/editormd.min.css"/>
    <link rel="stylesheet" href="/resource/assets/editormd/css/editormd.css"/>
    <script src="/resource/assets/js/jquery.min.js"></script>
    <script src="/resource/assets/editormd/editormd.min.js"></script>

    <script src="/resource/assets/editormd/lib/marked.min.js"></script>
    <script src="/resource/assets/editormd/lib/prettify.min.js"></script>
    <script src="/resource/assets/editormd/lib/raphael.min.js"></script>
    <script src="/resource/assets/editormd/lib/underscore.min.js"></script>
    <script src="/resource/assets/editormd/lib/sequence-diagram.min.js"></script>
    <script src="/resource/assets/editormd/lib/flowchart.min.js"></script>
    <script src="/resource/assets/editormd/lib/jquery.flowchart.min.js"></script>
</head>
<body bgcolor="#D1E7F5">
<%@include file="component/TopNavBar.jsp"%>
<div style="background-color: white;width: 60%;position: absolute;margin: auto;left: 0;right: 0; top: 100px;bottom: 0">
    <div style="position: relative;width: 100%">
        <h1 style="width: 100%; text-align: center"><%=title%></h1>
        <div style="background-color: #F7F7FC; border-radius: 3px;margin-left: 3%;margin-right: 3%;padding: 10px;color: #636363">
            <span style="margin-left: 30px;margin-top: 10px"><%=author%></span>
            <span style="margin-left: 20px"><fmt:formatDate value="<%=publishTime%>" pattern="yyyy年MM月dd日"></fmt:formatDate></span>
            <span style="margin-left: 20px">访问量：<%=viewCount%></span>
        </div>
        <div style="width: 100%; background-color: white;position: relative;">
            <div id="test-editormd" style="width: 90%;padding-left: 5%" >
                <textarea style="display: none" name="test-editormd-markdown-doc"><%=content%></textarea>
            </div>
        </div>
    </div>

</div>

</body>
<script src="/resource/assets/js/myScript.js"></script>
<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("test-editormd", {
            htmlDecode :"style, script, iframe",
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });
    })
    increaseViewCount(<%=aid%>)

</script>
</html>
