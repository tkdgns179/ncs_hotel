<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/lib/style.css">
<body>
	<!-- Navigation -->
    <div class="room_reserve">
        <a href="#"><h2 style="color: blue;">객실관리</h2></a>
        <a href="/book/booking"><h2 style="color: black;">예약관리</h2></a>
        <a href="/logout"><h2 style="color: red; float: right;">로그아웃</h2></a>
    </div>

    <div class="room_list container" style="margin-left: 0;">
        <div class="row">
            <div class="col-6" style="border-right: solid; padding: 0;">
                <h4>객실 목록</h4>
                <div class="row list_header" style="border-top: solid;">
                    <table>
                        <tr style="color: coral;">
                            <th>객실 이름</th>
                            <th>객실 클래스</th>
                            <th>숙박 인원</th>
                        </tr>
                        <tr>
                            <td>백두산</td>
                            <td>SuiteRoom</td>
                            <td>4명</td>
                        </tr>
                        <tr>
                            <td>한라산</td>
                            <td>FamilyRoom</td>
                            <td>6명</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-6">
                <form action="">
                    객실 이름 : <input type="text" name="room_name"><br><br>
                    객실 분류 : <select name="room_class">
                        <option value="suite">Suite Room</option>
                        <option value="family">Family Room</option>
                        <option value="double">Double Room</option>
                    </select><br><br>
                    숙박가능 인원 : <input type="number" name="availables"> 명<br><br>
                    1박 요금 : <input type="text" name="room_price"> 원
                </form>
                <input class="button reg" type="button" value="등록">
                <input class="button del" type="button" value="삭제"> 
                
            </div>
        </div>
    </div>
</body>
</html>