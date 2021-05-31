<%@page import="tea.teaUser.UserDTO"%>
<%@page import="tea.teaUser.UserDAO"%>
<%@page import="tableProduct.TableProductDTO"%>
<%@page import="tableProduct.TableProductCategoryDTO"%>
<%@page import="tableProduct.TableProductDAO"%>
<%@page import="java.util.ArrayList"%>
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
			<form action="tableProduct.jsp" method="get" class="search">
				<input type="text" name="search" placeholder="검색값을 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			
			<ul class="category-group">
				<%
					TableProductDAO dao = new TableProductDAO();
					ArrayList<TableProductCategoryDTO> categories = dao.selectTableCategory();
					for(TableProductCategoryDTO dto : categories) {
				%>
				<li><a href="tableProduct.jsp?category=<%=dto.getIdx()%>"><%=dto.getCategory() %></a></li>
				<%
					}
				%>
			</ul>
			
			<div class="product-group">
				<%
					request.setCharacterEncoding("UTF-8");
					String search = request.getParameter("search");
					String category = request.getParameter("category");
					ArrayList<TableProductDTO> products = null;
					if(search != null) products = dao.selectSearchTableProduct(search);
					else if (category != null)  products = dao.selectCategoryProduct(category);
					else  products = dao.selectAllTableProduct();
					for(TableProductDTO dto : products) {
				%>
				<div class="product-card">
					<a href="tableProductInfo.jsp?idx=<%=dto.getIdx() %>">
						<img alt="<%=dto.getOriginalFilename() %>" src="./media/tableProduct/<%=dto.getSaveFilename()%>">
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
				<a class="btn" href="writeTableProduct.jsp">글쓰기</a>
			</div>
			<%
				}
			%>
			
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>