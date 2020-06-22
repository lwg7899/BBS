<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="bbs.BbsDAO" %>
   <%@ page import="bbs.Bbs" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('로그인을 하세요.')");
		outter.println("location.href = 'login.jsp'");
		outter.println("</script>");
	} 
	
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('유효하지 않은 글 입니다.')");
		outter.println("location.href = 'bbs.jsp'");
		outter.println("</script>");
	}//로그인이 된사람은 또다시 로그인을 할 수 없도록 한다.
	
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	} else{
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);
		if(result == -1) {
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('글 삭제에 실패했습니다.')");
			outter.println("history.back()");
			outter.println("</script>");
		}
		else{
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("location.href = 'bbs.jsp'");
			outter.println("</script>");
		}
	}
	%>

</body>
</html>