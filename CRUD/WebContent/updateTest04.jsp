<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(session.getAttribute("RESULT").equals("success")){ %>
	<h3>업데이트 성공</h3>
	사용자 ID 가 <%=session.getAttribute("OLD") %> 에서
	<%=session.getAttribute("NEW") %>로 변경되었습니다.
	<%}else{ %>
	<%=session.getAttribute("RESULT") %>
	<%} %>
</body>
</html>