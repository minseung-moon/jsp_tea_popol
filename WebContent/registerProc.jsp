<%@page import="tea.teaUser.UserDAO"%>
<%@page import="tea.teaUser.UserDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userName = request.getParameter("userName");
	String userPhone = request.getParameter("userPhone1") + "-"
			+ request.getParameter("userPhone2") + "-"
			+ request.getParameter("userPhone3");
	String userAddr = request.getParameter("userAddr");

	UserDTO userDTO = new UserDTO(userId, userPw, userName, userPhone,
			userAddr);

	UserDAO userDAO = new UserDAO();
	Cookie cookie = null;
	if(userDAO.registerUser(userDTO)){
		cookie = new Cookie("registerResult","1");
	}else{
		cookie = new Cookie("registerResult","0");
	}
	response.addCookie(cookie);
	response.sendRedirect("login.jsp");
%>