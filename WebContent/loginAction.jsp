<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
    <jsp:useBean id="user" class="user.User" scope="page"/>
    <jsp:setProperty name="user" property="userID"/>
    <jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트e</title>
</head>
<body>
	<%
	
	try{
		//userID에 String형태로 바꿔주고 정상적으로 자신에게 할당된 세션아이디를 받을 수 있도록한다.
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID!= null){
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('이미 로그인이 되었습니다..')");
			outter.println("location.href = 'main.jsp'");
			outter.println("</script>");
		}//로그인이 된사람은 또다시 로그인을 할 수 없도록 한다.
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if(result == 1) {
			session.setAttribute("userID",user.getUserID());
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("location.href = 'main.jsp'");
			outter.println("</script>");
		}
		else if(result == 0) {
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('비밀번호가 틀립니다.')");
			outter.println("history.back()");
			outter.println("</script>");
		}
		else if(result == -1) {
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('존재하지 않는 아이디 입니다.')");
			outter.println("history.back()");
			outter.println("</script>");
		}
		else if(result == -2) {
			
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('데이터베이스 오류가 발생했습니다.')");
			outter.println("history.back()");
			outter.println("</script>");

		}
	} catch(Exception e){
		 e.printStackTrace();
	}
	%>

</body>
</html>