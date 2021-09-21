package edu.mini.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.mini.crolling.Exchange;


@WebServlet("/Chart/*")
public class ChartRestController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final double LIMIT = 3.0;	//한 페이지에 출력할 게시물 수
	private static final double PAGES_NUM = 5.0;//한 페이지에 표시할 페이지 번호 수
	private HttpSession session;
	//private BoardDAO bdao;
	private String url;
	private boolean result;
	int money = 0;
	
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
		
		switch (cmd.split("/")[2]) {	
		
			case "exchange.do" :	exchange(request); out.println(money); return;	
		
		}
		
		/*
		 * RequestDispatcher rd = request.getRequestDispatcher(url); rd.forward(request,
		 * response);
		 */
	}
 
	public void exchange(HttpServletRequest request) {
	
	Exchange ex = new Exchange();
	money =  ex.getKRWUSD();
	
	
	}

}
