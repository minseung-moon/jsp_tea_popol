package tea;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class mysqlConn {
	// jdbc:mysql://localhost:3306/database_name?serverTimezone=UTC
			
			public static Connection getConnection() {
				String dbURL = "jdbc:mysql://localhost:3306/tea";
				String id = "root";
				String password = "1234";
				Connection conn = null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC
					System.out.println("DB ������ ...");
					conn = DriverManager.getConnection(dbURL,id,password); // DB ����
					System.out.println("������ ���̽� ���� ����");
				} catch (ClassNotFoundException e) {
					System.out.println("JDBC ����̹� ã�� �� ����");
				} catch ( SQLException e) {
					System.out.println("�����ͺ��̽� ���ῡ ����");
				}
				return conn;
			}
			
			public static void main(String[] args) {
				mysqlConn.getConnection();
			}
}
//
//
//package tea;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;

//public class DBConn {
//	// jdbc:mysql://localhost:3306/database_name?serverTimezone=UTC
//			
//			public static Connection getConnection() {
//				String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
//				String id = "system";
//				String password = "1234";
//				Connection conn = null;
//				try {
//					Class.forName("oracle.jdbc.OracleDriver"); // JDBC
//					System.out.println("DB ������ ...");
//					conn = DriverManager.getConnection(dbURL,id,password); // DB ����
//					System.out.println("������ ���̽� ���� ����");
//				} catch (ClassNotFoundException e) {
//					System.out.println("JDBC ����̹� ã�� �� ����");
//				} catch ( SQLException e) {
//					System.out.println("�����ͺ��̽� ���ῡ ����");
//				}
//				return conn;
//			}
//			
//			public static void main(String[] args) {
//				new DBConn();
//			}
//}

