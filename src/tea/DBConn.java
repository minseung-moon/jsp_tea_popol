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
			System.out.println("DB���� ����");
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
//	System.out.println("DB ������ ...");
//	conn = DriverManager.getConnection(dbURL,id,password); // DB ����
//	System.out.println("������ ���̽� ���� ����");
//} catch (ClassNotFoundException e) {
//	System.out.println("JDBC ����̹� ã�� �� ����");
//} catch ( SQLException e) {
//	System.out.println("�����ͺ��̽� ���ῡ ����");
//}
//return conn;
//}
