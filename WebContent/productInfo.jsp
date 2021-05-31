<%@page import="tea.teaUser.UserDTO"%>
<%@page import="tea.teaUser.UserDAO"%>
<%@page import="teaProduct.teaProductDTO"%>
<%@page import="teaProduct.teaProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product</title>
<link rel="stylesheet" href="./css/productInfo.css">
<script type="text/javascript" src="./js/orderValidate.js" defer="defer"></script>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<%
		String idx = request.getParameter("idx");
		teaProductDAO dao = new teaProductDAO();
		teaProductDTO dto = dao.selectProduct(idx);
		UserDTO user = (UserDTO) session.getAttribute("user"); 
	%>
	<div id="main">
		<div class="inner">
			<table class="product">
				<tr>
					<td rowspan="5" class="img-space">
						<img alt="<%=dto.getOriginalFilename() %>" src="./media/product/<%=dto.getSaveFilename()%>">
					</td>
					<th> 제품명 </th>
					<td><%=dto.getName() %></td>
				</tr>
				<tr>
					
					<th> 가격 </th>
					<td><%=dto.getPrice() %>원</td>
				</tr>
				<tr>
					
					<th> 카테고리 </th>
					<td><%=dto.getCategory() %></td>
				</tr>
				<tr>
					
					<th> 재고 수 </th>
					<td id="stock"><%=dto.getStock() %></td>
				</tr>
				<tr class="order-form">
					<td colspan="2">
						<form action="orderProc.jsp" method="post">
							<input type="hidden" name="idx" id="idx" value="<%=dto.getIdx()%>">
							<input type="hidden" name="userId" id="userId" value="<%=user!=null?user.getUserId():""%>">
							<input type="text" name="amount" id="amount" placeholder="주문 수량을 입력해주세요!">
							<input type="submit" id="submit" value="주문하기" class="btn">
						</form>
					</td>
				</tr>
				<%
					if(user!=null && user.getUserGrade().equals("r")){
				%>
				<tr>
					<td colspan="3" class="btn-group">
						<a href="updateProduct.jsp?idx=<%=dto.getIdx()%>" class="btn btn-flip">수정하기</a>
						<a href="deleteProduct.jsp?idx=<%=dto.getIdx()%>" class="btn  btn-flip" onclick="return confirm('정말 삭제하시겠습니까?')?true:false">삭제하기</a>	
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="3">
						<%=dto.getDescription() %>	
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>