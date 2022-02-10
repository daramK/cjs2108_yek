<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	function memDeleteCheck() {
		var ans = confirm("정말 탈퇴하시겠습니까?");
		if(ans) {
			ans = confirm("탈퇴하시게 되면 1개원간 동일한 아이디로 재가입하실 수 없습니다.\n탈퇴 하시겠습니까?");
			if(ans) location.href = "${ctp}/member/memDelete";
		}
	}
</script>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="${ctp}/" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="info" onclick="location.href='${ctp}/info/info'">소개 <i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/info/info" class="w3-bar-item w3-button">우리 소개</a>
        <a href="${ctp}/info/curriculum" class="w3-bar-item w3-button">커리큘럼</a>
        <a href="${ctp}/info/qna" class="w3-bar-item w3-button">자주하는 질문</a>
        <a href="${ctp}/info/history" class="w3-bar-item w3-button">역사</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="program" onclick="location.href='${ctp}/program/gracieCombatives'">프로그램 <i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/program/gracieCombatives" class="w3-bar-item w3-button">성인 기초</a>
        <a href="${ctp}/program/gracieBullyproof" class="w3-bar-item w3-button">어린이</a>
        <a href="${ctp}/program/masterCycle" class="w3-bar-item w3-button">성인 고급</a>
        <a href="${ctp}/program/privateClass" class="w3-bar-item w3-button">개인 지도</a>
      </div>
    </div>
    <a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
    <a href="#map" class="w3-bar-item w3-button w3-padding-large w3-hide-small">위치</a>
    <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">방명록</a>
    <c:if test="${sLevel <= 4}">
    	<a href="${ctp}/board/boardList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">자유게시판</a>
    	<a href="${ctp}/pds/pdsList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">사진첩</a>
    	<div class="w3-dropdown-hover w3-hide-small w3-right">
	      <button class="w3-padding-large w3-button" title="More" onclick="location.href='${ctp}/member/memMain">${sNickname} <i class="fa fa-caret-down"></i></button>
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <c:if test="${sLevel == 0}">
	        	<a href="${ctp}/admin/adMenu" class="w3-bar-item w3-button"><font color="red">관리자</font></a>
	        </c:if>
	        <a href="${ctp}/member/memMain" class="w3-bar-item w3-button">내정보</a>
	        <a href="${ctp}/member/memPwdCheck" class="w3-bar-item w3-button">정보수정</a>
	        <a href="javascript:memDeleteCheck()" class="w3-bar-item w3-button">회원탈퇴</a>
	        <c:if test="${!empty sLevel}"><a href="${ctp}/member/memLogout" class="w3-bar-item w3-button">로그아웃</a></c:if>
	      </div>
    	</div>
    </c:if>
    <c:if test="${empty sLevel}"><a href="${ctp}/member/memLogin" class="w3-padding-large w3-hover-red w3-hide-small w3-right">로그인</a></c:if>
    <a href="https://gracielifestyle.co.kr/" target="_blank" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-shopping-bag" style="font-size:20px"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">CONTACT</a>
  <a href="#map" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">위치</a>
</div>
