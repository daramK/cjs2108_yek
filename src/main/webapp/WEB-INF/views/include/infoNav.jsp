<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
div {
	font-family: proxima-nova;
}
h1 {
	font-family: proxima-nova;
	color: #1A1A1AE6;
	font-size: 32px;
}
h2 {
	font-family: proxima-nova;
	color: #4A4A4A;
	margin: 20px 0px 12.5px;
}
h5 {
	font-family: proxima-nova;
	color: #1A1A1AE6;
	margin: 16px 0px 8px;
}
p {
	color: #1A1A1AB3;
	margin: 18px 0px;
}
li {
	list-style: none;
}
li a {
	display: block;
	color: #1a1a1a66;
}
li a:hover {
	color: #1a1a1a;
}
.nav-label {
	font-size: 22px;
	color: #00746B;
}
#container{
	padding-left: 100px;
}
#folder-nav {
	position: fixed;
	padding-right: 65px;
}
</style>
<nav id="folder-nav">
	<ul>
		<li class="nav-label">About</li>
		<li class="info">
			<a class="info" href="${ctp}/info/info">우리 소개</a>
		</li>
		<li class="info">
			<a class="curriculum" href="${ctp}/info/curriculum">커리큘럼</a>
		</li>
		<li class="info">
			<a class="qna" href="${ctp}/info/qna">자주하는 질문</a>
		</li>
		<li class="info">
			<a class="history" href="${ctp}/info/history">역사</a>
		</li>
	</ul>
</nav>