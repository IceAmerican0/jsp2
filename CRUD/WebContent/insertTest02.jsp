<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid=request.getParameter("userid");
	String url_mysql="jdbc:mysql://localhost/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql="root";
	String pw_mysql="qwer1234";
	String result="";
	
	PreparedStatement ps=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql=DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql=conn_mysql.createStatement();
		
		String sql="insert into wtest (userid) values (?)";
		
		ps=conn_mysql.prepareStatement(sql);
		ps.setString(1, userid);
		ps.executeUpdate();
		
		result="Success!";
		
		conn_mysql.close();
		
	}catch(Exception e){
		result="Failed!";
		e.printStackTrace();
	}
	
	response.sendRedirect("insertTest03.jsp?result="+result);

%>