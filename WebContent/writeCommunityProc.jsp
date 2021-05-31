<%@page import="tea.teaCommunity.CommunityDAO"%>
<%@page import="tea.teaCommunity.CommunityDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CommunityDTO dto = new CommunityDTO();
	dto.setUserId(userId);
	dto.setTitle(title);
	dto.setContent(content);
	
	CommunityDAO dao = new CommunityDAO();
	if(dao.insertCommunity(dto)) response.sendRedirect("community.jsp");
	else  response.sendRedirect(request.getHeader("referer"));
	
%>