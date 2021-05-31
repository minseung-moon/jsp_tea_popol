<%@page import="tea.teaUser.UserDTO"%>
<%@page import="tea.teaUser.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UpdateUser</title>
<script type="text/javascript" src="./js/updateUser.js" defer="defer"></script>
<link rel="stylesheet" href="./css/myPage.css">
</head>
<%
	UserDTO user = (UserDTO) session.getAttribute("user");
%>
<body>
	<jsp:include page="./header.jsp" />
	<div id="main">
		<div class="container">
			<form action="updateUserProc.jsp" method="post">
				<input type="hidden" name="userId" value="<%=user.getUserId()%>">
				<input type="hidden" name="userGrade"
					value="<%=user.getUserGrade()%>"> <input type="hidden"
					name="userState" value="<%=user.getUserState()%>">
				<table>
					<tr>
						<th><label for="userName">성함 : </label></th>
						<td><input type="text" name="usreName" id="userName"
							value="<%=user.getUserName()%>" maxlength="10"></td>
					</tr>
					<tr>
						<th><label for="userPw">비밀번호 : </label></th>
						<td><input type="text" name="userPw" id="userPw"
							value="<%=user.getUserPw()%>" maxlength="15"></td>
					</tr>
					<tr>
						<th><label for="userPhone">휴대전화 : </label></th>
						<td><input type="text" name="userPhone" id="userPhone"
							value="<%=user.getUserPhone()%>" maxlength="13"></td>
					</tr>
					<tr>
						<th><label for="userAddr">주소 : </label></th>
						<td><input type="text" name="userAddr" id="userAddr"
							value="<%=user.getUserAddr()%>" maxlength="50"></td>
					</tr>
					<tr>
						<td colspan="2" class="btn-group">
							<button type="submit" class="btn btn-flip" id="update">수정하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<jsp:include page="./footer.jsp" />
</body>
</html>