<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>qna.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<style>
li a.qna {
	color: #1a1a1a;
	text-align: center;
}
ol {
	list-style-type: decimal;
	margin-blick-start: 1em;
	margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.content.li {
	display: list-item;
}
.qnaQ {
	font-size: 1.5em;
	font-weight: bold;
}
.qunA {
	font-size: 1em;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/infoNav.jsp"/>
<div class="container">
	<div class="qna">
		<h1>자주하는 질문</h1>
	</div>
	<div class="qnaVideo" id="qnaVideo" style="text-align: center;">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/MvYlydDVaTA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<div class="content">
		<ol>
			<li>
				<p class="qnaQ">그레이시 주짓수와 스포츠 주짓수의 차이가 있나요?</p>
				<p class="anaA">
					그레이시 주짓수는 실전 싸움에서 나타나는 공격 특성을 고려한 호신술이며 스포츠 주짓수는 타격을 배재한 경기용 주짓수입니다. 쉽게 요약해서, 그레이시 주짓수는 상대가 때릴수도 있다는 것을 고려한 호신술입니다.
				</p>
			</li>
			<li>
				<p class="qnaQ">10일 무료체험은 무엇인가요?</p>
				<p class="anaA">
					모든 그레이시 공인인증센터에서 10일 기간 동안 무료로 수련을 할 수 있습니다. 아무런 비용 부담없이 그레이시 과정들을 체험 해볼 수 있는 기회입니다. 해당 센터 페이지에서 문의하시면 바로 예약하실 수 있습니다!
				</p>
			</li>
			<li>
				<p class="qnaQ">체험하러 갈 때 필요한 게 있나요?</p>
				<p class="anaA">
					아무것도 필요 없습니다. 다만, 도복 안에 입을 수 있는 티셔츠나 래쉬가드를 가져오시면 됩니다.
				</p>
			</li>
			<li>
				<p class="qnaQ">흰색 도복만 입나요?</p>
				<p class="anaA">
					네, 청결을 위해 흰색 도복만을 입습니다. 그레이시 가문의 전통 규정입니다. 도복 색상이 변하면 천이 썩었다는 것을 쉽게 볼 수 있기 때문에 규정을 이렇게 정한겁니다.
				</p>
			</li>
			<li>
				<p class="qnaQ">경험이 없어도 배울 수 있나요?</p>
				<p class="anaA">
					물론입니다! 주짓수를 처음 시작하는 초보자들을 위한 기초 과정들이 있습니다. 성인을 위한 Gracie Combatives® 및 여성전용 Women Empowered® 과정이 있으며 어린이들을 위한 Little Champs (6세-8세) 및 Jr. Grapplers (9세-13세) 과정이 있습니다.
				</p>
			</li>
			<li>
				<p class="qnaQ">온라인 과정은 무엇인가요?</p>
				<p class="anaA">
					그레이시 공인인증센터에 등록하는 모든 회원님들을 위해 무료로 모든 기술 과정들을 온라인으로 보실 수 있도록 가입을 시켜드립니다. 센터에서 배우는 기술 과정들을 그대로 박같에서 보실 수 있도록 준비한 혜택입니다.
				</p>
			</li>
			<li>
				<p class="qnaQ">주짓수는 위험한가요?</p>
				<p class="anaA">
					어디서 어떻게 배우는지에 따라 매우 다를 수 있습니다. 저희 센터들에서는 기초 과정들에서 스파링 또는 대련을 하지 않습니다. 주짓수의 기본기를 배우고 난 후에 대련을 시작하며 센터 문화와 분의기는 모두 협조와 배려에 초점을 맞췃습니다
				</p>
			</li>
			<li>
				<p class="qnaQ">공인인증 지도자가 무엇인가요?</p>
				<p class="anaA">
					모든 센터 관장님들은 주짓수를 개발한 그레이시 가문으로부터 1년을 넘는 기술과 지도 과정을 통과하였습니다. 효과적으로 그레이시만의 체계적인 과정들을 가르칠 수 있도록 인증된 지도자들입니다.
				</p>
			</li>
			<li>
				<p class="qnaQ">다른 센터에서도 훈련 가능한가요?</p>
				<p class="anaA">
					네, 한 공인인증센터의 회원이고 출장 또는 여행 목적으로 다른 지역으로 가시면 그 지역에 있는 그레이시 공인인증센터에서 무료로 수업을 들을 수 있습니다. 그리고 모든 센터에서 동일한 과정들을 가르치기 때문에 듣는 수업에 대한 인증도 복귀하신 후에 받을 수 있습니다.
				</p>
			</li>
		</ol>
	</div>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>