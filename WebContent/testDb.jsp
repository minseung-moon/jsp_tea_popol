<%@page import="tea.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = DBConn.getConnection();
	
	String idx = "error";
	try {
		String sql = "select idx, userId, title, content,  date_format(regdate, '%Y년%m월%d일') as regdate, count from teaCommunity where idx = 1 order by idx desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		idx = rs.getString("idx");
			
	}catch(Exception e){
		System.out.println("select community error");
	}
	
%>
<%=idx %>
a
</body>
</html>