<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/custom.css">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<!--<script>
		location.href = 'main.jsp';
	</script>
	-->

	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		����: <input type="file" name="file1"><br>
		����: <input type="file" name="file2"> <br>
		����: <input type="file" name="file3"><br>
	   <input type="submit" value="���ε�">
	</form>
</body>
</html>