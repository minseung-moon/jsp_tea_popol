<%@page import="tableProduct.TableProductDAO"%>
<%@page import="tableProduct.TableProductDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String idx = request.getParameter("idx");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String category = request.getParameter("category");
	String stock = request.getParameter("stock");
	String description = request.getParameter("description");
	
	TableProductDTO dto = new TableProductDTO();
	dto.setName(name);
	dto.setPrice(price);
	dto.setCategory(category);
	dto.setStock(stock);
	dto.setDescription(description);
	dto.setIdx(idx);
	
	TableProductDAO dao = new TableProductDAO();
	
	if(dao.updateTableProduct(dto)) response.sendRedirect("tableProductInfo.jsp?idx="+dto.getIdx());
	else response.sendRedirect(request.getHeader("referer"));
%>