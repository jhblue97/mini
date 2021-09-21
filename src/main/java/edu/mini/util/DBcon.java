package edu.mini.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBcon {

	private static Connection con;
	
	private DBcon() {
		
	}
	public static Connection getConnection() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "dev";
		String passwd = "1111"; 	
		if(con == null ) {
			try {
				Class.forName(driver);
				con= DriverManager.getConnection(url, user, passwd);
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
		
		}
		return con;
	}
	public void setCon(Connection con) {
		DBcon.con = con;
	}
	
	
	public static void close() {
		try {
			if(con!=null) con.close();
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public static void close(ResultSet rs,Statement stmt) { //SELECT
		try { 
			if(rs!=null) rs.close();
			if(stmt != null) stmt.close();
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public static void close(Statement stmt) { //I,D,U
		try {
			if(stmt != null) stmt.close();
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public static void close(ResultSet rs,PreparedStatement pstmt) { //SELECT
		try { 
			if(rs!=null) rs.close();
			if(pstmt != null) pstmt.close();
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public static void close(PreparedStatement pstmt) { //I,D,U
		try {
			if(pstmt != null) pstmt.close();
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
}
