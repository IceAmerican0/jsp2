<%@page import="java.util.Enumeration"%>
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
	final String encoding="utf-8";
	String path=application.getRealPath("/pic"); //절대경로
	String uploadPath=request.getSession().getServletContext().getRealPath("/pic"); //상대경로
	
	String file="";
	String original="";
	try{
		MultipartRequest multi=new MultipartRequest(
				request,path,10*1024*1024,"utf-8",new DefaultFileRenamePolicy());
		
		Enumeration files=multi.getFileNames();
		String str=(String)files.nextElement();
		
		file=multi.getFilesystemName(str); //실제 파일 이름
		original=multi.getOriginalFileName(str); //이전 파일 이름
		
		File pic=multi.getFile("file");
		
		}catch(Exception e){
		e.printStackTrace();
	} 

%>

	<div align="center">
		<%
			if(file==null){
				out.println("파일이 업로드 되지 않았습니다.");
			}else{
				out.println(file+"파일이 저장되었습니다.");
			}
		%>
	</div>

<br><a href="Upload.jsp">파일선택</a>
</body>
</html>