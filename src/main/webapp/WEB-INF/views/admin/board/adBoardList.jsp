<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adBoardList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
		function nickSearch() {
			var nickname = adBoardForm.nickname.value;
			if(nickname == "") {
				alert("닉네임을 입력하세요.");
				adBoardForm.nickname.focus();
			}
			else {
				location.href = "${ctp}/admin/adBoardList?nickname="+nickname;
			}
		}

		$(function() {
			$("#checkAll").click(function(){
				if($("#checkAll").prop("checked")) {
					$(".chk").prop("checked", true);
				}
				else {
					$(".chk").prop("checked", false);
				}
			});
		});
		
		function selectDelCheck() {
			var ans = confirm("선택된 게시물을 모두 삭제하시겠습니까?");
			if(!ans) return false;
			var delItems = "";
			for(var i=0; i<adBoardForm.chk.length; i++) {
				if(adBoardForm.chk[i].checked == true) delItems += adBoardForm.chk[i].value + "/";
			}
			
			$.ajax({
				type : "post",
				data : {delItems : delItems},
				success:function() {
					location.reload();
				},
				error:function() {
					alert("전송오류");
				}
			});
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="adBoardForm">
		<table class="table table-borderless m-0">
			<tr>
				<td colspan="2">
					<c:choose>
						<c:when test="${category=='일반'}"><c:set var="title" value="일반"/></c:when>
						<c:when test="${category=='공지'}"><c:set var="title" value="공지"/></c:when>
					</c:choose>
					<h2 style="text-align:center;"><font color="blue">${title}</font> 게시판관리 (총 : <font color="red">${totRecCnt}</font>건)</h2>
				</td>
			</tr>
			<tr>
				<td style="text-align:left">
					<input type="text" id="nickname" name="nickname" value="${title}" placeholder="글쓴이"/>
					<input type="button" value="검색" onclick="nickSearch()"/>
					<input type="button" value="전체보기" onclick="location.href='${ctp}/admin/adBoardList';" class="btn btn-secondary btn-sm"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" id="checkAll"/> 전체선택
					<input type="button" value="선택항목삭제" onclick="selectDelCheck()" class="btn btn-danger btn-sm"/>
				</td>
				<td style="text-align:right"><strong>카테고리</strong>
					<select id="category" name="category" onchange="categorySearch()">
						<option value="일반" <c:if test="${category=='일반'}">selected</c:if>>일반</option>
						<option value="공지" <c:if test="${category=='공지'}">selected</c:if>>공지</option>
					</select>
				</td>
			</tr>
		</table>
		<table class="table table-hover">
			<tr class="table-dark text-dark text-center">
				<th>선택</th>
				<th>번호</th>
				<th>카테고리</th>
				<th>글제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr class="text-center">
					<td><input type="checkbox" name="chk" class="chk" value="${vo.idx}"/></td>
					<td>${curScrStrarNo}</td>
					<td>
						<select name="category" onchange="categoryCheck(this)">
							<option value="1${vo.idx}" <c:if test="${vo.category=='일반'}">selected</c:if>>일반</option>
							<option value="2${vo.idx}" <c:if test="${vo.category=='공지'}">selected</c:if>>공지</option>
						</select>
					</td>
					<td align="left">${vo.title}</td>
					<td>${vo.nickname}</td>
					<td>${vo.WDate}</td>
					<td>${vo.readNum}</td>
				</tr>
				<c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"/>
			</c:forEach>
		</table>
	</form>
	<br/>
<c:if test="${totPage == 0}"><p style="text-align:center"><font color="red"><b>자료가 없습니다.</b></font></p></c:if>
<c:if test="${totPage != 0}">
	<div style="text-align:center">
		<c:if test="${pag != 1}"><a href="${ctp}/admin/adBoardList?pag=1">◁◁</a></c:if> &nbsp;&nbsp;
		<c:if test="${pag > 1}"><a href="${ctp}/admin/adBoardList?pag=${pag-1}">◀</a></c:if>
		&nbsp;&nbsp; ${pag}Page / ${totPage}pages &nbsp;&nbsp;
		<c:if test="${pag < totPage}"><a href="${ctp}/admin/adBoardList?pag=${pag+1}">▶</a></c:if> &nbsp;&nbsp;
		<c:if test="${pag != totPage}"><a href="${ctp}/admin/adBoardList?pag=${totPage}">▷▷</a></c:if>
	</div>
</c:if>
</div>
<br/>
</body>
</html>