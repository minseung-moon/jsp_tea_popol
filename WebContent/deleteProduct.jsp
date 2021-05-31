<%@page import="teaProduct.teaProductDAO"%>
<%
	teaProductDAO dao = new teaProductDAO();
	String idx = request.getParameter("idx");
	if(dao.deleteProduct(idx)){
		response.sendRedirect("product.jsp");
	}else{
		response.sendRedirect("productInfo.jsp?idx="+idx);
	}
	
%>