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
		사용자 ID : <%=session.getAttribute("ID") %> <br>
		성명 : <%=session.getAttribute("NAME") %> <br>
		전화번호 : <%=session.getAttribute("TEL") %> <br>
		주소 : <%=session.getAttribute("ADDRESS") %> <br><br>
		상기의 정보로 입력되었습니다. 감사합니다.
		<%}else{ %>
		<%=session.getAttribute("RESULT") %>
		<%} %>
</body>
</html>