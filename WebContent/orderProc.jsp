<%@page import="teaProduct.teaProductDAO"%>
<%@page import="teaProduct.teaOrderDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String idx = request.getParameter("idx");
	String userId = request.getParameter("userId");
	String amount = request.getParameter("amount");
	
	teaOrderDTO dto = new teaOrderDTO();
	dto.setIdx(idx);
	dto.setUserId(userId);
	dto.setAmount(amount);
	
	teaProductDAO dao = new teaProductDAO();
	if(dao.insertOrder(dto)) response.sendRedirect("product.jsp");
	else response.sendRedirect(request.getHeader("referer"));
%>