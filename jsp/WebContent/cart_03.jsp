<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 저장 결과</title>
</head>
<body>
	<h2>파일 저장 결과</h2>
<%
	String str=request.getParameter("admit");
	if(str.equals("success")){
		out.print("저장 되었습니다.");
%>
	<form action="cart_04.jsp" >
		<input type="submit" value="파일 정보 불러오기">
	</form>	
<%
	}else{
		out.println("파일에 문제가 발생했습니다.");
	}

%>
</body>
</html>