<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>guestInput.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
		function fCheck() {
			var name = myform.name.value;
			var content = myform.content.value;
			
			if(name == "") {
				alert("글쓴이를 입력하세요");
				myform.name.focus();
			}
			else if(content == "") {
				alert("글내용을 입력하세요.");
				myform.content.focus();
			}
			else {
				myform.submit();
			}
		}
	</script>
	<style>
		label {
		font-weight: bold;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" class="was-validated">
		<h2>글쓰기</h2>
		<hr/>
		<div class="form-group">
			<label for="name">글쓴이</label> &nbsp;
			<input type="text" name="name" id="name" class="form-control" placeholder="성명" required autofocus />
			<div class="invalid-feedback">글쓴이는 필수 입력사항입니다.</div>
		</div>
		<div class="form-group">
			<label for="email">E-mail</label> &nbsp;
			<input type="text" name="email" id="email" class="form-control" placeholder="E-mail" required autofocus />
			<div class="valid-feedback">E-mail은 선택 입력사항입니다.</div>
		</div>
		<br/>
		<div class="form-group">
			<label for="content">글내용</label>
			<textarea rows="3" name="content" id="content" class="form-control" required></textarea>
			<div class="invalid-feedback">글내용은 필수 입력사항입니다.</div>
		</div>
		<hr/>
		<div class="form-group" align="right">
			<button type="button" class="btn btn-success" onclick="fCheck()">등록</button>
			<button type="reset" class="btn btn-secondary">다시작성</button>
		</div>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
	</form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>