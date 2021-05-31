<%@page import="tea.teaUser.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>

<%@page import="tea.DBConn"%>

<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%

    // DB 연결
	//DBConn conn = new DBConn();
//Connection con = conn.conn; 

    

    // 아이디 받아오기
    UserDAO userDAO = new UserDAO();
    String userid = request.getParameter("userid");

    

    // 아이디 찾는 쿼리 생성

    //String sql = "select * from teaUser where userId= '" + userid + "'";
	// "select userId from teaUser where userId = ?"
    

    // 쿼리 실행
	//PreparedStatement pstmt = con.prepareStatement(sql);
    //Statement stmt = conn.createStatement();

   // ResultSet rs = pstmt.executeQuery();

    

    if(userDAO.checkId(userid)) {    // 데이터 존재
        // 사용하는 아이디

        out.print("0");
    }

    else {
        // 사용하지 않는 아이디

        out.print("1");



    }

%>