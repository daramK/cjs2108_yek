<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adGuestList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
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
			for(var i=0; i<myform.chk.length; i++) {
				if(myform.chk[i].checked == true) delItems += myform.chk[i].value + "/";
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
<div class="m-4">
	<form name="myform">
		<table class="table table-borderless m-0">
			<tr class="text-center">
				<td><h3> 방명록 관리(총: ${totRecCnt}건)</h3></td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" id="checkAll"/>전체선택 &nbsp; &nbsp; &nbsp; &nbsp;
					<input type="button" value="선택항목삭제" onclick="selectDelCheck()" class="btn btn-danger btn-sm"/>
				</td>
			</tr>
		</table>
		<table class="table table-hover">
			<tr class="table-dark text-dark text-center">
				<th>선택</th>
				<th>번호</th>
				<th>글쓴이</th>
				<th>글내용</th>
				<th>날짜</th>
				<th>접속IP</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr class="text-center">
					<td><input type="checkbox" name="chk" class="chk" value="${vo.idx}"/></td>
					<td>${curScrStrarNo}</td>
					<td>${vo.name}</td>
					<td class="text-left">${fn:replace(vo.content,newLine,"<br/>")}</td>
					<td>${fn:substring(vo.VDate,0,10)}</td>
					<td>${vo.hostIp}</td>
				</tr>
				<c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"/>
			</c:forEach>
		</table>
	</form>
</div>
<hr/>
<c:if test="${totPage == 0}"><p style="text-align:center"><font color="red"><b>자료가 없습니다.</b></font></p></c:if>
<c:if test="${totPage != 0}">
	<div style="text-align:center">
		<c:if test="${pag != 1}"><a href="${ctp}/admin/adGuestList?pag=1">◁◁</a></c:if> &nbsp;&nbsp;
		<c:if test="${pag > 1}"><a href="${ctp}/admin/adGuestList?pag=${pag-1}">◀</a></c:if>
		&nbsp;&nbsp; ${pag}Page / ${totPage}pages &nbsp;&nbsp;
		<c:if test="${pag < totPage}"><a href="${ctp}/admin/adGuestListpag=${pag+1}">▶</a></c:if> &nbsp;&nbsp;
		<c:if test="${pag != totPage}"><a href="${ctp}/admin/adGuestList?pag=${totPage}">▷▷</a></c:if>
	</div>
</c:if>
</body>
</html>