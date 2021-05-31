<%@page import="tableProduct.TableProductDAO"%>
<%@page import="tableProduct.TableOrderDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String idx = request.getParameter("idx");
	String userId = request.getParameter("userId");
	String amount = request.getParameter("amount");
	
	TableOrderDTO dto = new TableOrderDTO();
	dto.setIdx(idx);
	dto.setUserId(userId);
	dto.setAmount(amount);
	
	TableProductDAO dao = new TableProductDAO();
	if(dao.insertTableOrder(dto)) response.sendRedirect("tableProduct.jsp");
	else response.sendRedirect(request.getHeader("referer"));
%>