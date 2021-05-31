<%@page import="tea.teaCommunity.CommunityDAO"%>
<%@page import="tea.teaCommunity.CommunityDTO"%>
<%@page import="tea.teaUser.UserDTO"%>
<%
	UserDTO user = (UserDTO)session.getAttribute("user");
	String userId = "";
	if(user == null) response.sendRedirect("login.jsp");
	else userId = user.getUserId();
	
	String idx = request.getParameter("idx");
	CommunityDAO dao = new CommunityDAO();
	CommunityDTO dto = dao.selectCommunity(idx);
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
		<form action="updateCommunityProc.jsp" method="post">
				<input type="hidden" name="idx" value="<%=idx%>">
				<table class="write">
					<tr>
						<th> <label for="title">제목</label> </th>
						<td>
							<input type="text" name="title" id="title" placeholder="제목을 입력해주세요" value="<%=dto.getTitle()%>">
						</td>
					</tr>
					<tr>
						<th> <label for="content">내용</label> </th>
						<td>
							<textarea rows="10" cols="30" name="content" id="content" placeholder="내용을 입력하세요."><%=dto.getContent() %></textarea>
						</td>
					</tr>
					<tr class="btn-group">
						<td colspan="2">
							<button type="submit" id="submit" class="btn" onclick="return checkUpload()">수정</button>
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