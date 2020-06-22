<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
    <jsp:useBean id="user" class="user.User" scope="page" />
    <jsp:setProperty name="user" property="userID"/>
    <jsp:setProperty name="user" property="userPassword"/>
    <jsp:setProperty name="user" property="userName"/>
    <jsp:setProperty name="user" property="userGender"/>
    <jsp:setProperty name="user" property="userEmail"/>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
//userID에 String형태로 바꿔주고 정상적으로 자신에게 할당된 세션아이디를 받을 수 있도록한다.
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
if(userID!= null){
	PrintWriter outter = response.getWriter();
	outter.println("<script>");
	outter.println("alert('이미 로그인이 되었습니다..')");
	outter.println("location.href = main.jsp");
	outter.println("</script>");
}//로그인이 된사람은 또다시 로그인을 할 수 없도록 한다.

//아이디 값이 넓값이거나 패스워드가 널 값일 때, 사용자가 입력하지 않았을 때의 경우의 수를 나타낸다.
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName()== null 
	|| user.getUserGender()== null ||user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(입력이 안 된 사항이 있습니다.)");
		script.println("histort.back()");
		script.println("</script>");
	} else{
		//입력받은 데이터를 가지고 실제로 회원가입을 수행하도록 한다.기본키를 설정하기 때문에 이미 존재하는 아이디라고 뜬다.
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1) {
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('이미 존재하는 아이디입니다.')");
			outter.println("history.back()");
			outter.println("</script>");
		}
		//resurl가 아닐 때 전부다 회원가입이 이루어 진 경우이기 때문에 else로 한다. 
		else{
			session.setAttribute("userID",user.getUserID());
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("location.href = 'main.jsp'");
			outter.println("</script>");
		}
	}
	%>

</body>
</html>