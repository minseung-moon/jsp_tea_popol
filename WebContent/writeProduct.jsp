<%@page import="teaProduct.teaProductCategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teaProduct.teaProductDAO"%>
<%@page import="tea.teaUser.UserDTO"%>
<%
	UserDTO user = (UserDTO)session.getAttribute("user");
	String userId = "";
	if(user == null) response.sendRedirect("login.jsp");
	else userId = user.getUserId();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Tea</title>
<link rel="stylesheet" href="./css/community.css">
<script type="text/javascript" src="./js/writeProduct.js" defer="defer"></script>
<style>
 #main table.write select {
	width: 100%;
	font-size: 1.2rem;
}
</style>
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	<div id="main">
		<div class="inner">
		<form action="writeProductProc.jsp" method="post" enctype="multipart/form-data">
				<table class="write">
					<tr>
						<th> <label for="name">이름</label> </th>
						<td>
							<input type="text" name="name" id="name" placeholder="제품명을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th> <label for="price">가격</label> </th>
						<td>
							<input type="text" name="price" id="price" placeholder="가격을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th> <label for="category">카테고리</label> </th>
						<td>
							<select name="category" id="category">
								<option>카테고리</option>
								<%
									teaProductDAO dao = new teaProductDAO();
									ArrayList<teaProductCategoryDTO> dtos = dao.selectCategory();
									for(teaProductCategoryDTO dto : dtos) {
								%>
								<option value="<%=dto.getIdx()%>"><%=dto.getCategory() %></option>	
								<%
									}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<th> <label for="stock">재고수</label> </th>
						<td>
							<input type="text" name="stock" id="stock" placeholder="재고 수를 입력해주세요">
						</td>
					</tr>
					<tr>
						<th> <label for="description">설명</label> </th>
						<td>
							<textarea rows="10" cols="30" name="description" id="description" placeholder="설명을 입력하세요."></textarea>
						</td>
					</tr>
					<tr>
						<th> <label for="filename">제품이미지</label> </th>
						<td>
							<input type="file" name="filename" id="filename">
						</td>
					</tr>
					<tr class="btn-group">
						<td colspan="2">
							<button type="submit" id="submit" class="btn" onclick="return checkUpload()">업로드</button>
							<button type="button" class="btn" onclick="javscript:history.back()">뒤로가기</button>
						<td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>