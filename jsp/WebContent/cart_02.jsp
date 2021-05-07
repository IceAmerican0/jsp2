<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 저장 결과</h2>
<%
	request.setCharacterEncoding("utf-8");
	String count=request.getParameter("count");
	String size=request.getParameter("size");
	String color=request.getParameter("color");
	
	String filename="file.txt";
	
	PrintWriter writer=null;
	String admit="";
	try{
		String filePath=application.getRealPath("/"+filename);
		writer=new PrintWriter(filePath);
		writer.println("수량 : "+count);
		writer.println("크기 : "+size);
		writer.println("색상 : "+color);
		admit="success";
	}catch(Exception e){
		admit="fail";
	}finally{
		try{
			response.sendRedirect("cart_03.jsp?admit="+admit);
			writer.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>