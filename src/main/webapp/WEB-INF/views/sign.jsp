<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="/resources/lib/jquery.js"></script>
<link rel="stylesheet" href="/resources/lib/style.css">
<body>
<style>
body, html {
    height: 100%;
    background-color: #7EB5A6;
}
#member span {
	color: red;
	text-align: left;
	display: inherit
}
</style>

<div class="login_form ">
	<h1 class="form_name">회원가입 페이지</h1>
	<form:form  action="/signup" method="POST" commandName="member">
	    <label for="name">이름</label><br>
	    <input class="insert" type="text" name="name" id=name value="${member.name}"> <br><br>
	    <form:errors path="name"/><br>
	    <label for="loginid">아이디</label><br>
	    <input class="insert" type="text" name="loginid" id=loginid value="${member.loginid}"> <br><br>
	    <form:errors path="loginid"/><br>
	    
	    <label for="user_pwd">비밀번호</label><br>
	    <input class="insert" type="password" name="passcode" id=passcode> <br><br>
		<form:errors path="passcode" /><br>
	    
	    <label for="user_pwd">비밀번호 확인</label><br>
	    <input class="insert" type="password" name="passcode2" id=passcode2> <br><br>
	    <input class="input_btn" type="submit" value="회원 등록">
	    <a href="/login_form"><input class="input_btn" type="button" value="로그인하기"></a>
	</form:form>
</div>
</body>
<script>

$(document)
.ready(function(){
	
})
.on('submit', '#sign_login', function(e){
	
	let passcode1 = $('#passcode').val()
	let passcode2 = $('#passcode2').val()
	
	$('#sign_login input').each(function(idx, item) {
		if( $.trim($(this).val()) == "" ) { 
			alert("공백은 입력할 수 없습니다")
			e.preventDefault();
			return false;
		}
	})
	
	if ( passcode1 != passcode2 ) {
		alert('비밀번호를 다시 확인해주세요');
		e.preventDefault();
		return false;
	}
	
})
.ready(function(){
	
})
 
</script>


</html>