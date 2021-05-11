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
	사용자 ID : <%=session.getAttribute("ID") %> <br>
	성명 : <%=session.getAttribute("OLDNAME") %> => <%=session.getAttribute("NEWNAME") %> <br>
	전화번호 : <%=session.getAttribute("OLDTEL") %> => <%=session.getAttribute("NEWTEL") %> <br>
	주소 : <%=session.getAttribute("OLDADDRESS") %> => <%=session.getAttribute("NEWADDRESS") %> <br>
	<%}else{ %>
	<%=session.getAttribute("RESULT") %>
	<%} %>
</body>
</html>