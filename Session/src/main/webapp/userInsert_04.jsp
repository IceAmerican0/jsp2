<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<h3>회원 가입 결과</h3><br>
	가입되었습니다.<br>
	<h3>가입내용</h3><br>
	아이디 : ${ID} <br>
	패스워드 : ${PW } <br>
	성명 : ${NAME } <br>
	<%=session.getAttribute("NAME") %>
	<%session.invalidate(); %>
</body>
</html>