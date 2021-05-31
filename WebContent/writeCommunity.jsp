<%@page import="tea.teaUser.UserDTO"%>
<%
	UserDTO user = (UserDTO)session.getAttribute("user");
	String userId = "";
	if(user == null) response.sendRedirect("login.jsp");
	else userId = user.getUserId();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Tea</title>
<link rel="stylesheet" href="./css/community.css">
<script type="text/javascript" src="./js/writeCommunity.js" defer="defer"></script>
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	<div id="main">
		<div class="inner">
		<form action="writeCommunityProc.jsp" method="post">
				<input type="hidden" name="userId" id="userId" value="<%=userId%>">
				<table class="write">
					<tr>
						<th> <label for="title">제목</label> </th>
						<td>
							<input type="text" name="title" id="title" placeholder="제목을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th> <label for="content">내용</label> </th>
						<td>
							<textarea rows="10" cols="30" name="content" id="content" placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
					<tr class="btn-group">
						<td colspan="2">
							<button type="submit" id="submit" class="btn" onclick="return checkUpload()">업로드</button>
							<button type="button" class="btn" onclick="javscript:history.back()">뒤로가기</button>
						<td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>