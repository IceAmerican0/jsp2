<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>입력 성공</h3>
	<%
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String num=request.getParameter("num1")+" - "+
							request.getParameter("num2")+" - "+
							request.getParameter("num3");
	%>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>
	<p>이름 : <%=name %></p>
	<p>연락처 : <%=num %></p>
	<p>이메일 : <%=email %></p>
</body>
</html>