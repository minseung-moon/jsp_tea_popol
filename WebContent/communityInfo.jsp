<%@page import="tea.teaUser.UserDTO"%>
<%@page import="tea.teaCommunity.CommunityDAO"%>
<%@page import="tea.teaCommunity.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community</title>
<link rel="stylesheet" href="./css/community.css">
</head>
<body>
	<jsp:include page="./header.jsp" />
	<%
		CommunityDAO dao = new CommunityDAO();
		String idx = request.getParameter("idx");
		dao.updateCount(idx);
		CommunityDTO dto = dao.selectCommunity(idx);
	%>
	<div id="main">
		<div class="inner">
			<table class="write">
				<tr>
					<th> 제목 </th>
					<td>
						<%=dto.getTitle() %>
					</td>
				</tr>
				<tr>
					<th> 작성자 </th>
					<td>
						<%=dto.getUserId() %>
					</td>
				</tr>
				<tr>
					<th> 조회수 </th>
					<td>
						<%=dto.getCount() %>
					</td>
				</tr>
				<tr>
					<th> 작성일 </th>
					<td>
						<%=dto.getRegdate() %>
					</td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td>
						<%=dto.getContent() %>
					</td>
				</tr>
				<tr class="btn-group">
					<td colspan="2">
					<form>
					<input type="hidden" value="<%=dto.getUserId()%>">
					</form>
						<%
							UserDTO user = (UserDTO)session.getAttribute("user");
							if(user != null && user.getUserId().equals(dto.getUserId())){
						%>
							<button type="button" class="btn" onclick="confirm('정말 삭제하시겠습니까?')?location.href='deleteCommunity.jsp?idx=<%=dto.getIdx()%>':alert('취소하셨습니다')">삭제하기</button>
							<button type="button" class="btn" onclick="location.href='updateCommunity.jsp?idx=<%=dto.getIdx()%>'">수정하기</button>
						<%
							}
						%>
						
						<button type="button" class="btn" onclick="javascript:location.href='community.jsp'">뒤로가기</button>
					<td>
				</tr>
			</table>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>