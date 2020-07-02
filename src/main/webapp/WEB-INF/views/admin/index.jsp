<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/30
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>文章管理-Blog</title>
    <style type="text/css">
        ul{
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
<body>
<h1>文章管理</h1>
<div style="position: absolute; left: 250px; width: 60%; top: 50px;">
    <div>
        <ul>
            <c:forEach items="${articleList}" var="a">
                <li style="margin-top: 20px;position: relative; height: 80px;border-bottom: 1px solid rgba(99,99,99,0.6);">
                    <div style="float: top;">
                        <c:if test="${a.status == 0}">
                            <span id="fin" style="border: 1px solid #636363; border-radius: 2px;padding: 4px;padding-right: 6px;padding-left: 6px;font-size: 14px;color: #636363;margin-right: 10px;">草稿</span>
                        </c:if>
                        <a class="articleTitle" href="/admin/edit/${a.aid}" target="_blank">${a.title}</a>
                    </div>
                    <div style="float: top; margin-top: 10px; font-size: 14px;color: #636363">
                        <span style="margin-left: 3px;margin-right: 20px">${a.author}</span>
                        <span><fmt:formatDate value="${a.publishTime}" pattern="yyyy年MM月dd日"></fmt:formatDate></span>
                        <c:if test="${a.status == 1}">
                            <a style="text-decoration: none;margin-left: 20px" href="/article/${a.aid}">查看文章</a>
                        </c:if>
                    </div>

                </li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
