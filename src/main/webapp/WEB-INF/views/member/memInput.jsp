<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String sToday = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memInput.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<!-- 아래는 다음 주소 API를 활용한 우편번호검색 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath()%>/js/woo.js"></script>
	<script>
		var idCheckOn = 0;
		var nickCheckOn = 0;
		
		// 아이디 중복체크
		function idCheck() {
			var mid = $("#mid").val();
			if(mid=="" || $("#mid").val().length<4 || $("#mid").val().length>20) {
				alert("아이디를 체크하세요!(아이디는 4~20자 이내로 사용하세요.)");
				myform.mid.focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url  : "${ctp}/member/idCheck",
				data : {mid : mid},
				success:function(data) {
					if(data == "1") {
						alert("이미 사용중인 아이디입니다.");
						$("#mid").focus();
					}
					else{
						alert("사용 가능한 아이디입니다.");
						idCheckOn = 1;
					}
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
		
		// 닉네임 중복체크
		function nickCheck() {
			var nickname = $("#nickname").val();
			if(nickname=="" || $("#nickname").val().length<2 || $("#nickname").val().length>20) {
				alert("닉네임을 체크하세요!(닉네임은 2~20자 이내로 사용하세요.)");
				myform.nickname.focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url  : "${ctp}/member/nicknameCheck",
				data : {nickname : nickname},
				success:function(data) {
					if(data == "1") {
						alert("이미 사용중인 닉네임 입니다.");
						$("#nickname").focus();
					}
					else {
						alert("사용 가능한 닉네임 입니다.");
						nickCheckOn = 1;
					}
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
		
		function idReset() {
			idCheckOn = 0;
		}
		
		function nickReset() {
			nickCheckOn = 0;
		}
	
		// 회원가입폼
		function fCheck() {
			var regExpMid = /^[a-z]+[a-z0-9]{4,20}$/g;
			var regExpPwd = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,15}$/;
			var regExpName = /[ㄱ-힣]/;
			var regExpNickname = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]*$/;
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var regExpTel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
			
			var mid = myform.mid.value;
			var pwd = myform.pwd.value;
			var name = myform.name.value;
			var nickname = myform.nickname.value;
			var email = myform.email1.value + "@" + myform.email2.value;
			var tel = myform.tel1.value + "-" + myform.tel2.value + "-" + myform.tel3.value;
			
			if(!regExpMid.test(mid)) {
				alert("아이디는 영문자로 시작하는 영문자 또는 숫자 4~20자만 가능합니다.");
				myform.mid.focus();
			}
			else if(!regExpPwd.test(pwd)) {
				alert("비밀번호는 8~15자의 영문,숫자를 조합해야합니다.");
				myform.pwd.focus();
			}
			else if(!regExpName.test(name)) {
				alert("이름은 한글만 가능합니다.");
				myform.name.focus();
			}
			else if(!regExpNickname.test(nickname)) {
				alert("닉네임을 한글과 영문자만 가능합니다.");
				myform.nickname.focus();
			}
			else if(!regExpTel.test(tel)) {
				alert("전화번호는 숫자만 가능합니다.");
				myform.tel1.focus();
			}
			else if(!regExpEmail.test(email)) {
				alert("이메일을 확인하세요.");
				myform.email1.focus();
			}
			else {
				if(idCheckOn == 1 && nickCheckOn == 1) {
					var postcode = myform.postcode.value;
	    			var roadAddress = myform.roadAddress.value;
	    			var detailAddress = myform.detailAddress.value;
	    			var extraAddress = myform.extraAddress.value;
	    			var address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress
	    			if(address == "///") address = "";
	    			myform.address.value = address;
	    			myform.email.value = email;
	    			myform.tel.value = tel;
					
	    			myform.submit();
				}
				else {
					if(idCheckOn == 0) {
						alert("아이디 중복체크를 해주세요!");
					}
					else {
						alert("닉네임 중복체크를 해주세요!");
					}
				}
			}
		}
	</script>
	<style>
	label {
		font-weight: bold;
	}
	.input-group-text {
		font-weight: bold;
	}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/video2.jsp"/>
<div class="container" style="padding: 30px">
	<form name="myform" method="post" class="was-validated">
		<h2>회원가입</h2>
		<br/>
		<div class="form-group">
			<label for="mid">아이디 &nbsp; &nbsp;<input type="button" value="아이디 중복체크" class="btn btn-secondary" onclick="idCheck()"/></label>
			<input type="text" class="form-control" id="mid" onkeyup="idReset()" placeholder="아이디" name="mid" required autofocus/>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호 &nbsp; &nbsp;</label>
			<input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd" maxlength="15" required/>
		</div>
		<div class="form-group">
			<label for="name">성명 &nbsp; &nbsp;</label>
			<input type="text" class="form-control" id="name" placeholder="성명" name="name" required/>
		</div>
		<div class="form-group">
			<label for="nickname">닉네임 &nbsp; &nbsp;<input type="button" value="닉네임 중복체크" class="btn btn-secondary" onclick="nickCheck()"/></label>
			<input type="text" class="form-control" id="nickname" onkeyup="nickReset()" placeholder="닉네임" name="nickname" required/>
		</div>
		<div class="form-group">
			<div class="form-check-inline">
				<span class="input-group-text">성별</span> &nbsp; &nbsp;
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="gender" value="남자" checked>남자
				</label>
			</div>
			<div class="form-check-inline">
				<label>
					<input type="radio" class="form-check-input" name="gender" value="여자">여자
				</label>
			</div>
		</div>
		<div class="form-group">
			<label for="birthday">생일</label>
			<input type="date" name="birthday" value="<%=sToday%>" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="이메일" id="email1" name="email1" required/>
				<div class="input-group-append">
					<select name="email2" class="custom-select">
						<option value="naver.com" selected>naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="kakao.com">kakao.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="icloud.com">icloud.com</option>
					</select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">전화번호</span>&nbsp; &nbsp; 
					<select name="tel1" class="custom-select">
						<option value="010" selected>010</option>
						<option value="02">서울</option>
						<option value="031">경기</option>
						<option value="032">인천</option>
						<option value="041">충남</option>
						<option value="042">대전</option>
						<option value="043">충북</option>
						<option value="051">부산</option>
						<option value="052">울산</option>
						<option value="061">전북</option>
						<option value="062">광주</option>
					</select>-
				</div>
				<input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
				<input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="address">주소</label><br/>
			<input type="hidden" class="form-control" name="address"/>
			<input type="text" name="postcode" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="roadAddress" id="sample4_roadAddress" size="50" placeholder="도로명주소">
			<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" name="detailAddress" id="sample4_detailAddress" size="30" placeholder="상세주소">
			<input type="text" name="extraAddress" id="sample4_extraAddress" placeholder="참고항목">
		</div>
		<div class="form-group">
			<div class="form-check-inline">
				<span class="input-group-text">정보공개</span>&nbsp; &nbsp; 
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="userInfo" value="공개" checked/>공개
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="userInfo" value="비공개"/>비공개
				</label>
			</div>
		</div>
		<button type="button" class="btn btn-success" onclick="fCheck()">회원가입</button>
		<button type="reset" class="btn btn-secondary">다시작성</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/member/memLogin';">돌아가기</button>
		<input type="hidden" name="email"/>
		<input type="hidden" name="tel"/>
	</form>
	<p><br/></p>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>