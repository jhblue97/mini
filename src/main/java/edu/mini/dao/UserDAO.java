package edu.mini.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.catalina.User;

import edu.mini.dto.Users;
import edu.mini.util.DBcon;

public class UserDAO {

	
	  private Connection con; private Statement stmt; private PreparedStatement
	  pstmt; private ResultSet rs; private String query; private boolean result;
	 
	//상품 상세 정보
		public int getUserCountById(String userid) {
			int count = 0;
			System.out.println("dddddddddd"+userid);
			
				query = "select count(*) as count from users where id = '" +userid+"'";		
			try {		
				con = DBcon.getConnection();
				stmt = con.createStatement();			
				rs = stmt.executeQuery(query); //5 		
				if(rs.next()) {
					
					count = Integer.parseInt(rs.getString("count"));	
					
				}		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBcon.close(stmt);			
			}
			
			return count;
		}
		
		
		public Users getUserCountById2(String snsid,String snsflag) {
			Users user = new Users();
			
			int count = 0;
			
				query = "select * from users where snsid = '" +snsid+"' AND snsflag = '"+snsflag+"'";		
				System.out.println(query);
				try {		
				con = DBcon.getConnection();
				stmt = con.createStatement();			
				rs = stmt.executeQuery(query); //5 		
				if(rs.next()) {
					
					user.setId(rs.getString("id"));
					user.setSnsflag(rs.getString("snsflag"));
					user.setSnsid(rs.getString("snsid"));
					user.setName(rs.getString("name"));
					user.setMail(rs.getString("mail"));
					user.setPhone(rs.getString("phone"));
					user.setRegdate(rs.getDate("regdate"));
				}		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBcon.close(stmt);			
			}
			
			return user;
		}
		
		public Users getUser(String userid) {
			Users user = new Users();
			
			int count = 0;
			
				query = "select * from users where id = '" +userid+"'";		
			try {		
				con = DBcon.getConnection();
				stmt = con.createStatement();			
				rs = stmt.executeQuery(query); //5 		
				if(rs.next()) {
					
					user.setId(rs.getString("id"));
					user.setSnsflag(rs.getString("snsflag"));
					user.setSnsid(rs.getString("snsid"));
					user.setName(rs.getString("name"));
					user.setMail(rs.getString("mail"));
					user.setPhone(rs.getString("phone"));
					user.setRegdate(rs.getDate("regdate"));
				}		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBcon.close(stmt);			
			}
			
			return user;
		}
		  
		  public boolean addUser(Users user) {
		  
		  query =
		  "INSERT INTO USERS"
		  + "(ID, SNSFLAG, SNSID, NAME, MAIL, PHONE, REGDATE)"
		  + "VALUES(?,?,?,?,?,?,SYSDATE)"
		  + ""
		  ; System.out.println(query);
		  
		  try { 
		  con = DBcon.getConnection(); 
		  pstmt = con.prepareStatement(query);
		  pstmt.setString(1,user.getId()); 
		  pstmt.setString(2,user.getSnsflag());
		  pstmt.setString(3,user.getSnsid()); 
		  pstmt.setString(4,user.getName());
		  pstmt.setString(5,user.getMail());
		  pstmt.setString(6,user.getPhone());
		  
		  if(pstmt.executeUpdate()==1) { 
			   System.out.println("insert ok"); 
			  result = true;
		  
		  }else { System.out.println("insert not ok");
		  
		  result = false; }
		  
		  } catch (SQLException e) { // TODO Auto-generated catch block
		  e.printStackTrace(); } finally { DBcon.close(pstmt);
		  
		  }
		  
		  
		  return result; }
		 
		  public boolean updateUser(Users user) {
			  
		  query = "update users set name = ?,mail= ?,phone = ?"
		  		+ " where  id = ? ";
		 
		 System.out.println(query+user.getName()+user.getMail()+user.getPhone()+user.getId());
		  
		  try { 
		  con = DBcon.getConnection(); 
		  pstmt = con.prepareStatement(query);
		  pstmt.setString(1,user.getName());
		  pstmt.setString(2,user.getMail());
		  pstmt.setString(3,user.getPhone());
		  pstmt.setString(4,user.getId()); 
		  
		  if(pstmt.executeUpdate()==1) { 
			   System.out.println("update ok"); 
			  result = true;
		  
		  }else { System.out.println("update not ok");
		  
		  result = false; }
		  
		  } catch (SQLException e) { // TODO Auto-generated catch block
		  e.printStackTrace(); } finally { DBcon.close(pstmt);
		  
		  }
		  
		  
		  return result; }
}
