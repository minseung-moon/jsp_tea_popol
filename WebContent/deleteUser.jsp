<%@page import="tea.teaUser.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	UserDAO dao = new UserDAO();
	
	if(dao.deleteUser(userId)){
		session.invalidate();
		response.sendRedirect("index.jsp");
	}else {
		response.sendRedirect("myPage.jsp?userId="+userId);
	}
		
%>