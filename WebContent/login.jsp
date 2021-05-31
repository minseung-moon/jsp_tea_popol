<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./media/logo&favicon/favicon-32x32.png" type="image/x-icon">
<script type="text/javascript" src="./js/login.js" defer></script>
<title>Log In</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
<%
Cookie[] cookies = request.getCookies();
for(Cookie cookie : cookies) {
	if(cookie.getName().equals("registerResult")){
		if(cookie.getValue().equals("1")){
			%>
				<script type="text/javascript">
					alert("회원가입 성공 하셨습니다.");
				</script>
			<%
		}else {
			%>
			<script type="text/javascript">
				alert("회원가입 실패 입니다!");
			</script>
		<%
		}
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
}
%>
	<jsp:include page="./header.jsp" />
	
	<div id="main">
		<div class="inner">
			<div class="login">
				<h2>로그인</h2>
				<form action="loginProc.jsp" method="post">
					<p class="input-container">
						<input type="text" id="loginId" name="userId" required="required" maxlength="10">
						<label class="form-label" for="loginId">아이디</label>
					</p>
					<p class="input-container">
						<input type="password" id=loginPw name="userPw" required="required" maxlength="15">
						<label for="loginPw">비밀번호</label>
					</p>
					<p>
						<button type="submit" class="btn" id="login">로그인</button>
						<button type="button" id="toRegister" class="btn btn-flip">회원가입으로</button>
					</p>
				</form>
			</div>
			<div class="register">
				<h2>회원 가입</h2>
				<form action="registerProc.jsp" method="post" name="registerForm">
					<div class="input-container">
						<input type="text" id="userId" name="userId" required="required" maxlength="10">
						<label for="userId">아이디</label>
						<div id="ck"></div>
					</div>
					<div class="input-container">
						<input type="password" id="userPw" name="userPw" required="required" maxlength="15">
						<label for="userPw">비밀번호</label>
					</div>
					<div class="input-container">
						<input type=text id="userName" name="userName"required="required" maxlength="10">
						<label for="userName">성함</label>
					</div>
					<div class="phone-box">
						<select name="userPhone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
						</select>
						 - 
						 <p class="input-container">
						 	<input type="text" id="userPhone2" name="userPhone2" required="required" maxlength="4">
						 	<label for="userPhone2">중간번호</label>
						 </p>
						 - 
						 <p class="input-container">
						 	<input type="text" id="userPhone3" name="userPhone3" required="required" maxlength="4">
						 	<label for="userPhone3">마지막번호</label>
						 </p>
					</div>
					<div class="input-container">
						<input type="text" id="userAddr" name="userAddr" required="required" maxlength="50">
						<label for="userAddr">주소</label>
					</div>
					<div class="input-container">
						<button type="submit" class="btn" id="register">회원가입</button>
						<button type="button" id="toLogin" class="btn btn-flip"">로그인으로</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>