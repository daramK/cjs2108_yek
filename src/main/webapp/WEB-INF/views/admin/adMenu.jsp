<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adMenu.jsp</title>
	<frameset cols="120px,*">
		<frame src="${ctp}/admin/adLeft" name="adLeft" frameborder="0"/>
		<frame src="${ctp}/admin/adContent" name="adContent" frameborder="0"/>
	</frameset>
</head>
<body>
</body>
</html>