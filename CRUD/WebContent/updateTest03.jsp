<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	session.setAttribute("NEW", userid);
	String url_mysql="jdbc:mysql://localhost/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql="root";
	String pw_mysql="qwer1234";
	
	PreparedStatement ps=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql=DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql=conn_mysql.createStatement();
		
		String sql="update wtest set userid=? where id=?";
		
		ps=conn_mysql.prepareStatement(sql);
		ps.setString(1,userid);
		ps.setString(2,(String)session.getAttribute("ID"));
		ps.executeUpdate();
		
		session.setAttribute("RESULT", "success");
		
		conn_mysql.close();
		
	}catch(Exception e){
		session.setAttribute("RESULT", "fail");
	}
	
	response.sendRedirect("updateTest04.jsp");

%>