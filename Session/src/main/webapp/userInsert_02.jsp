<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		session.setAttribute("ID",request.getParameter("id"));
		session.setAttribute("NAME",request.getParameter("name"));
		session.setAttribute("PW",request.getParameter("pw"));
	%>
	
	<h2>약관</h2><br><hr><br>
	1. 회원 정보는 웹사이트의 운영을 위해서만 사용됩니다.<br>
	2. 웹사이트의 정상 운영을 방해하는 회원은 탈퇴 처리합니다.<br><hr><br>
	위의 약관에 동의하십니까?<br><br>
	
	<form action="userInsert_03.jsp">
		<input type="radio" name="result" value="success"> 동의함
		<input type="radio" name="result" value="failed"> 동의하지 않음<br><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>