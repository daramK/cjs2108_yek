<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>guestList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>	
	<style>
		th {
			background-color: #000;
			color: #fff;
			text-align: center;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<p><br/></p>
<div class="container">
	<h2 align="center">방 명 록</h2>
	<hr/>
	<br/>
	<p align="right"><a href="${ctp}/guest/guestInput" class="btn btn-dark"><strong>글쓰기</strong></a></p>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<td>
					<strong>방문번호</strong> :  ${curScrStrarNo} &nbsp;
				</td>
				<td style="text-align:right;">
					<strong>방문 IP</strong> :  ${vo.hostIp}
				</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th style="width:20%;">성명</th>
				<td style="width:25%;">${vo.name}</td>
				<th style="width:20%;">방문일자</th>
				<td style="width:35%;">${vo.VDate}</td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td colspan="3">${vo.email}</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3">${fn:replace(vo.content,newLine,'<br/>')}</td>
			</tr>
		</table>
		<br/>
		<c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"/>
	</c:forEach>
</div>
<div class="container">
	<ul class="pagination justify-content-center">
		<c:if test="${totPage == 0}"><p style="text-align:center"><b>등록된 글이 없습니다.</b></p></c:if>
		<c:if test="${totPage != 0}">
			<c:if test="${pag != 1}">
				<li class="page-item"><a href="${ctp}/guest/guestList?pag=1" title="첫페이지" class="page-link text-secondary">◁◁</a></li>
			</c:if>
			<c:if test="${curBlock > 0}">
				<li class="page-item"><a href="${ctp}/guest/guestList?pag=${(curBlock-1)*blockSize + 1}" title="이전블록" class="page-link text-secondary">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				<c:if test="${i == pag && i <= totPage}">
					<li class="page-item active"><a href='${ctp}/guest/guestList?pag=${i}' class="page-link text-light bg-secondary border-secondary">${i}</a></li>
				</c:if>
				<c:if test="${i != pag && i <= totPage}">
					<li class="page-item"><a href='${ctp}/guest/guestList?pag=${i}' class="page-link text-secondary">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${curBlock < lastBlock}">
				<li class="page-item"><a href="${ctp}/guest/guestList?pag=${(curBlock+1)*blockSize + 1}" title="다음블록" class="page-link text-secondary">▶</a>
			</c:if>
			<c:if test="${pag != totPage}">
				<li class="page-item"><a href="${ctp}/guest/guestList?pag=${totPage}" title="마지막페이지" class="page-link" style="color:#555">▷▷</a>
			</c:if>
		</c:if>
	</ul>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>