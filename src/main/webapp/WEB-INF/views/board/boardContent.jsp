<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boardContent.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
		function delCheck() {
			var ans = confirm("게시글을 삭제하시겠습니까?");
			if(ans) location.href="${ctp}/board/boardDelete?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}";
		}
		
		$(document).ready(function(){
	    	$("#reply").show();
	    	$("#replyViewBtn").hide();
	    	
	    	$("#replyViewBtn").click(function(){
	    		$("#reply").slideDown(500);
	    		$("#replyViewBtn").hide();
	    		$("#replyHiddenBtn").show();
	    	});
	    	$("#replyHiddenBtn").click(function(){
	    		$("#reply").slideUp(500);
	    		$("#replyViewBtn").show();
	    		$("#replyHiddenBtn").hide();
	    	});
	    });
		
		function replyCheck() {
	    	var boardIdx = "${vo.idx}";
	    	var mid = "${sMid}";
	    	var nickname = "${sNickname}";
	    	var hostIp = "${pageContext.request.remoteAddr}";
	    	var content = replyForm.content.value;
	    	if(content == "") {
	    		alert("댓글을 입력하세요.");
	    		replyForm.content.focus();
	    		return false;
	    	}
	    	var query = {
	    			boardIdx : boardIdx,
	    			mid      : mid,
	    			nickname : nickname,
	    			hostIp   : hostIp,
	    			content  : content
	    	}
	    	
	    	$.ajax({
	    		type : "post",
	    		url  : "${ctp}/board/boardReplyInsert",
	    		data : query,
	    		success:function() {
	    			location.reload();
	    		}
	    	});
	    }
	    
	    function insertReply(idx,level,levelOrder,nickname) {
	    	var insReply = "";
	    	insReply += "<table style='width:90%'>";
	    	insReply += "<tr>";
	    	insReply += "<td>";
	    	insReply += "<div class='form-group'>";
	    	insReply += "<label for='content'>답변 댓글 달기:</label> &nbsp;";
	    	insReply += "<input type='text' name='nickname' size='6' value='${sNickname}' readonly />";
	    	insReply += "<textarea rows='3' class='form-control' name='content' id='content"+idx+"'>@"+nickname+"\n</textarea>";
	    	insReply += "</div>";
	    	insReply += "</td>";
	    	insReply += "<td>";
	    	insReply += "<input type='button' value='답글달기' onclick='replyCheck2("+idx+","+level+","+levelOrder+")'/>";
	    	insReply += "</td>";
	    	insReply += "</tr>";
	    	insReply += "</table>";
	    	insReply += "<hr style='margin:0px'/>";
	    	
	    	$("#replyBoxOpenBtn"+idx).hide();
	    	$("#replyBoxCloseBtn"+idx).show();
	    	$("#replyBox"+idx).slideDown(500);
	    	$("#replyBox"+idx).html(insReply);
	    }
	    
	    function closeReply(idx) {
	    	$("#replyBoxOpenBtn"+idx).show();
	    	$("#replyBoxCloseBtn"+idx).hide();
	    	$("#replyBox"+idx).slideUp(500);
	    }
	    
	    function replyCheck2(idx, level, levelOrder) {
	    	var boardIdx = "${vo.idx}";
	    	var mid = "${sMid}";
	    	var nickname = "${sNickname}";
	    	var hostIp = "${pageContext.request.remoteAddr}";
	    	var content = "content"+idx;
	    	var contentVal = $("#"+content).val();
	    	
	    	if(content == "") {
	    		alert("대댓글(답변글)을 입력하세요?");
	    		$("#"+content).focus();
	    		return false;
	    	}
	    	var query = {
	    			boardIdx : boardIdx,
	    			mid      : mid,
	    			nickname : nickname,
	    			hostIp   : hostIp,
	    			content  : contentVal,
	    			level    : level,
	    			levelOrder:levelOrder
	    	}
	    	
	    	$.ajax({
	    		type : "post",
	    		url  : "${ctp}/board/boardReplyInsert2",
	    		data : query,
	    		success:function() {
	    			location.reload();
	    		}
	    	});
	    }
	    
	    function replyDelCheck(replyIdx) {
	    	var ans = confirm("선택하신 댓글을 삭제하시겠습니까?");
	    	if(!ans) return false;
	    	
	    	$.ajax({
	    		type : "post",
	    		url  : "${ctp}/board/boardReplyDelete",
	    		data : {replyIdx : replyIdx},
	    		success:function() {
	    			location.reload();
	    		},
	    		error : function() {
	    			alert("전송오류");
	    		}
	    	});
	    }
	</script>
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
	<h3 style="text-align:center"><strong>자유게시판</strong></h3>
	<br/>
	<table class="table table-boardered">
		<tr>
			<th style="font-size: 1.7em;">제목</th>
			<td colspan="3" style="font-size: 1.7em;, weight: bold; align: center;">${vo.title} &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td>${vo.nickname}</td>
			<th>접속IP</th>
			<td>${vo.hostIp}</td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td>${vo.email}</td>
			<th>조회수</th>
			<td>${vo.readNum}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${fn:substring(vo.WDate,0,19)}</td>
		</tr>
		<tr>
			<th align="center">글내용</th>
			<td colspan="3" style="height:200px">${fn:replace(vo.content,newLine,'<br/>')}</td>
		</tr>
		<tr>
			<td colspan="4" class="text-center">
				<c:if test="${sw != 'search'}">
					<button type="button" class="btn btn-dark" onclick="location.href='${ctp}/board/boardList?pag=${pag}&pageSize=${pageSize}&lately=${lately}';">돌아가기</button>
					<c:if test="${sMid == vo.mid}">
						<button type="button" class="btn btn-dark" onclick="location.href='${ctp}/board/boardUpdate?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}';">수정하기</button>
					</c:if>
					<c:if test="${sMid == vo.mid || sLevel == 0}">
						<button type="button" class="btn btn-danger" onclick="delCheck()">삭제하기</button>
					</c:if>
				</c:if>
				<c:if test="${sw == 'search'}">
					<button type="button" class="btn btn-dark" onclick="history.back()">돌아가기</button>
				</c:if>
			</td>
		</tr>
	</table>
	
	<c:if test="${sw != 'search'}">
		<table class="table table-borderless">
			<tr>
				<td>
					<c:if test="${!empty pnVos[0]}">
						◀ <a href="${ctp}/board/boardContent?idx=${pnVos[0].idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">이전글 : ${pnVos[0].title}</a><br/>
					</c:if>
				</td>
				<td>
					<c:if test="${!empty pnVos[1]}">
						<a href="${ctp}/board/boardContent?idx=${pnVos[1].idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">다음글 : ${pnVos[1].title}</a> ▶<br/>
					</c:if>
				</td>
			</tr>
		</table>
	</c:if>
	<br/>
	
	<div class="container text-center mb-3">
		<input type="button" value="댓글보이기" id="replyViewBtn" class="btn btn-secondary"/>
		<input type="button" value="댓글가리기" id="replyHiddenBtn" class="btn btn-secondary"/>
	</div>
	<div id="reply">
		<table class="table table-hover">
			<tr>
				<th>작성자</th>
				<th>댓글내용</th>
				<th>작성일자</th>
				<th>접속IP</th>
				<th>답글</th>
			</tr>
			<c:forEach var="rVo" items="${rVos}">
				<tr>
					<c:if test="${rVo.level <= 0 }">
						<td>
							<strong>${rVo.nickname}</strong>
						</td>
					</c:if>
					<c:if test="${rVo.level > 0}">
						<td>
							<c:forEach var="i" begin="1" end="${rVo.level}">&nbsp;&nbsp; </c:forEach>
								 └ ${rVo.nickname}
						</td>
					</c:if>
					<td>
						${rVo.content}
					</td>
					<td>${rVo.WDate}</td>
					<td>${rVo.hostIp}</td>
					<td>
						<input type="button" value="답글" onclick="insertReply('${rVo.idx}','${rVo.level}','${rVo.levelOrder}','${rVo.nickname}')" id="replyBoxOpenBtn${rVo.idx}" />
						<input type="button" value="닫기" onclick="closeReply(${rVo.idx})" id="replyBoxCloseBtn${rVo.idx}" class="replyBoxClose" style="display:none"/>
						<c:if test="${rVo.mid == sMid}">
								<a href="javascript:replyDelCheck(${rVo.idx});"><span i class="fa fa-close"></span></a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="5"><div id="replyBox${rVo.idx}"></div></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<form name="replyForm">
		<table class="table">
			<tr>
				<td style="width:90%">
					<strong>댓글</strong>
					<textarea rows="4" name="content" id="content" class="form-control"></textarea>
				</td>
				<td style="width:10%">
					<br/><p><strong>작성자 </strong> : <br/>${sNickname}</p>
					<p>
						<input type="button" value="댓글달기" onclick="replyCheck()"/>
					</p>
				</td>
			</tr>
		</table>
		<input type="hidden" name="boardIdx" value="${vo.idx}"/>
		<input type="hidden" name="mid" value="${sMid}"/>
		<input type="hidden" name="nickname" value="${sNickname}"/>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		<input type="hidden" name="pag" value="${pag}"/>
		<input type="hidden" name="pageSize" value="${pageSize}"/>
		<input type="hidden" name="lately" value="${lately}"/>
	</form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>