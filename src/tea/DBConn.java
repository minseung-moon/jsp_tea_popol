package tea;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	// jdbc:mysql://localhost:3306/database_name?serverTimezone=UTC
			
	public static Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/tea";
		String id = "root";
		String password = "1234";
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC
			System.out.println("DB 연결중 ...");
			conn = DriverManager.getConnection(dbURL,id,password); // DB 연결
			System.out.println("데이터 베이스 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 찾을 수 없다");
		} catch ( SQLException e) {
			System.out.println("데이터베이스 연결에 실패");
		}
		return conn;
	}
			
//			public static void main(String[] args) {
//				DBConn.getConnection();
//			}
}
