<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/lib/style.css">
<style>
.login_form {
	height: 300px;
}
body, html {
    height: 100%;
    background-color: #7EB5A6;
}
</style>
<body>
<div class="login_form ">
        <h1 class="form_name">로그인 페이지</h1>
            <form id=sign_login action="/check_user" method="post">
                <label for="user_id">아이디</label><br>
                <input class="insert" type="text" name="user_id" id=user_id> <br><br>
                <label for="user_pwd">비밀번호</label><br>
                <input class="insert" type="password" name="user_pwd" id=user_pwd> <br><br>
                <input class="input_btn" type="submit" value="로그인">
                <a href="/sign_form"><input class="input_btn" type="button" value="회원가입"></a>
            </form>
    </div>
</body>
</html>