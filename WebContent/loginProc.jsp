<%@page import="tea.teaUser.UserDAO"%>
<%@page import="tea.teaUser.UserDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");

	UserDAO userDAO = new UserDAO();
	boolean result = userDAO.loginUser(userId, userPw) ? true : false;
	if(result){
		UserDTO user = userDAO.getUser(userId);
		if(user.getUserState().equals("1")){
			session.setAttribute("user", user);
		}else{
		}
	}else{
	}
	response.sendRedirect("index.jsp");
%>