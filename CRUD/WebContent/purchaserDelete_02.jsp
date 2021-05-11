<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkDelete(){
		var form=document.deleteForm;
		alert("삭제하시겠습니까?");
		form.submit();
	}
</script>
<body>
	<h4>아이디를 수정 후 확인 버튼을 누르세요</h4>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	session.setAttribute("ID", id);
	String strUserid=null;
	String oldTel=null;
	String oldName=null;
	String oldAddress=null;

	String url_mysql="jdbc:mysql://localhost/customer?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql="root";
	String pw_mysql="qwer1234";
	String result="";
	
	String whereStatement="select userid,name,tel,address from purchaserinfo where userid='"+id+"'";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql=DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql=conn_mysql.createStatement();
		
		ResultSet rs=stmt_mysql.executeQuery(whereStatement);
		while(rs.next()){
			strUserid=rs.getString(1);
			oldTel=rs.getString(2);
			oldName=rs.getString(3);
			oldAddress=rs.getString(4);
		}
		session.setAttribute("OLDNAME", oldName);
		session.setAttribute("OLDTEL", oldTel);
		session.setAttribute("OLDADDRESS", oldAddress);
		
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	<h3>삭제할 고객정보를 확인 후 버튼을 누르세요!</h3>
	<form action="purchaserDelete_03.jsp" name="deleteForm" method="post">
		사용자 ID : <input type="text" name="userid" size="10" value="<%=id%>" readonly> <br>
		성명 : <input type="text" name="name" size="15" value="<%=oldName%>"><br>
		전화번호 : <input type="text" name="tel" size="15" value="<%=oldTel%>"><br>
		주소 : <input type="text" name="address" size="15" value="<%=oldAddress%>"><br>
		<input type="button" value="확인"  onclick="checkDelete()">
	</form>
</body>
</html>