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
	function checkLogin(){
		 var form=document.loginForm;
		
		 var empJ=/\s/g; //공백체크
		 var idJ=/^[a-z]{4,12}$/; //아이디체크 영어로만
		 var pwJ=/^\d$/; //비밀번호체크 숫자로만
		 var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; //전화번호 전체
		 var phone1J=/^\d{3,4}$/; //전화번호 앞자리
		 var phone2J=/^\d{4}$/; //전화번호 뒷자리
		 var nameJ=/^[가-힣]{2,6}$/; //이름 한글로만
		 var emailJ = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-z]{2,3}$/i; //이메일체크 @확인, .뒤에 세자리 
		
		if(nameJ.test(form.name.value)==false){
			alert("한글로 이름을 입력해주세요! ");
			form.name.select();
			return false;
		}
		if(phoneJ.test(form.tel.value)==false){
			alert("전화번호를 형식에 맞게 입력해주세요!(010-XXXX-XXXX) ");
			form.tel.select();
			return false;
		}
		if(nameJ.test(form.address.value)==false){
			alert("한글로 주소를 입력해주세요! ");
			form.address.select();
			return false;
		}
		
		
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
	<form action="purchaserUpdate_03.jsp" name="loginForm" method="post">
		사용자 ID : <input type="text" name="userid" size="10" value="<%=id%>" readonly> <br>
		성명 : <input type="text" name="name" size="15" value="<%=oldName%>"><br>
		전화번호 : <input type="text" name="tel" size="15" value="<%=oldTel%>"><br>
		주소 : <input type="text" name="address" size="15" value="<%=oldAddress%>"><br>
		<input type="button" value="확인"  onclick="checkLogin()">
	</form>
</body>
</html>