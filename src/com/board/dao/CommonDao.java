package com.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CommonDao {
	private final String driverName = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String db_id = "board";
	private final String db_pw = "1234";
	
	private Connection con = null;
	
	public Connection openConnection() {
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, db_id, db_pw);
		}catch(SQLException e){
			System.out.println("sql error");
		}catch (ClassNotFoundException e) {
			System.out.println("driver error");
		}
		
		return con;
	}
	
	public void closeConnection() {
		try {
			if(!con.isClosed()) con.close();
		}catch(SQLException e){
			System.out.println("sql close error");
		}
	}
}
