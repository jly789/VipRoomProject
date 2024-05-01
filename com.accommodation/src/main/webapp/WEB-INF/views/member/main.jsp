<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>


<!doctype html>
<html class="no-js" lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Book Shop</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<jsp:include page="../main/main.jsp"/>
<%--메인페이지<br/><br/><br/>--%>




<%--<c:if test="${userId==null}">--%>

<%--  <li><a href="/">홈으로</a></li>--%>
<%--  <li><a href="/login">로그인하세요</a></li>--%>

<%--</c:if>--%>

<%--<c:if test="${userId!=null}">--%>
<%-- 환영합니다 ${userId}님--%>
<%--  <li><a href="/">홈으로</a></li>--%>
<%--  <li><a href="/logout">로그아웃</a></li>--%>

<%--</c:if>--%>


</body>
</html>