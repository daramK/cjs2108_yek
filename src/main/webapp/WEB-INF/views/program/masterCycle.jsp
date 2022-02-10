<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>masterCycle.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<style>
li a.masterCycle {
	color: #1a1a1a;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/programNav.jsp"/>
<div class="container">
	<div class="masterCycle">
		<h1>MASTER CYCLE®</h1>
	</div>
	<div class="masterCycleVideo" id="masterCycleVideo" style="text-align: center;">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/sTRyHR4KYbw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<div class="content">
		<p>
			&nbsp; Gracie Combatives® 벨트 또는 이상인 분들을 위한 그레이시 주짓수 Master Cycle® 과정은 체계적인 교육 시스템과 수백 가지의 고급 기술들로 구성되어 있습니다. 마스터 사이클에서는 블랙벨트가 되기까지 위한 모든 그레이시 주짓수 기술들을 일곱 가지 자세로 (Mount, Side Mount, Guard, Half Guard, Back Mount, Leg Locks, Standing) 체계적으로 나눠서 배우시게 됩니다.
		</p>
		<p style="text-align: center;">
			<img src="${ctp}/images/mastercyclechart.jpeg">
			<br/>
			<br/>
			<br/>
			<br/>
		</p>
		<h2>수업 방식</h2>
		<h3>기술 복습</h3>
		<p>
			&nbsp; 마스터 사이클은 15분-20분의 리뷰와 몸풀기로 시작되는데 이전에 배운 과정과 온라인으로 배운 기술들을 복습하는 간단한 세션이 포함되어 있습니다. 본 시간에는 훈련하는 파트너와 서로 협력하고 강사에게 궁금한 점을 질문하도록 합니다.
			<br/>
			<br/>
		</p>
		<h3>기술 연습</h3>
		<p>
			&nbsp; 리뷰가 끝난 후 강사는 2-3 가지의 새로운 기술들을 소개하고 학생들은 움직임이 몸에서 자연스러워 질 때까지 파트너와 함께 기술을 연습합니다. 7가지 주요 포지션 (Mount, Side Mount, Guard, Half-Guard, Back Mount, Standing, Leg Locks) 별 모든 주짓수 기술들을 정리하여 몇 주 동안 한 포지션 또는 “Chapter”에 집중적으로 수련을 하게됩니다.
			<br/>
			<br/>
		</p>
		<h3>대련</h3>
		<p>
			&nbsp; 클래스 마지막 부분에선 여러 파트너들과 다양한 기술들을 복합적으로 응용해서 본인의 능력을 스스로 평가할 수 있는 시간을 갖습니다. 스파링 연습을 하는 동안에는 안전을 가장 중요시하며 안전한 방식으로 훈련을 하지 않는 학생은 스파링을 금지 당하게 됩니다. 아무리 고급반인 마스터 사이클 반이지만 학생에게 스파링을 하도록 강요하지 않습니다. 그리고 Fight Simulation™ 수업에서 수련생들은 5.5 oz. 장갑을 착용해 타격을 폭함한 훈련과 대련을 하게 됩니다.
			<br/>
			<br/>
		</p>
		<h3>승급</h3>
		<p>
			&nbsp; 고급과정인 마스터 사이클은 안전하고 체계적인 학습 환경에서 블랙벨트까지의 경로를 계속하려는 컴벳티브 벨트 이상 수련자에게 적합한 프로그램입니다. 마스터 사이클 프로그램에 대해 보다 자세한 내용을 보시려면 아래로 스크롤 바랍니다.
		</p>
	</div>
</div>
<br/>
</body>
</html>