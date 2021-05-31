<%@page import="tea.teaCommunity.CommunityDAO"%>
<%@page import="tea.teaCommunity.CommunityDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String idx = request.getParameter("idx");
	
	System.out.println(7);
	
	CommunityDTO dto = new CommunityDTO();
	dto.setIdx(idx);
	System.out.println(idx);
	dto.setTitle(title);
	dto.setContent(content);
	
	System.out.println(8);
	
	CommunityDAO dao = new CommunityDAO();
	if(dao.updateCommunity(dto)) {
		System.out.println(9);
		response.sendRedirect("community.jsp");
	} else {
		System.out.println(10);
		response.sendRedirect(request.getHeader("referer"));
	}
	
%>