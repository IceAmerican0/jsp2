<%@page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	request.setCharacterEncoding("utf-8");
	final String Folder="/Users/tj/Desktop";
	final String encoding="utf-8";
	String uploadPath=request.getRealPath("Folder");
	
	
	File upDir=new File(uploadPath);
	if(!upDir.exists()) upDir.mkdirs();
	try{
		MultipartRequest multi=new MultipartRequest(
				request,uploadPath,10*1024*1024,"utf-8",new DefaultFileRenamePolicy());
		
		String fileName=multi.getFilesystemName("File");
		String original=multi.getOriginalFileName("File"); 
		
		File file=new File(uploadPath);
%>
		
		<br><a href="Upload.jsp">파일선택</a>
<%
		}catch(Exception e){
		e.printStackTrace();
	} 

%>
</body>
</html>