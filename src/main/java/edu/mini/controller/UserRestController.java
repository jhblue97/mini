package edu.mini.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.mini.dao.UserDAO;
import edu.mini.dto.Users;

/**
 * Servlet implementation class UserRestController
 */
@WebServlet("/User/json/*")
public class UserRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double LIMIT = 3.0;	//한 페이지에 출력할 게시물 수
	private static final double PAGES_NUM = 5.0;//한 페이지에 표시할 페이지 번호 수
	private HttpSession session;
	private UserDAO userdao;
	private String url;
	private boolean result;
	int money = 0;
	int count =0;
	private Users user;
	
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
		
		userdao = new UserDAO();
		 
		switch (cmd.split("/")[3]) {			
		case "idCheck.do":
			idCheck(request.getParameter("userid"));
			 out.print(count);  
			return;			
		case "idCheck2.do":
			 idCheck2(request.getParameter("snsid"),request.getParameter("snsflag"));
			 out.print(count);  
			return;	
		}

	}
 
	public void idCheck(String userid) throws IOException {
		
	   
		 count = userdao.getUserCountById(userid);
		 
		

	}
	

	public void idCheck2(String snsid,String snsflag) throws IOException {
		
		user = new Users();
		user = userdao.getUserCountById2(snsid,snsflag);
		 
		if(user!=null) {
			session.setAttribute("userid",user.getId());
			session.setAttribute("name",user.getName());
			count = 1;
		}else {
			count = 0;
		}

	}

}
