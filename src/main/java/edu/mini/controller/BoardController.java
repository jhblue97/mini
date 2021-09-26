package edu.mini.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import edu.mini.dao.BoardDAO;
import edu.mini.dto.BoardBit;


@WebServlet("/Board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double LIMIT = 3.0;	//한 페이지에 출력할 게시물 수
	private static final double PAGES_NUM = 5.0;//한 페이지에 표시할 페이지 번호 수
	private HttpSession session;
	private BoardDAO bdao;
	private String url;
	private boolean result;

	//게시판 목록 출력 처리
	
	  public List<BoardBit> boardList(HttpServletRequest request) { 
	
		  String text = request.getParameter("text");
		  List<BoardBit> list = new ArrayList<BoardBit>();
		  
		  list = bdao.selectBoardList(text);
		  
		  request.setAttribute("list", list);
		  url = "/board/boardList.jsp";
		  return list;

	  }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	 //한글 처리
		response.setContentType("text/html; charset=UTF-8");
		
		session = request.getSession();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		bdao = new BoardDAO();
		System.out.println("cmd--->"+cmd.split("/")[2]);
		switch (cmd.split("/")[2]) {	
		case "boardList.do" :		boardList(request);		break;	//게시판 목록 출력
		//case "/BoardWriteForm.do" : boardWriteForm();		break; 	//게시판 글쓰기 폼	
		case "boardWrite.do" : 	boardWrite(request); 			//게시판 글쓰기
									response.sendRedirect(url);
									return;
		case "boardUpdate.do" : 	boardUpdate(request); 			//게시판 글쓰기
		response.sendRedirect(url);
		return;
		case "boardDelete.do" : 	boardDelete(request); 			//게시판 글쓰기
		response.sendRedirect(url);return; 
	
		
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}	

	public void boardDelete(HttpServletRequest request) throws IOException {//게시판 글쓰기 처리
		

	

		
		result = bdao.deleteBoard(Integer.parseInt(request.getParameter("num"))); //board 테이블에 저장하는 메서드 호출
		if(result == true) { //게시물 등록에 성공한 경우
			session.setAttribute("msg", "게시물이 등록되었습니다.");   //세션의 msg 속성에 '게시물이 등록되었습니다.'를 저장
		} else { //그렇지 않은 경우
			session.setAttribute("msg", "게시물 등록에 실패했습니다."); //세션의 msg 속성에 '게시물 등록에 실패했습니다.'를 저장한 후
		}
		
		url = "/Board/boardList.do";	//url을 게시물 목록으로 지정
	}
	
	
	public void boardWrite(HttpServletRequest request) throws IOException {//게시판 글쓰기 처리
		

		ServletContext aa = this.getServletContext();
		 
		String savePath = aa.getRealPath("/resources/images"); 
		int maxSize = 5 * 1024* 1024;
		String encType = "UTF-8";
		
		MultipartRequest multiReq =  new MultipartRequest(
				request, savePath, maxSize, encType,new DefaultFileRenamePolicy());
		

		System.out.println("ddddddddddddddd"+multiReq.getParameter("userid")+multiReq.getParameter("subject"));
		
		BoardBit board = new BoardBit();	//요청 객체에서 파라미터로 전송된 값을 Board 객체에 저장하고
		board.setId(multiReq.getParameter("userid"));
		board.setSubject(multiReq.getParameter("subject"));
		board.setContent(multiReq.getParameter("content"));
		board.setIp(request.getRemoteAddr());	//클라이언트 ip 저장
		board.setImage(multiReq.getFilesystemName("image"));
		
		
		result = bdao.insertBoard(board); //board 테이블에 저장하는 메서드 호출
		if(result == true) { //게시물 등록에 성공한 경우
			session.setAttribute("msg", "게시물이 등록되었습니다.");   //세션의 msg 속성에 '게시물이 등록되었습니다.'를 저장
		} else { //그렇지 않은 경우
			session.setAttribute("msg", "게시물 등록에 실패했습니다."); //세션의 msg 속성에 '게시물 등록에 실패했습니다.'를 저장한 후
		}
		
		url = "/Board/boardList.do";	//url을 게시물 목록으로 지정
	}
	
	public void boardUpdate(HttpServletRequest request) throws IOException {//게시판 글쓰기 처리
		

		ServletContext aa = this.getServletContext();
		 
		String savePath = aa.getRealPath("/resources/images"); 
		int maxSize = 5 * 1024* 1024;
		String encType = "UTF-8";
		
		MultipartRequest multiReq =  new MultipartRequest(
				request, savePath, maxSize, encType,new DefaultFileRenamePolicy());
		

		
		BoardBit board = new BoardBit();	//요청 객체에서 파라미터로 전송된 값을 Board 객체에 저장하고
		board.setNum(Integer.parseInt(multiReq.getParameter("view_num")));
		board.setId(multiReq.getParameter("view_userid"));
		board.setSubject(multiReq.getParameter("view_subject"));
		board.setContent(multiReq.getParameter("view_content"));
		board.setIp(request.getRemoteAddr());	//클라이언트 ip 저장
		board.setImage(multiReq.getFilesystemName("view_image"));
		if(multiReq.getParameter("view_img_bak")!=null&&multiReq.getFilesystemName("view_image")==null) {
			
			board.setImage(multiReq.getParameter("view_img_bak"));
		} 
		/*
		 * if(multiReq.getParameter("view_img_bak")!=null) {
		 * board.setImage(multiReq.getParameter("view_img_bak")); }
		 */
		System.out.println(multiReq.getFilesystemName("view_image")+":::"+multiReq.getParameter("view_img_bak")+":::"+multiReq.getParameter("view_subject")+":::"+multiReq.getParameter("view_num"));
		//System.out.println(board.getImage());
		//System.out.println("값"+multiReq.getParameter("view_img_bak"));
		/*
		 * if(multiReq.getParameter("view_img_bak")!=null) {
		 * board.setImage(multiReq.getParameter("view_img_bak")); }else {
		 * //board.setImage(multiReq.getFilesystemName("view_image"));
		 * board.setImage(multiReq.getParameter("view_img_bak")); }
		 */
		 
		result = bdao.updateBoard(board); //board 테이블에 저장하는 메서드 호출
		if(result == true) { //게시물 등록에 성공한 경우
			session.setAttribute("msg", "게시물 수정 등록되었습니다.");   //세션의 msg 속성에 '게시물이 등록되었습니다.'를 저장
		} else { //그렇지 않은 경우
			session.setAttribute("msg", "게시물 수정 실패했습니다."); //세션의 msg 속성에 '게시물 등록에 실패했습니다.'를 저장한 후
		}
		
		url = "/Board/boardList.do";	//url을 게시물 목록으로 지정
	}
	
}//END class

















