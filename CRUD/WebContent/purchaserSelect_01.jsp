<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>고객 명단 리스트</h3>
	<form>
		검색 선택 : 
		<select name="searchType">
			<option value="name">이름</option>
			<option value="tel">전화번호</option>
			<option value="address">주소</option>
		</select>
		<input type="text" name="search" value="">
		<input type="submit" value="검색"><br><hr>
	</form>
<%
	String url_mysql="jdbc:mysql://localhost/customer?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql="root";
	String pw_mysql="qwer1234";
	
	String whereStatement="";
	String searchType=null;
	String search=null;
	
	searchType=request.getParameter("searchType");
	search=request.getParameter("search");
	
	//검색했으면 검색 조건 맞춰서 검색, 아니면 전부 불러오기
	if(search!=null) 	whereStatement="select userid,name,tel,address,insertdate from purchaserinfo where "
	+searchType+" like '%"+search+"%'";
	else  whereStatement="select userid,name,tel,address,insertdate from purchaserinfo";
	int cnt=0;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql=DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql=conn_mysql.createStatement();
		
		ResultSet rs=stmt_mysql.executeQuery(whereStatement);
%>
	<table border="1">
		<tr>
			<th>UserId</th><th>이름</th><th>전화번호</th><th>주소</th><th>입력일자</th>
		</tr>
	

<%
		while(rs.next()){
%>
		<tr>
			<td><a href="purchaserSelect_02.jsp?userid=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
<%
		cnt++;
		}
%>
	</table><br>
<%
		
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	<form action="purchaserInsert_01.jsp">
		<input type="submit" value="추가"><br>
	</form>
	<hr><br>
	총 인원은 <%=cnt %>명입니다. 
	
	
	
</body>
</html>