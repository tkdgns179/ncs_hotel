<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/lib/style.css">
<body>
<style>
body, html {
    height: 100%;
    background-color: #7EB5A6;
}
</style>
<div class="login_form ">
	<h1 class="form_name">회원가입 페이지</h1>
	<form id= sign_login action="/login_form" method="post">
	    <label for="user_id">이름</label><br>
	    <input class="insert" type="text" name="user_name" id=user_name> <br><br>
	    <label for="user_pwd">아이디</label><br>
	    <input class="insert" type="text" name="user_id" id=user_id> <br><br>
	    <label for="user_pwd">비밀번호</label><br>
	    <input class="insert" type="password" name="user_pwd" id=user_pwd> <br><br>
	    <label for="user_pwd">비밀번호 확인</label><br>
	    <input class="insert" type="password" name="user_repwd" id=user_repwd> <br><br>
	    <label for="user_pwd">모바일</label><br>
	    <input class="insert" type="text" name="mobile" id=mobile> <br><br>
	    <input class="input_btn" type="submit" value="회원 등록">
	    <a href="/login_form"><input class="input_btn" type="button" value="로그인하기"></a>
	</form>
</div>
</body>
</html>