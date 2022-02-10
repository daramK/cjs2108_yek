<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adContent.jsp</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
</head>
<body>
<p><br></p>
<div class="container">
	<h2>작업상황</h2>
	<hr/>
	<p><a href="${ctp}/admin/adMemberList?level=4">새로운 가입자(<font color="red"><b>${newMember}</b></font> 건)</a></p>
	<hr/>
	<p>
		<a href="#">최근 게시글(<font color="red"><b>xx</b></font> 건)</a>
		<a href="#">최근 게시글(댓글)(<font color="red"><b>xx</b></font> 건)</a>
	</p>
	<hr/>
	<p><a href="#">문의사항(<font color="red"><b>xx</b></font> 건)</a></p>
	<hr/>
	<hr/>
	<p>오늘 방문횟수 <font color="red">xx</font> 건</p>
	<hr/>
</div>
<br/>
</body>
</html>