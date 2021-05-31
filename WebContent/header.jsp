<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tea.teaUser.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<link rel="stylesheet" href="./css/Common.css">
<link rel="shortcut icon" href="./logo&favicon/favicon-32x32.png" type="image/x-icon">
<script type="text/javascript" src="./js/Common.js" defer></script>
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
<%
	UserDTO user = (UserDTO)session.getAttribute("user");
%>
	<header>
		<div class="inner">
			<a href="index.jsp" class="logo"><img
				src="./media/logo&favicon/houseTea.png" alt="logo"></a>

			<div class="menu">
				<i class="fas fa-plus"></i>
				<ul class="sub-menu">
					<%
						if(user != null){
					%>
					<li><a href="myPage.jsp">My Page</a></li>
					<li><a href="logOutProc.jsp">Log Out</a></li>
					<%
							if(user.getUserGrade().equals("r")){
							%>
							<li><a href="writeProduct.jsp">Add Product</a></li>
							<%
							}
						}else{
					%>
					<li><a href="./login.jsp">LOGIN&amp;REGISTRE</a></li>
					<%		
						}
					%>
				</ul>
				<ul class="main-menu">
					<li><a href="aboutTea.jsp">About TEA</a></li>
					<li><a href="product.jsp">Tea Shop</a></li>
					<li><a href="tableProduct.jsp">For the Table</a></li>
					<li><a href="community.jsp">Community</a></li>
				</ul>
			</div>
			<i class="fas fa-bars"></i>
		</div>
	</header>
</body>
</html>