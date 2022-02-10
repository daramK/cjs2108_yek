<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memPwdCheck.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<p><br/></p>
<div class="container">
	<form method="post">
		<h2>비밀번호 확인</h2>
		<hr/>
		<table class="table table-border">
			<tr>
				<th align="center">비밀번호</th>
				<td><input type="password" name="pwd" autofocus class="form-control" required /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button type="submit" class="btn btn-success">비밀번호확인</button>
					<button type="reset" class="btn btn-danger">다시입력</button>
					<button type="submit" class="btn btn-dark" onclick="location.href='${ctp}/member/memMain';">돌아가기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>