<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


if(request.getParameter("admin")!=null){
	session.removeAttribute("userid");
	session.setAttribute("userid","admin");
	response.sendRedirect("/main.jsp");
}else{
	session.invalidate();
	response.sendRedirect("/main.jsp");

}


//세션 무효화 및 메인 페이지로 이동
%>