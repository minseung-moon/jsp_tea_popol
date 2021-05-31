<%@page import="tea.teaUser.UserDTO"%>
<%@page import="tea.teaUser.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	UserDTO dto = new UserDTO();
	dto.setUserId(request.getParameter("userId"));
	System.out.println(request.getParameter("userId"));
	dto.setUserName(request.getParameter("usreName"));
	dto.setUserPw(request.getParameter("userPw"));
	dto.setUserPhone(request.getParameter("userPhone"));
	dto.setUserAddr(request.getParameter("userAddr"));
	dto.setUserGrade(request.getParameter("userGrade"));
	dto.setUserState(request.getParameter("userState"));
	UserDAO dao = new UserDAO();
	
	if(dao.updateUser(dto)){
		session.removeAttribute("user");
		session.setAttribute("user", dto);
		response.sendRedirect("myPage.jsp?userId="+dto.getUserId());
	}else {
		response.sendRedirect("myPage.jsp?userId="+dto.getUserId());
	}
		
%>