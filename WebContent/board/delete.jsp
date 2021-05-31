<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="EUC-KR">
<title>게시판을 지워보자용 </title>


</head>

<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");

try{
    String driverName = "oracle.jdbc.driver.OracleDriver"; 
    
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "board", "1234");
	out.println("Oracle DataBase Connection Success.");
	
	String sql = "DELETE from board where idx = " + idx;
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.executeUpdate();
	
	con.close();
%>
	<script>
		alert("삭제되었습니다.");
		location.href="redirect.jsp";
	</script>

<%
}catch(Exception e){
	// out.println("Oracle Database Connection Problem <hr>");
%>
		<script>
		alert("삭제가 안되었어요.");
		location.href("redirect.jsp");
		</script>
<% 
	out.println(e.getMessage());
	e.printStackTrace();
}
%>



</body>
</html>