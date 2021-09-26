package edu.mini.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import edu.mini.dao.BoardDAO;
import edu.mini.dto.BoardBit;
import edu.mini.dto.Users;

/**
 * Servlet implementation class UserRestController
 */
@WebServlet("/Board/json/*")
public class BoardRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double LIMIT = 3.0;	//한 페이지에 출력할 게시물 수
	private static final double PAGES_NUM = 5.0;//한 페이지에 표시할 페이지 번호 수
	private HttpSession session;
	private BoardDAO bdao;
	private JSONObject  obj;
	private String url;
	private  String test;
	private boolean result;
	int money = 0;
	int count =0;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");	 //한글 처리
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		bdao = new BoardDAO();
		 
		switch (cmd.split("/")[3]) {			
		case "getBoard.do":
			getBoard(Integer.parseInt(request.getParameter("num")));
			 out.print(obj.toJSONString());  
			return;	
		case "updateHit.do":
			updateHit(Integer.parseInt(request.getParameter("num"))); 
			out.print(result);
			return;		
		}

	}
 
	public void getBoard(int num) throws IOException {
		
	   BoardBit board = new BoardBit();
	   
	   
	   board = bdao.getBoard(num);
		  
	   obj = new JSONObject ();
	   
	   obj.put("num",board.getNum());
	   obj.put("id",board.getId());
	   obj.put("subject",board.getSubject());
	   obj.put("content",board.getContent());
	   obj.put("hit",board.getHit());
	   obj.put("image",board.getImage());
	   obj.put("regdate",board.getRegdate()+"");
	    

	   
	  
	}

	public void updateHit(int num) throws IOException {
		
		   BoardBit board = new BoardBit();
		   
		   
		   result = bdao.updateHit(num);  
		}

}
