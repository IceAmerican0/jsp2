<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String url_mysql="jdbc:mysql://localhost/customer?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql="root";
	String pw_mysql="qwer1234";
	
	session.setAttribute("NEWNAME",request.getParameter("name"));
	session.setAttribute("NEWTEL",request.getParameter("tel"));
	session.setAttribute("NEWADDRESS",request.getParameter("address"));
	
	PreparedStatement ps=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql=DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql=conn_mysql.createStatement();
		
		String sql="update purchaserinfo set name=?,tel=?,address=? where userid=?";
		
		ps=conn_mysql.prepareStatement(sql);
		ps.setString(1,(String)session.getAttribute("NEWNAME"));
		ps.setString(2,(String)session.getAttribute("NEWTEL"));
		ps.setString(3,(String)session.getAttribute("NEWADDRESS"));
		ps.setString(4,(String)session.getAttribute("ID"));
		ps.executeUpdate();
		
		session.setAttribute("RESULT", "success");
		
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		session.setAttribute("RESULT", "fail");
	}
	
	response.sendRedirect("purchaserUpdate_04.jsp");

%>