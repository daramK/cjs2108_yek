<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memLogin.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<p><br></p>
<div class="container">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="container" style="padding: 30px;">
				<h2>로그인</h2>
				<form name="myform" method="post" class="was-validated">
					<div class="form-group">
						<label for="mid">아이디 :</label>
						<input type="text" class="form-control" id="mid" placeholder="아이디" name="mid" value="${mid}" required autofocus />
						<div class="valid-feedback">정확한 아이디를 입력하세요.</div>
						<div class="invalid-feedback">아이디는 필수 입력사항입니다.</div>
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호 :</label>
						<input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd" maxlength="16" required />
						<div class="valid-feedback">정확한 비밀번호를 입력하세요.</div>
						<div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
					</div>
					<span class="col mt-3"><input type="checkbox" name="idCheck" checked/>아이디 저장</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					<button type="submit" class="btn btn-primary">로그인</button>
					<button type="reset" class="btn btn-primary">취소</button>
					<button type="button" onclick="location.href='${ctp}/';" class="btn btn-primary">돌아가기</button>
					<div class="row" style="font-size: 12px; text-align: center;">
						<span class="col mt-3">[<a href="${ctp}/member/pwdConfirm">비밀번호 찾기</a> | <a href="${ctp}/member/idConfirm">아이디 찾기</a> | <a href="${ctp}/member/memInput">회원가입</a>]</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>