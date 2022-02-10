<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boardList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
		function latelyCheck() {
			var lately = document.getElementById("lately").value;
			if(lately == "") {
				alert("검색일자를 선택하세요");
			}
			else {
				location.href="${ctp}/board/boardList?page=${pag}&pageSize=${pageSize}&lately="+lately;
			}
		}
		
		function pageCheck() {
			var pageSize = document.getElementById("pageSize").value;
			location.href = "${ctp}/board/boardList?pag=${pag}&pageSize="+pageSize;
		}
		
		function searchChange() {
			searchForm.searchString.focus();
		}
		
		function searchCheck() {
			var searchString = searchForm.searchString.value;
			if(searchString == "") {
				alert("검색어를 입력하세요.");
				searchForm.searchString.focus();
			}
			else {
				searchForm.submit();
			}
		}
	</script>
	<style>
		th, td {
			text-align: center;
		}
		.table-dark>th {
			background-color: #000;
			color: #fff;
		}
		.table-dark>th:hover {
			color: #000;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<p><br/></p>
<div class="container">
	<table class="table table-borderless">
		<tr>
			<td colspan="2" class="p-0"><h2>자유게시판</h2></td>
		</tr>
		<tr>
			<td class="text-right p-0">
				<select name="lately" id="lately" onchange="latelyCheck()">
					<option value="0">최근자료순</option>
					<c:forEach var="i" begin="1" end="30">
						<option value="${i}" ${lately==i ? 'selected' : ''}>${i}일전</option>
					</c:forEach>
				</select>
				<select name="pageSize" id="pageSize" onchange="pageCheck()" class="p-0 m-0">
					<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
					<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
					<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
					<option value="25" ${pageSize==25 ? 'selected' : ''}>25건</option>
				</select> &nbsp; &nbsp; &nbsp;
				<a href="${ctp}/board/boardInput" class="btn btn-dark btn-sm"><strong>글쓰기</strong></a> &nbsp;
			</td>
		</tr>
	</table>
	<table class="table table-hover">
		<tr class="table-dark text-dark">
			<th>글번호</th>
			<th>카테고리</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td>${curScrStrarNo}</td>
				<td>
					<c:if test="${vo.category eq '공지'}"><font color="red"><strong>공지</strong></font></c:if>
					<c:if test="${vo.category eq '일반'}"><font color="black">일반</font></c:if>
				</td>
				<td class="text-left">
					<a href="${ctp}/board/boardContent?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">
						<c:if test="${vo.category eq '공지'}"><strong>${vo.title}</strong></c:if>
						<c:if test="${vo.category ne '공지'}">${vo.title}</c:if>
					</a>
					<c:if test="${vo.diffTime <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
					<c:if test="${vo.replyCount != 0}">(${vo.replyCount})</c:if>
				</td>
				<td>
					<c:if test="${vo.nickname eq '관리자'}"><strong>관리자</strong></c:if>
					<c:if test="${vo.nickname ne '관리자'}">${vo.nickname}</c:if>
				</td>
				<td>${fn:substring(vo.WDate,0,10)}</td>
				<td>${vo.readNum}</td>
			</tr>
			<c:set var="curScrStrarNo" value="${curScrStrarNo -1}"/>
		</c:forEach>
	</table>
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/board/boardList?pag=1&pageSize=${pageSize}&lately=${lately}" title="첫페이지" class="page-link text-secondary">◁◁</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/board/boardList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" title="이전블록" class="page-link text-secondary">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='${ctp}/board/boardList?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-light bg-secondary border-secondary">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/board/boardList?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-secondary">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/board/boardList?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" title="다음블록" class="page-link text-secondary">▶</a>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/board/boardList?pag=${totPage}&pageSize=${pageSize}&lately=${lately}" title="마지막페이지" class="page-link" style="color:#555">▷▷</a>
				</c:if>
			</c:if>
		</ul>
	</div>
	<div class="container text-center">
		<form name="searchForm" method="post" action="${ctp}/board/boardSearch">
			<select name="search" onchange="searchChange()">
				<option value="title">글제목</option>
				<option value="nickname">글쓴이</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchString"/>
			<input type="button" value="검색" onclick="searchCheck()"/>
			<input type="hidden" name="pag" value="${pag}"/>
			<input type="hidden" name="pageSize" value="${pageSize}"/>
		</form>
	</div>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>