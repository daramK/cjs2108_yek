<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>그레이시 주짓수 모충</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		body {font-family: proxima-nova,"Lato", sans-serif}
		.map {
			width: 800px;
			height: 500px;
			margin: 0 auto;
		}
		.map iframe{
			width: 100%;
			height: 85%;
			border: 0;
		}
	</style>
</head>
<body>
<!-- Navbar -->
<jsp:include page="/WEB-INF/views/include/nav2.jsp"/>

<div class="w3-content" style="max-width:2000px;margin-top:46px">

	<!-- Page content -->
	
	<!-- video -->
	<jsp:include page="/WEB-INF/views/include/video.jsp"/>
	
	<!-- The Band Section -->
	<div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
	    <h2 class="w3-wide">GRACIE</h2>
	    <p class="w3-opacity"><i>그레이시 주짓수 코리아</i></p>
	    <p class="w3-justify">나이, 성별, 운동능력과 무관하게 누구나 주짓수를 배울 수 있도록 가르치는 그레이시 가문의 공식 주짓수 넷워크.<br/></p>
	    <div class="mainVideo" id="mainVideo" style="text-align: center;">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/Vdur90aQiso" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		<br/>
	    <p class="w3-justify">3대에 걸친 그레이시 가문의 목표는 주짓수를 배우고자 하는 전 세계의 모든 사람들이 그레이시만의 소중한 가치를 접할 수 있게 하는 것 입니다.<br/>
	    주짓수 창시자인 그랜드마스터 엘리오 그레이시 (1919-2009)의 손자들인 히론과 헤너 그레이시가 운영하는 미국 그레이시 유니버시티 본사의 한국 지부입니다.</p>
	    <div class="w3-row w3-padding-32">
	      <div class="w3-third">
	        <p>GRACIE COMBATIVES®</p>
	        <img src="${ctp}/images/gracie_m01.jpeg" class="w3-round w3-margin-bottom" alt="GRACIE COMBATIVES" style="width:95%">
	      </div>
	      <div class="w3-third">
	        <p>GRACIE BULLYPROOF®</p>
	        <img src="${ctp}/images/gracie_m03.jpeg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:95%">
	      </div>
	     <div class="w3-third">
	        <p>MASTER CYCLE®</p>
	        <img src="${ctp}/images/gracie_m04.jpeg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:95%">
	      </div>
	    </div>
	  </div>
	
	  <!-- The Tour Section -->
	  <div class="w3-black" id="tour">
	    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
	      <h2 class="w3-wide w3-center">프로그램</h2>
	      <p class="w3-opacity w3-center"><i>전국 어디서나 10일 무료 체험을 통해 그레이시의 특화되고 차별화된 과정들을 배워보세요.</i></p><br>
	
	      <ul class="w3-ul w3-border w3-white w3-text-grey">
	        <li class="w3-padding">어린이 학교폭력예방 과정 <span class="w3-tag w3-red w3-margin-left">HOT!!</span><span class="w3-badge w3-right w3-margin-right">10</span></li>
	        <li class="w3-padding">성인 기초 과정 <span class="w3-tag w3-red w3-margin-left"></span><span class="w3-badge w3-right w3-margin-right">7</span></li>
	        <li class="w3-padding">성인 고급 과정 <span class="w3-tag w3-red w3-margin-left"></span><span class="w3-badge w3-right w3-margin-right">4</span></li>
	        <li class="w3-padding">개인 지도 <span class="w3-tag w3-red w3-margin-left"></span></li>
	      </ul>
	
	      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
	        <div class="w3-third w3-margin-bottom">
	          <img src="${ctp}/images/program01.jpeg" alt="New York" style="width:100%" class="w3-hover-opacity">
	          <div class="w3-container w3-white">
	            <p><b>어린이 학교폭력예방 과정</b></p>
	            <p>안전하고 재미있게 학교폭력 상황에서 가장 필요한 자기방어 기술들을 배울 수 있는 어린이 과정.</p>
	            <button class="w3-button w3-black w3-margin-bottom" onclick="location.href='${ctp}/program/gracieBullyproof';">더배우기</button>
	          </div>
	        </div>
	        <div class="w3-third w3-margin-bottom">
	          <img src="${ctp}/images/program03.jpeg" alt="Paris" style="width:100%" class="w3-hover-opacity">
	          <div class="w3-container w3-white">
	            <p><b>성인 기초 과정</b></p>
	            <p>실전 싸움에서 가장 효과적이고 흔히 사용되는 36가지 주짓수 기술들을 배울 수 있는 성인 기초 과정.</p>
	            <button class="w3-button w3-black w3-margin-bottom" onclick="location.href='${ctp}/program/gracieCombatives';">더배우기</button>
	          </div>
	        </div>
	        <div class="w3-third w3-margin-bottom">
	          <img src="${ctp}/images/program04.jpeg" alt="San Francisco" style="width:100%" class="w3-hover-opacity">
	          <div class="w3-container w3-white">
	            <p><b>성인 고급 과정</b></p>
	            <p>기초 과정을 졸업한 분들을 위한 과정이며 수백 가지의 고급 기술들로 구성되어 있는 성인 고급 과정..</p>
	            <button class="w3-button w3-black w3-margin-bottom" onclick="location.href='${ctp}/program/masterCycle';">더배우기</button>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- Ticket Modal -->
	  <div id="ticketModal" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4">
	      <header class="w3-container w3-teal w3-center w3-padding-32"> 
	        <span onclick="document.getElementById('ticketModal').style.display='none'" 
	       class="w3-button w3-teal w3-xlarge w3-display-topright">×</span>
	        <h2 class="w3-wide"><i class="fa fa-suitcase w3-margin-right"></i>Tickets</h2>
	      </header>
	      <div class="w3-container">
	        <p><label><i class="fa fa-shopping-cart"></i> Tickets, $15 per person</label></p>
	        <input class="w3-input w3-border" type="text" placeholder="How many?">
	        <p><label><i class="fa fa-user"></i> Send To</label></p>
	        <input class="w3-input w3-border" type="text" placeholder="Enter email">
	        <button class="w3-button w3-block w3-teal w3-padding-16 w3-section w3-right">PAY <i class="fa fa-check"></i></button>
	        <button class="w3-button w3-red w3-section" onclick="document.getElementById('ticketModal').style.display='none'">Close <i class="fa fa-remove"></i></button>
	        <p class="w3-right">Need <a href="#" class="w3-text-blue">help?</a></p>
	      </div>
	    </div>
	  </div>
	
	  <!-- The Contact Section -->
	  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
	    <h2 class="w3-wide w3-center">CONTACT</h2>
	    <p class="w3-opacity w3-center"><i>연락주세요!</i></p>
	    <div class="w3-row w3-padding-32">
	      <div class="w3-col m6 w3-large w3-margin-bottom">
	        <i class="fa fa-map-marker" style="width:30px"></i> 충북 청주시 서원구 모충로 108 2층<br>
	        <i class="fa fa-phone" style="width:30px"></i> Phone: 0507-1308-8887<br>
	        <i class="fa fa-envelope" style="width:30px"> </i> Email: info@graciemochung.com<br>
	      </div>
	      <div class="w3-col m6">
	        <form action="#" target="_blank">
	          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
	            <div class="w3-half">
	              <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
	            </div>
	            <div class="w3-half">
	              <input class="w3-input w3-border" type="text" placeholder="Email" required name="Email">
	            </div>
	          </div>
	          <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message">
	          <button class="w3-button w3-black w3-section w3-right" type="submit">SEND</button>
	        </form>
	      </div>
	    </div>
	  </div>
	  
	  <!-- map -->
	  <div class="map" id="map">
	  	<h2 class="w3-wide w3-center">위치</h2>
	  	  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3201.924436020374!2d127.47286501536504!3d36.628205479984395!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3565262eeb14bf89%3A0xc7b6106bfadd8856!2z7Lap7LKt67aB64-EIOyyreyjvOyLnCDtnaXrjZXqtawg66qo7Lap66GcIDEwOA!5e0!3m2!1sko!2skr!4v1641782724116!5m2!1sko!2skr"></iframe>
	  </div>
	  
<!-- End Page Content -->
</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
