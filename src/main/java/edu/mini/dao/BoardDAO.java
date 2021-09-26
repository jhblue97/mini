package edu.mini.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.mini.dto.BoardBit;
import edu.mini.util.DBcon;


public class BoardDAO {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String query;
	private boolean result;
	
	
public boolean insertBoard(BoardBit board) {
	
	query = "INSERT INTO DEV.BOARDBIT"
			+ "(NUM, ID, SUBJECT, CONTENT, REGDATE, HIT, IP, RECOMMEND, IMAGE)"
			+ "VALUES(BOARDBIT_SEQ.NEXTVAL,?,?,?, sysdate , 0,?,0,?)"
			+ "";
	System.out.println(query);

	try {
		con = DBcon.getConnection();
		pstmt = con.prepareStatement(query);
		pstmt.setString(1,board.getId());
		pstmt.setString(2,board.getSubject());
		pstmt.setString(3,board.getContent());
		//pstmt.setInt(4,board.getHit());
		pstmt.setString(4,board.getIp());
		pstmt.setString(5,board.getImage());
		
		if(pstmt.executeUpdate()==1) { //성공시 
			System.out.println("insert ok");
			result = true;
			
		}else {
			System.out.println("insert not ok");
			
			result = false;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBcon.close(pstmt);
		
	} 
	
	
	return result;
}	


public boolean updateBoard(BoardBit board) {
	
	query = "UPDATE DEV.BOARDBIT"
			+ " SET SUBJECT = ?, CONTENT = ?, IP = ?, IMAGE =?"
			+ " WHERE NUM = ?";
	System.out.println(query+board.getImage());
 
	try {
		con = DBcon.getConnection();
		pstmt = con.prepareStatement(query);
		pstmt.setString(1,board.getSubject());
		pstmt.setString(2,board.getContent());
		pstmt.setString(3,board.getIp());
		pstmt.setString(4,board.getImage());
		pstmt.setInt(5,board.getNum());
		
		if(pstmt.executeUpdate()==1) { //성공시 
			System.out.println("insert ok");
			result = true;
			
		}else {
			System.out.println("insert not ok");
			
			result = false;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBcon.close(pstmt);
		
	} 
	
	
	return result;
}	

public boolean deleteBoard(int num) {
	
	query = "Delete from DEV.BOARDBIT"
			+ " WHERE NUM = ?";
 
	try {
		con = DBcon.getConnection();
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1,num);
	
		
		if(pstmt.executeUpdate()==1) { //성공시 
			System.out.println("insert ok");
			result = true;
			
		}else {
			System.out.println("insert not ok");
			
			result = false;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBcon.close(pstmt);
		
	} 
	
	
	return result;
}	

public boolean updateHit(int num) {
	
	query = "UPDATE DEV.BOARDBIT"
			+ " SET Hit = (hit+?)"
			+ " WHERE NUM = ?";
 
	try {
		con = DBcon.getConnection();
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1,1);
		pstmt.setInt(2,num);
		if(pstmt.executeUpdate()==1) { //성공시 
			System.out.println("update ok");
			result = true;
			
		}else {
			System.out.println("update not ok");
			
			result = false;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBcon.close(pstmt);
		
	} 
	
	
	return result;
}	

public List<BoardBit> selectBoardList(){
	  

query = "SELECT * FROM BoardBit" ;
List<BoardBit> boardList = new ArrayList<BoardBit>();

try {

	  	con = DBcon.getConnection();
		stmt = con.createStatement();			
		rs = stmt.executeQuery(query); //5 

		while(rs.next()) {
		
		BoardBit board = new BoardBit(); 
		board.setNum(rs.getInt("num"));
		board.setId(rs.getString("id"));
		board.setSubject(rs.getString("subject"));
		board.setContent(rs.getString("content"));
		board.setRegdate(rs.getDate("regDate")); 
		board.setHit(rs.getInt("hit"));
		board.setIp(rs.getString("ip"));
		board.setImage(rs.getString("image"));
		
		
		boardList.add(board); } }catch (SQLException e) { // TODO: handle exception
		e.printStackTrace(); }finally { DBcon.close(rs,stmt); }
		
		return boardList; 

}


  public List<BoardBit> selectBoardList(String text){
  
	  if(text==null) {
		  text = "";
	  }
	  query= "SELECT * FROM BoardBit WHERE SUBJECT LIKE '%"+ text+ "%' OR CONTENT LIKE '%"+text+"%'";
  List<BoardBit> boardList = new ArrayList<BoardBit>();
  System.out.println(query);
  try {
  
	  	con = DBcon.getConnection();
		stmt = con.createStatement();			
		rs = stmt.executeQuery(query); //5 
  
  while(rs.next()) {
  
  BoardBit board = new BoardBit(); 
  board.setNum(rs.getInt("num"));
  board.setId(rs.getString("id"));
  board.setSubject(rs.getString("subject"));
  board.setContent(rs.getString("content"));
  board.setRegdate(rs.getDate("regDate")); 
  board.setHit(rs.getInt("hit"));
  board.setIp(rs.getString("ip"));
  board.setImage(rs.getString("image"));

  
  boardList.add(board); } }catch (SQLException e) { // TODO: handle exception
  e.printStackTrace(); }finally { DBcon.close(rs,stmt); }
  
  return boardList; 
  
  }
  

  public BoardBit getBoard(int num) {
  
  BoardBit board = new BoardBit();   
  query = "select * from boardbit where num ="+num;
  
  try {
  
	 
  stmt = DBcon.getConnection().createStatement(); 
  rs = stmt.executeQuery(query);
  
  if(rs.next()) {
	
	board.setNum(rs.getInt("num"));
	board.setId(rs.getString("id"));
	board.setSubject(rs.getString("subject"));
	board.setContent(rs.getString("content"));
	board.setRegdate(rs.getDate("regdate"));
	board.setHit(rs.getInt("hit"));
	board.setIp(rs.getString("ip"));
	board.setImage(rs.getString("image"));
	  } 
   }catch (SQLException e) { // TODO: handle exception
  e.printStackTrace(); }finally{ DBcon.close(rs,stmt); } 
  
  return board; 
  
  }
  
/*
 * //게시물 조횟 수 증가 public void updateHit(int num) {
 * 
 * query = "UPDATE BOARD SET HIT = HIT+1 WHERE NUM = ?";
 * System.out.println(query);
 * 
 * try { con = DBcon.getConnection(); pstmt = con.prepareStatement(query);
 * pstmt.setInt(1,num);
 * 
 * if(pstmt.executeUpdate()==1) { //성공시 System.out.println("insert ok"); result
 * = true;
 * 
 * }else { System.out.println("insert not ok");
 * 
 * result = false; }
 * 
 * } catch (SQLException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } finally { DBcon.close(pstmt);
 * 
 * } } //게시물 하나 조회 public BoardBit selectBoard(int num) {
 * 
 * query = "SELECT * FROM BOARD WHERE NUM = ?";
 * 
 * BoardBit board = null;
 * 
 * try {
 * 
 * con = DBcon.getConnection(); pstmt = con.prepareStatement(query);
 * pstmt.setInt(1,num); rs = pstmt.executeQuery(); //5
 * 
 * if(rs.next()) { board = new BoardBit(); board.setNum(rs.getInt("num"));
 * board.setId(rs.getString("id")); board.setSubject(rs.getString("subject"));
 * board.setRegDate(rs.getDate("regdate")); board.setHit(rs.getInt("hit"));
 * board.setIp(rs.getString("ip")); board.setContent(rs.getString("content")); }
 * 
 * } catch (SQLException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } finally { DBcon.close(stmt);
 * 
 * }
 * 
 * 
 * return board; }
 * 
 * 
 * public boolean updateBoard(BoardBit board) {
 * 
 * query = "UPDATE BOARD SET subject= ? , content = ? where num=?";
 * 
 * try {
 * 
 * con = DBcon.getConnection(); pstmt = con.prepareStatement(query);
 * pstmt.setString(1,board.getSubject()); pstmt.setString(2,board.getContent());
 * pstmt.setInt(3,board.getNum());
 * 
 * if(pstmt.executeUpdate()==1) { result = true; }else { result = false; } }
 * catch (SQLException e) { e.printStackTrace(); // TODO: handle exception
 * }finally { DBcon.close(pstmt); } return result;
 * 
 * }
 * 
 * 
 * //게시물 삭제 public boolean deleteBoard(int num) {
 * 
 * query = "DELETE FROM BOARD WHERE NUM = ?"; System.out.println(query);
 * 
 * try { con = DBcon.getConnection(); pstmt = con.prepareStatement(query);
 * pstmt.setInt(1,num);
 * 
 * if(pstmt.executeUpdate()==1) { //성공시 System.out.println("insert ok"); result
 * = true;
 * 
 * }else { System.out.println("insert not ok");
 * 
 * result = false; }
 * 
 * } catch (SQLException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } finally { DBcon.close(pstmt);
 * 
 * }
 * 
 * return result; }
 */
 
 

}
