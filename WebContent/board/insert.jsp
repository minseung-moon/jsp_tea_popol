<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");

	int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	String content = request.getParameter("content");
	int count = 9999;
	
	if(title == "" || title == null) out.println("title이 null 입니다");
	if(writer == "" || writer == null) out.println("writer가 null 입니다");
	else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer)) out.println("이메일 형식이 아닙니다");
	
	if(regdate == "" || regdate == null) out.println("regdate가 null 입니다");
	else if(!Pattern.matches("^[0-9]*$", regdate)) out.println("숫자 형식이 아닙니다");
	
	if(content == "" || content == null) out.println("content가 null 입니다");
	
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "board", "1234");
		out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
		String sql = "insert into board(idx, title, writer, regdate, count, content) values(board_seq.nextval,?,?,?,1,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, regdate);
		pstmt.setString(4, content);
		pstmt.executeUpdate();
		con.close();
	}catch(Exception e){
		out.println("Oracle 데이터베이스 db 접속 실패<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}finally{
		out.print("<script>location.href='list.do';</script>");
	}
%>
</head>
<body>

</body>
</html>