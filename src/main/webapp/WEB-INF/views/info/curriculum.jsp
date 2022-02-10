<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>curriculum.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<style>
li a.curriculum {
	color: #1a1a1a;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/infoNav.jsp"/>
<div class="container">
	<div class="curriculum">
		<h1>커리큘럼</h1>
	</div>
	<div class="curriculumVideo" id="curriculumVideo" style="text-align: center;">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/KN8fJ97zOvE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<div class="content">
		<p>그레이시 유니버시티의 과정은 흰 띠에서 검은 띠까지 순차적으로 정리되어 있다. 그리고 나이, 성별, 운동실력과 무관하게 누구나 배울 수 있도록 다양한 과정을 설계했습니다.  전 세계 모든 그레이시 공인인증센터에서 동일한 커리큘럼을 그레이시 만의 교수 비법을 활용해서 가르칩니다.</p></br></br>
		<h3>GRACIE COMBATIVES® 성인 기초 과정</h3>	
			
		<hr/>
		
	</div>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>