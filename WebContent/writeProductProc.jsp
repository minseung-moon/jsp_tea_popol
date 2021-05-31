<%@page import="teaProduct.teaProductDAO"%>
<%@page import="teaProduct.teaProductDTO"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@page import="tea.teaCommunity.CommunityDAO"%>
<%@page import="tea.teaCommunity.CommunityDTO"%>
<%
	request.setCharacterEncoding("UTF-8");

	String filePath = "C:\\Users\\YJ\\git\\TeaProject_JSP\\tea\\WebContent\\media\\product";
	int size = 5*1024*1024;
	String charSet = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, filePath, size, charSet, new DefaultFileRenamePolicy());
	
	String name = multi.getParameter("name");
	String price = multi.getParameter("price");
	String category = multi.getParameter("category");
	String stock = multi.getParameter("stock");
	String description = multi.getParameter("description");
	
	Enumeration files = multi.getFileNames();
	String filename = (String)files.nextElement();
	String saveFilename = multi.getFilesystemName(filename);
	String originalFilename = multi.getOriginalFileName(filename);
	
	teaProductDTO dto = new teaProductDTO();
	dto.setName(name);
	dto.setPrice(price);
	dto.setCategory(category);
	dto.setStock(stock);
	dto.setDescription(description);
	dto.setSaveFilename(saveFilename);
	dto.setOriginalFilename(originalFilename);
	
	teaProductDAO dao = new teaProductDAO();
	
	if(dao.insertProduct(dto)) response.sendRedirect("product.jsp");
	else response.sendRedirect(request.getHeader("referer"));
%>