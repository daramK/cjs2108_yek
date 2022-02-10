<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>info.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<style>
li a.info {
	color: #1a1a1a;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/infoNav.jsp"/>
<div class="container">
	<div class="info">
		<h1>ABOUT US</h1>
	</div>
	<div class="info" id="info">
		<img src="${ctp}/images/info_info.jpeg">
	</div>
	<div class="content">
		<p>
			&nbsp; 3대에 걸친 그레이시 가문의 목표는 주짓수를 배우고자 하는 전 세계의 모든 사람들이 그레이시만의 소중한 가치를 접할 수 있게 하는 것 입니다. 주짓수 창시자인 그랜드마스터 엘리오 그레이시 (1919-2009)의 손자들인 히론과 헤너 그레이시가 운영하는 미국 <a href="https://www.gracieuniversity.com/" target="_blank" style="color:#4DC7BD; font-weight:bold;">그레이시 유니버시티 본사</a>의 한국 지부입니다.
		</p>
		<h2>그레이시만의 품질</h2>
		<p>
			&nbsp; 그레이시만의 기본기와 기술들을 체계화하기 위하여 그레이시 유니버시티 본사의 대표 지도자들인 히론과 헤너 그레이시는 전세계 트레이닝 프로그램을 시작하게 되었고 주짓수를 가르치는 <a href="https://www.graciekorea.co.kr/instructor" target="_blank" style="color:#4DC7BD; font-weight:bold;">Instructor Certification Program (ICP)</a> 또는 공인인증 지도자 과정을 개발하였습니다.
			<br/>
			<br/>
			&nbsp; 한국을 포함한 전세계 175개의 공인인증센터들은 그레이시 유니버시티의 체계적인 과정들을 가르치고 있습니다. 1년 넘께 걸리는 기술 및 지도 교육을 거쳐 모든 공인인증 센터에서는 그레이시 본사의 수준 높은 지도 방식으로 그레이시만의 체계적인 과정들을 제공하고 있습니다. 
		</p>
		<h2>우리의 미션</h2>
		<p>
			&nbsp; 그레이시 주짓수 코리아는 전국 모든 곳에 공인인증센터를 개척하여 누구나 그레이시 주짓수를 배울 수 있도록 공인인증 넷워크를 구축하고 있습니다.
			<br/>
			<br/>
			&nbsp; 우리의 주요 목표는 그레이시 유니버시티 본사와 동일하고 전문적이고 체계적인 그레이시 만의 전통 교육을 모든 한국인들이 받을 수 있게 하는 것 입니다. 
		</p>
	</div>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>