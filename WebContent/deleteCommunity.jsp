<%@page import="tea.teaCommunity.CommunityDAO"%>
<%
	CommunityDAO dao = new CommunityDAO();
	String idx = request.getParameter("idx");
	if(dao.deleteCommunity(idx)){
		response.sendRedirect("community.jsp");
	}else{
		response.sendRedirect("communityInfo.jsp?idx="+idx);
	}
	
%>