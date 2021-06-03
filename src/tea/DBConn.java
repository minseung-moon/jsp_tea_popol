package tea;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConn {
	public static Connection getConnection() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");
			Connection conn = ds.getConnection();
			System.out.println("DB연결 성공");
			return conn;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}



//public static Connection getConnection() {
//String dbURL = "jdbc:mysql://127.0.0.1:3306/tea";
//String id = "root";
//String password = "1234";
//Connection conn = null;
//try {
//	Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC
//	System.out.println("DB 연결중 ...");
//	conn = DriverManager.getConnection(dbURL,id,password); // DB 연결
//	System.out.println("데이터 베이스 연결 성공");
//} catch (ClassNotFoundException e) {
//	System.out.println("JDBC 드라이버 찾을 수 없다");
//} catch ( SQLException e) {
//	System.out.println("데이터베이스 연결에 실패");
//}
//return conn;
//}
