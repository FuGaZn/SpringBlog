<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fjx.blog.spring.entity.Article" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/30
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>首页-Blog</title>
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
      <style type="text/css">
          .articleListUL{
              list-style-type: none;
              width: 100%;
              font-family: "Microsoft YaHei"
          }
          .articleTitle{
              text-decoration: none; color:#514D4D;font-size: 26px;
              margin-top: 10px;
              margin-bottom: 10px;
          }
      </style>
  </head>
  <body bgcolor="#D1E7F5">
  <%@include file="component/TopNavBar.jsp"%>
  <%
  %>
 <div style="position: absolute; left: 250px; width: 60%; top: 90px;">
     <div>
         <ul class="articleListUL">
             <c:forEach items="${articleList}" var="a">
                 <c:if test="${a.status==1}">
                     <li style="margin-top: 10px;position: relative; height: 80px;background: white;
                      margin-bottom: 10px;padding: 20px;border: 1px solid #d1e7ff">
                         <div style="float: top;">
                             <c:if test="${a.status == 0}">
                                 <span id="fin" style="border: 1px solid #636363; border-radius: 2px;padding: 4px;padding-right: 6px;padding-left: 6px;font-size: 14px;color: #636363;margin-right: 10px;">草稿</span>
                             </c:if>
                             <a class="articleTitle" href="/article/${a.aid}" target="_blank">${a.title}</a>
                         </div>
                         <div style="float: top; margin-top: 10px; font-size: 14px;color: #636363">
                             <span style="margin-left: 3px;margin-right: 20px">${a.author}</span>
                             <span><fmt:formatDate value="${a.publishTime}" pattern="yyyy年MM月dd日"></fmt:formatDate></span>
                             <span style="margin-left: 20px">访问量：${a.viewCount}</span>
                         </div>
                         <div style="float: top;">
                         </div>

                     </li>
                 </c:if>
             </c:forEach>
         </ul>
     </div>
 </div>
<script type="text/javascript">

</script>
  </body>
</html>
