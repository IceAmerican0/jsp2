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
		
		 var idJ=/^[a-z]{4,12}$/; //아이디체크 영어로만 4~12자리
		 var pwJ=/^\d$/; //비밀번호체크 숫자로만
		 var phone1J=/^\d{3,4}$/; //전화번호 앞자리 3~4자리
		 var phone2J=/^\d{4}$/; //전화번호 뒷자리 4자리
		 var nameJ=/^[가-힣]{2,6}$/; //이름 한글로만
		 var emailJ = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-z]{2,3}$/i; 
		 //이메일체크 중간@확인, .뒤에 세자리
		
		if(idJ.test(form.id.value)==false){
			alert("영어 소문자와 4~12자리로 아이디를 입력해주세요! ");
			form.id.select();
			return false;
		}
		if(numberJ.test(form.pw.value)==false){
			alert("숫자로 비밀번호를 입력해주세요! ");
			form.pw.select();
			return false;
		}
		if(nameJ.test(form.name.value)==false){
			alert("한글로 이름을 입력해주세요! ");
			form.name.select();
			return false;
		}
		if(phone1J.test(form.num2.value)==false){
			alert("숫자로 전화번호를 입력해주세요! ");
			form.num2.select();
			return false;
		}
		if(phone2J.test(form.num3.value)==false){
			alert("숫자로 전화번호를 입력해주세요! ");
			form.num3.select();
			return false;
		}
		if(emailJ.test(form.email.value)==false){
			alert("이메일 형식으로 입력해주세요! (예 : abc@naver.com)");
			form.email.select();
			return false;
		}	
		
		
		form.submit();
	}
</script>
<body>
	<h3>회원 가입</h3>
	<form action="Validation00_Process.jsp" name="loginForm" method="post">
	<p>아이디 : <input type="text" name="id"></p> 
	<p>비밀번호 : <input type="password" name="pw"></p> 
	<p>이름 : <input type="text" name="name"></p> 
	<p>연락처 : 
		<select name="num1">
			<option value="010">010</option>		
			<option value="010">031</option>		
			<option value="010">02</option>		
		</select>
	-<input type="text" name="num2">
	-<input type="text" name="num3">
	</p>
	<p>이메일 : <input type="text" name="email"></p>
	<input type="button" value="가입하기" onclick="checkLogin()"> 
	</form>
</body>
</html>