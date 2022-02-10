<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adMemberInfo.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원정보</h2>
	<br/>
	<table class="table">
		<tr><td>아이디 : ${vo.mid}</td></tr>
		<tr><td>성명 : ${vo.name}</td></tr>
		<tr><td>닉네임 : ${vo.nickname}</td></tr>
		<tr><td>성별 : ${vo.gender}</td></tr>
		<tr><td>생일 : ${vo.birthday}</td></tr>
		<tr><td>E-mail : ${vo.email}</td></tr>
		<tr><td>전화번호 : ${vo.tel}</td></tr>
		<tr><td>주소 : ${vo.address}</td></tr>
		<tr><td>정보공개 : ${vo.userInfo}</td></tr>
		<tr>
			<td>탈퇴여부 : 
				<c:if test="${vo.userDel ne 'NO'}"><font color="red">탈퇴신청</font></c:if>
				<c:if test="${vo.userDel eq 'NO'}">활동중</c:if>
			</td>
		</tr>
		<tr><td>포인트 : <fmt:formatNumber value="${vo.point}"/></td></tr>
		<tr>
			<td>등급 : 
				<c:choose>
					<c:when test="${vo.level == 1}"><c:set var="level" value="퍼플"/></c:when>
					<c:when test="${vo.level == 2}"><c:set var="level" value="블루"/></c:when>
					<c:when test="${vo.level == 3}"><c:set var="level" value="화이트"/></c:when>
					<c:when test="${vo.level == 4}"><c:set var="level" value="준회원"/></c:when>
					<c:when test="${vo.level == 0}"><c:set var="level" value="관리자"/></c:when>
				</c:choose>
				${level}
			</td>
		</tr>
		<tr><td>가입일 : ${vo.startDate}</td></tr>
		<tr><td>최종 방문일 : ${vo.lastDate}</td></tr>
		<tr><td>오늘 방문수 : ${vo.todayCnt}</td></tr>
		<tr><td>총 방문수 : ${vo.visitCnt}</td></tr>
	</table>
	<hr/>
	<a href="${ctp}/admin/adMemberList" class="btn btn-secondary">돌아가기</a>
</div>
<br/>
</body>
</html>