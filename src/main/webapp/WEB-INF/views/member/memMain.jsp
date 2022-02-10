<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memMain.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
	function memDeleteCheck() {
		var ans = confirm("정말 탈퇴하시겠습니까?");
		if(ans) {
			ans = confirm("탈퇴하시게 되면 1개원간 동일한 아이디로 재가입하실 수 없습니다.\n탈퇴 하시겠습니까?");
			if(ans) location.href = "${ctp}/member/memDelete";
		}
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<p><br/></p>
<div class="container">
	<h2>${sNickname}님</h2>
	<hr/>
	<p>현재 등급은 <font color="red">${sStrLevel}</font> 입니다.</p>
	<p>가입일 : <font color="blue">${vo.startDate}</font></p>
	<p>최종 접속일 : <font color="blue">${sLastDate}</font></p>
	<p>총 방문횟수 : <font color="blue">${vo.visitCnt}</font> 회</p>
	<p>오늘 방문횟수 : <font color="blue">${vo.todayCnt}</font> 회</p>
	<p>총 포인트 : <font color="blue">${vo.point}</font> (1일 1회 방문시 10포인트, 최대 50포인트까지 적립됩니다.)</p>
	<hr/>
	<h4><strong>나의 활동</strong></h3>
	<p>
		<a href="#">내가 쓴 글 보기</a> : <font color="blue">${boardCnt}</font> 개<br/>
		<a href="#">내가 쓴 댓글보기</a> : <font color="blue"></font> 개<br/>
	</p>
	<hr/>
	<p>
		<button type="button" class="btn btn-primary" onclick="location.href='${ctp}/member/memPwdCheck';">회원정보수정</button>
		<button type="button" class="btn btn-secondary" onclick="javascript:memDeleteCheck()">회원탈퇴</button>
	</p>
	<hr/>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>