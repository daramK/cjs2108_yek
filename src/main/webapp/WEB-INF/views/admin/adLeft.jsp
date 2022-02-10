<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath()%>"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adLeft.jsp</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
	<script>
	function logoutCheck() {
		parent.location.href = "${ctp}/member/memLogout";
	}
	</script>
	<style>
		body {
			background-color: #000;
		}
		a {
			color: #fff;
		}
	</style>
</head>
<body>
<p><br></p>
<div class="container">
	<h6><a href="${ctp}/admin/adContent" target="adContent">관리자메뉴</a></h6>
	<hr/>
	<p><a href="${ctp}/admin/adGuestList" target="adContent">방명록관리</a></p>
	<p><a href="${ctp}/admin/adMemberList" target="adContent">회원관리</a></p>
	<p><a href="${ctp}/admin/adBoardList" target="adContent">게시판관리</a></p>
	<p><a href="#" target="adContent">사진첩관리</a></p>
	<hr/>
	<p><a href="#" target="adContent">1:1문의</a></p>	
	<hr/>
	<p><a href="${ctp}/" target="_top">홈으로</a></p>
	<p><a href="javascript:logoutCheck()">로그아웃</a></p>
</div>
<br/>
</body>
</html>