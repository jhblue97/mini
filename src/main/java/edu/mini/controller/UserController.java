package edu.mini.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.mini.dao.UserDAO;
import edu.mini.dto.Users;



@WebServlet("/User/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double LIMIT = 3.0;	//한 페이지에 출력할 게시물 수
	private static final double PAGES_NUM = 5.0;//한 페이지에 표시할 페이지 번호 수
	private HttpSession session;
	private UserDAO userdao;
	private String url;
	private boolean result;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");	 //한글 처리
		response.setContentType("text/html; charset=UTF-8");
		
		session = request.getSession();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());

		userdao = new UserDAO();
		System.out.println("cmd--->"+cmd.split("/")[2]);
		switch (cmd.split("/")[2]) {	
		case "addUser.do" :		addUser(request);	response.sendRedirect(url);	return;	//로그인 테스트 
		/*
		 * case "/BoardWriteForm.do" : boardWriteForm(); break; //게시판 글쓰기 폼 case
		 * "/BoardWrite.do" : boardWrite(request); //게시판 글쓰기 response.sendRedirect(url);
		 * return; case "/BoardView.do" : boardView(request); break; //게시물 조회 case
		 * "/BoardModify.do" : boardModify(request); //게시물 수정
		 * response.sendRedirect(url); return; case "/BoardRemove.do" :
		 * boardRemove(request); //게시물 삭제 response.sendRedirect(url); return;
		 */		
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	public void addUser(HttpServletRequest request) {//게시판 글쓰기 처리
		System.out.println("test");		
		
		Users users = new Users();
		
		users.setId(request.getParameter("id"));
		users.setSnsid(request.getParameter("snsid"));
		users.setName(request.getParameter("name"));
		users.setSnsflag(request.getParameter("snsflag"));
		users.setMail(request.getParameter("mail"));
		users.setPhone(request.getParameter("phone"));
		
		
		result = userdao.addUser(users); //board 테이블에 저장하는 메서드 호출
		if(result == true) { //게시물 등록에 성공한 경우
			session.setAttribute("userid",users.getId());   //세션의 msg 속성에 '게시물이 등록되었습니다.'를 저장
		} else { //그렇지 않은 경우
	
		}
		
		url = "/main.jsp";	//url 		
	}
	
	

}
