<%@page import="tableProduct.TableProductDTO"%>
<%@page import="tableProduct.TableProductDAO"%>
<%@page import="tea.teaUser.UserDTO"%>
<%@page import="tea.teaUser.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product</title>
<link rel="stylesheet" href="./css/productInfo.css">

</head>
<body>
	<jsp:include page="./header.jsp" />
	<%
		String idx = request.getParameter("idx");
		TableProductDAO dao = new TableProductDAO();
		TableProductDTO dto = dao.selectTableProduct(idx);
		UserDTO user = (UserDTO) session.getAttribute("user"); 
	%>
	<div id="main">
		<div class="inner">
			<table class="product">
				<tr>
					<td rowspan="5" class="img-space">
						<img alt="<%=dto.getOriginalFilename() %>" src="./media/tableProduct/<%=dto.getSaveFilename()%>">
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
						<form action="orderTableProc.jsp" method="post">
							<input type="hidden" name="idx" id="idx" value="<%=dto.getIdx()%>">
							<input type="hidden" name="userId" id="userId" value="<%=user!=null?user.getUserId():""%>">
							<input type="text" name="amount" id="amount" placeholder="주문 수량을 입력해주세요!">
							<input type="submit" id="submit" onclick="return check()" value="주문하기" class="btn">
						</form>
					</td>
				</tr>
				<%
					if(user!=null && user.getUserGrade().equals("r")){
				%>
				<tr>
					<td colspan="3" class="btn-group">
						<a href="updateTableProduct.jsp?idx=<%=dto.getIdx()%>" class="btn btn-flip">수정하기</a>
						<a href="deleteTableProduct.jsp?idx=<%=dto.getIdx()%>" class="btn  btn-flip" onclick="return confirm('정말 삭제하시겠습니까?')?true:false">삭제하기</a>	
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
	
	<script type="text/javascript">
	
	function check() {
			let check = false;
			const amount = document.getElementById("amount");
			const stock = document.getElementById("stock");
			const userId = document.getElementById("userId");
			
			if(userId.value === "") {
				location.href ="login.jsp";
				
			}else if(isNaN(amount.value) || amount.value > stock.textContent*1 || amount.value < 1) {
				alert('주문 수량을 입력해주세요.');
				order.focus();
			}else check = true;

			return check;
		}
	</script>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>