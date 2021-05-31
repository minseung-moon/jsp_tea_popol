<%@page import="tea.teaUser.UserDTO"%>
<%@page import="teaProduct.teaProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teaProduct.teaProductDAO"%>
<%@page import="teaProduct.teaProductCategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community</title>
<link rel="stylesheet" href="./css/product.css">
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	<div id="main">
		<div class="inner">
			<form action="product.jsp" method="get" class="search">
				<input type="text" name="search" placeholder="검색값을 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			
			<ul class="category-group">
				<%
					teaProductDAO dao = new teaProductDAO();
					ArrayList<teaProductCategoryDTO> categories = dao.selectCategory();
					for(teaProductCategoryDTO dto : categories) {
				%>
				<li><a href="product.jsp?category=<%=dto.getIdx()%>"><%=dto.getCategory() %></a></li>
				<%
					}
				%>
			</ul>
			
			<div class="product-group">
				<%
					request.setCharacterEncoding("UTF-8");
					String search = request.getParameter("search");
					String category = request.getParameter("category");
					ArrayList<teaProductDTO> products = null;
					if(search != null) products = dao.selectSearchProduct(search);
					else if (category != null)  products = dao.selectCategoryProduct(category);
					else  products = dao.selectAllProduct();
					for(teaProductDTO dto : products) {
				%>
				<div class="product-card">
					<a href="productInfo.jsp?idx=<%=dto.getIdx() %>">
						<img alt="<%=dto.getOriginalFilename() %>" src="./media/product/<%=dto.getSaveFilename()%>">
						<span><%=dto.getName() %></span>
						<span><%=dto.getPrice() %>원</span>
					</a>
				</div>
				<%
					}
				%>
			</div>
			
			<%
				UserDTO user = (UserDTO)session.getAttribute("user");
				if(user != null && user.getUserGrade().equals("r")){
			%>
			<div class="btn-group">
				<button type="button" class="btn" onclick="javascript:location.href='writeProduct.jsp'">글쓰기</button>
			</div>
			<%
				}
			%>

		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>