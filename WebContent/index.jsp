<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!--<script>
		location.href = 'main.jsp';
	</script>
	-->

	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		파일: <input type="file" name="file1"><br>
		파일: <input type="file" name="file2"> <br>
		파일: <input type="file" name="file3"><br>
	   <input type="submit" value="업로드">
	</form>
</body>
</html>