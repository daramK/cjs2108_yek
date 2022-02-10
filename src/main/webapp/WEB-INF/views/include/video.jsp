<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>
.container {
	position: relative;
	}
.text {
	position: absolute; top: 70%; width: 100%;
	}
.text p {
	margin-top: -24px;
	text-align: center;
	font-family: proxima-nova;
	font-size: 4em;
	font-weight: bold;
	color: #ffffff;
	}
</style>

<div class="container">
  <video style="width:100%; height:auto;" muted autoplay loop>
  	<source src="${ctp}/images/Gracie_Homepage.mp4" type="video/mp4">
  </video>
  <div class="text">
  <p>“지지 않으면 결국 이기게 될 것이다.”</p>
  </div>
</div>

<script>
// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('ticketModal');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>