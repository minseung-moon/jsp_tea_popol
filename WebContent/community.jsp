<%@page import="tea.teaCommunity.CommunityDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tea.teaCommunity.CommunityDAO"%>
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
	
	<div id="main">
		<div class="inner">
			<form action="community.jsp" method="get" class="search">
				<input type="text" name="search" placeholder="검색값을 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<table class="community">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						request.setCharacterEncoding("UTF-8");
						String search = request.getParameter("search");
						CommunityDAO dao = new CommunityDAO();
						ArrayList<CommunityDTO> dtos = null;
						if(search != null)  dtos = dao.selectAllCommunity(search);
						else dtos = dao.selectAllCommunity();
						
						
						for(CommunityDTO dto : dtos){
					%>
						<tr>
							<td><%=dto.getIdx() %></td>
							<td><a href="communityInfo.jsp?idx=<%=dto.getIdx()%>"><%=dto.getTitle() %></a></td>
							<td><%=dto.getContent() %></td>
							<td><%=dto.getUserId() %></td>
							<td><%=dto.getRegdate() %></td>
							<td><%=dto.getCount() %></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="btn-group">
				<button type="button" class="btn" onclick="javascript:location.href='writeCommunity.jsp'">글쓰기</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>