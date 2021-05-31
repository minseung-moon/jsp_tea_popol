<%@page import="tea.teaUser.UserDAO"%>
<%
		UserDAO userDAO = new UserDAO();
		String userId = request.getParameter("userId");
		if (userDAO.checkId(userId)){ // 데이터 존재
			// 사용하는 아이디
			out.print("0");
		}else{
			// 사용하지 않는 아이디
			out.print("1");
		}
%>