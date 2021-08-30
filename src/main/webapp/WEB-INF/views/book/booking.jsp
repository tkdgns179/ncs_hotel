<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 비지니스 로직이 View에 있으면 좋지않은 방식 -->

<%
	/* 
	out.println((String) session.getAttribute("userid"));
	String name = 
	if(!name.equals("sanghoon")) {
				
		response.sendRedirect("/login_form");
	}
	 */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
</head>
<!-- bootstrap 4.1.1 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/lib/style.css">
<body>
	<c:forEach var="room" items="${roomList}">
		${room.roomcode}
	</c:forEach>
	<!-- Navigation -->
    <div class="room_reserve">
        <a href="/book/room"><h2 style="color: black;">객실관리</h2></a>
        <a href="#"><h2 style="color: blue;">예약관리</h2></a> 
        <a href="/logout"><h2 style="color: red; float: right;">로그아웃</h2></a> 
    </div>

    <div class="room_list container-fluid">
        <div class="row">
            <div class="col-4 h4tag" style="border-right: solid; padding: 0;">
                    <h4>객실 목록</h4>
                <div class="row list_header">
                    <table>
                        <tr style="color: coral;">
                            <th>객실 이름</th>
                            <th>객실 클래스</th>
                            <th>숙박 인원</th>
                            <th>인당 가격</th>
                        </tr>
                        <tr>
                            <td>한라산</td>
                            <td>FamilyRoom</td>
                            <td>5명</td>
                            <td>12,000원</td>
                        </tr>
                        <tr>
                            <td>백두산</td>
                            <td>SuiteRoom</td>
                            <td>6명</td>
                            <td>20,000원</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-4">
                <form action="">
                    객실 이름 : <input type="text" name="room_name"><br><br>
                    객실 분류 : <select name="room_class">
                        <option value="suite">Suite Room</option>
                        <option value="family">Family Room</option>
                        <option value="double">Double Room</option>
                    </select><br><br>
                    숙박 기간 : <br>
                    시작일 : <input type="date" name="time_first"><br>
                    종료일 : <input type="date" name="time_last"><br><br>
                    숙박 인원 : <input type="number" name="availables"> 명<br><br>
                    1박 요금 : <input type="text" name="room_price"> 원<br><br>
                    총 숙박비 : <input type="text" name="total_price"> 원<br><br>
                    예약자 모바일 : <input type="text" name="mobile">
                </form>
                <div class="d-flex justify-content-center mt-3" style="width: 100%;">
                    <input class="button reg" type="button" value="등록">
                    <input class="button del" type="button" value="삭제"> 
                </div>
                
            </div>
            <div class="col-4" style="border-left: solid; padding: 0;">
                <h4>예약된 객실</h4>
                <div class="row list_header">
                    <table>
                        <tr style="color: coral;">
                            <th>객실 이름</th>
                            <th>숙박 기간</th>
                            <th>숙박 인원</th>
                            <th>모바일 번호</th>
                        </tr>
                        <tr>
                            <td>광덕산</td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>