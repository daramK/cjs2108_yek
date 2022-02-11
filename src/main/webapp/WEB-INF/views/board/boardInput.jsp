<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boardInput.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
	<script>
		function fCheck() {
			var title = myform.title.value;
			var content = myform.content.value;
			var category = myform.category.value;
			var pin = myform.pin.value;
			
			if(title.trim() == ""){
				alert("제목을 입력하세요.");
				myform.title.focus();
			}
			else {
				if(category == '공지') {
					alert("공지글입니다.");
					pin = 1;
					myform.submit();
				}
				else{
					alert("일반글입니다.");
					myform.submit();
				}
			}
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<p><br/></p>
<div class="container">
	<form name="myform" method="post">
		<table class="table">
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category">
							<option value="일반" selected>일반</option>
						<c:if test="${sLevel==0}">
							<option value="공지">공지</option>
						</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${sNickname}</td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" placeholder="E-mail" value="${email}" class="form-control"/></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="title" placeholder="글제목" class="form-control" autofocus required /></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><textarea rows="4" name="content" id="CKEDITOR" class="form-control" required></textarea></td>
				<script>
					CKEDITOR.replace("content",{
						uploadUrl: "${ctp}/imageUpload",
						filebrowserUploadUrl : "${ctp}/imageUpload",
						height:460
					});
				</script>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<input type="button" value="글쓰기" onclick="fCheck()" class="btn btn-success"/>
					<input type="reset" value="다시입력" class="btn btn-danger"/>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/board/boardList';" class="btn btn-secondary"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		<input type="hidden" name="mid" value="${sMid}"/>
		<input type="hidden" name="nickname" value="${sNickname}"/>
		<input type="hidden" name="pin" value="0"/>
	</form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>