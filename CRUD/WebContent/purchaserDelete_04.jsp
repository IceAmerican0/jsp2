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
	<h3>삭제 성공</h3>
	사용자 ID : <%=session.getAttribute("ID") %> <br><br>
	상기의 정보가 삭제되었습니다!
	<%}else{ %>
	<%=session.getAttribute("RESULT") %>
	<%} %>
	
	
</body>
</html>