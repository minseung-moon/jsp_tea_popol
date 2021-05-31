<%@page import="tableProduct.TableProductDAO"%>
<%@page import="teaProduct.teaProductDAO"%>
<%
	TableProductDAO dao = new TableProductDAO();
	String idx = request.getParameter("idx");
	if(dao.deleteTableProduct(idx)){
		response.sendRedirect("tableProduct.jsp");
	}else{
		response.sendRedirect("tableProductInfo.jsp?idx="+idx);
	}
	
%>