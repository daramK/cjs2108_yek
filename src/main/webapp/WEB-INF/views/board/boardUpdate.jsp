<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boardUpdate.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
	<script>
		function fCheck() {
			var title = myform.title.value;
			var content = myform.content.value;
			
			if(title.trim() == ""){
				alert("제목을 입력하세요.");
				myform.title.focus();
			}
			else {
				myform.oriContent.value = document.getElementById("oriContent").innerHTML;
				myform.submit();
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
		<table class="table table-borderless">
			<tr>
				<td><h2>글수정</h2></td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category">
						<c:if test="${sLevel!=0}">
							<option value="일반" selected>일반</option>
							<input type="hidden" name="pin" value="0"/>
						</c:if>
						<c:if test="${sLevel==0}">
							<option value="공지">공지</option>
							<input type="hidden" name="pin" value="1"/>
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
				<td><input type="text" name="email" value="${vo.email}" class="form-control"/></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="title" value="${vo.title}" class="form-control" autofocus required /></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><textarea rows="4" name="content" id="CKEDITOR" class="form-control" required>${vo.content}</textarea></td>
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
					<input type="button" value="수정하기" onclick="fCheck()" class="btn btn-primary"/>
					<input type="reset" value="다시입력" class="btn btn-danger"/>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/board/boardList';" class="btn btn-secondary"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		<input type="hidden" name="idx" value="${vo.idx}"/>
		<input type="hidden" name="pag" value="${pag}"/>
		<input type="hidden" name="pageSize" value="${pageSize}"/>
		<input type="hidden" name="lately" value="${lately}"/>
		<input type="hidden" name="oriContent"/>
		<div id="oriContent" style="display:none;">${vo.content}</div>
	</form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>