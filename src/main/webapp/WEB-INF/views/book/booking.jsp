<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
</head>
<!-- bootstrap 4.1.1 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="/resources/lib/jquery.js"></script>
<link rel="stylesheet" href="/resources/lib/style.css">

<body>
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
                	<div class="search_input">
                	 	 
	                	<div class="search_data search_date">
		                    <label for="time_first">시작일</label><br>
		                    <input type="date" id="time_first" name="time_first"><br><br>
	                	</div> 
						<div class="search_data search_date">
		                    <label for="time_last">종료일</label><br>
		                    <input type="date" id="time_last" name="time_last"><br><br>
						</div>
						
						<div class="search_data search_date">
		                    <label for="time_last">객실종류</label><br>
		                    <input type="text" id="room_class" name="room_class"><br><br>
						</div>
						
<!-- 						<input style="display: inline-block" class="button" id="search_room" type="button" value="검색"> -->
						                    
                	</div>
                
                    <table>
                        <tr style="color: coral;">
                            <th>객실 이름</th>
                            <th>객실 클래스</th>
                            <th>최대 인원</th>
                            <th>일박 가격</th>
                        </tr>
                        	<c:forEach var="room" items="${roomList}" varStatus="status">
                        <tr class="room_items">
                            <td>${room.name}</td>
                            <td>${room.type_name}</td>
                            <td>${room.howmany}</td>
                            <td>${room.howmuch}</td>
                            <input type="hidden"  id="room_seq_${status.count}" value="${room.roomcode}">
                        </tr>
                        	</c:forEach>
                    </table>
                </div>
            </div>
            <div class="col-4">
                <form name="insert_form" action="#">
                	<label for="name">객실 이름</label><br>
                    <input readonly type="text" id="name" name="name"><br><br>
                    <label for="typecode">객실 분류</label><br>
                    <select id="typecode" name="typecode">
                    
                    <!-- ModelAttribute -->
                    <c:forEach var="roomType" items="${roomTypes}">
		                    	<option value="${roomType.type_typecode}">${roomType.type_name}</option>
                    </c:forEach>
                    
                    </select><br><br>
                    숙박 기간  <br>
                    <label for="time_first">시작일</label><br>
                    <input type="date" id="time_first" name="time_first"><br><br>
                    <label for="time_last">종료일</label><br>
                    <input type="date" id="time_last" name="time_last"><br><br>
                    <label for="howmany">최대인원</label><br>
                    <input readonly type="number" id="howmany" name="howmany"> 명<br><br>
                    <label for="howmuch">1박 요금</label><br>
                    <input readonly type="text" id="howmuch" name="howmuch"> 원<br><br>
                    <label for="total_price">총 숙박비</label><br>
                    <input readonly type="text" id="total_price" name="total_price"> 원<br><br>
                    <label for="mobile">예약자 모바일</label><br>
                    <input type="text" id="mobile" name="mobile">
                </form>
                <div class="d-flex justify-content-left mt-3" style="width: 100%;">
                    <input class="button reg" type="button" value="등록">
                    <input class="button del" type="button" value="삭제"> 
                    <input class="button reset" type="button" value="리셋"> 
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
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>	
</body>
<script>
let first = ""; 
let last = "";

var list_target;
$(document)
/* 
.ready(function(){
	$.post('http://127.0.0.1:8080/book/getRoomType', {}, function(result){ // @ResponseBody
		console.log(result);
		let str = ""
		$.each(result, function(idx, val){
			str += '<option value="'+val['type_typecode']+'">'+val['type_name']+'</option>\n'
		})
		$('#typecode').append(str);
		
	}, 'json')
})
 */
 
.on('click', '.room_items', function(){
	
	arr = []
	$(this).find('td').each(function(idx, item){
		arr.push($(this).text())
	})
	$('input[name="name"]').val(arr[0])
	$('input[name="howmany"]').val(arr[2])
	$('input[name="howmuch"]').val(arr[3])
	
	
	$('#typecode').find('option').remove();
	
	<c:forEach var="room" items="${roomList}">
	if ($('input[name="name"]').val() == '${room.name}'){
		$('#typecode').append('<option value="${room.roomcode}">${room.type_name}</option>')
	}
	</c:forEach>
	
	$('#typecode').find('option').each(function(){
		if ($(this).text() == arr[1] ) $(this).attr('selected', 'selected');
	})
	
	list_target = $(this).find('input[type="hidden"]').val();
	
	return false;
})
.on('change', '#typecode', function(){
	<c:forEach var="room" items="${roomList}">
	if ($('input[name="name"]').val() == '${room.name}' && $('#typecode option:selected').text() == '${room.type_name}' ){
		$('input[name="howmuch"]').val('${room.howmuch}')
		$('input[name="howmany"]').val('${room.howmany}')
	}
	</c:forEach>
	
	return false;
})
.on('change', '#time_first, #time_last, .room_items tr', function(){
	let first = $('#time_first').val()
	let last = $('#time_last').val()
	
	if (first != "" && last != "") {
		let start = new Date(first);
		let end = new Date(last)
		let diff = end.getTime() - start.getTime()
		let days = diff/1000/60/60/24;
		let howmuch = parseInt($('input[name="howmuch"]').val());
		if ($('input[name="howmuch"]').val() != "") {
			let total = howmuch*(days);
			$('input[name="total_price"]').val(total);
		}
	}
	
	return false;
})
.on('click', '.button.reset', function(){
	$('form[name="insert_form"]').find('input').each(function(){
		$(this).val('');
	})
	
	$('#typecode').find('option').remove();
	
	<c:forEach var="roomType" items="${roomTypes}">
	$('#typecode').append('<option value="${roomType.type_typecode}">${roomType.type_name}</option>')
	</c:forEach>
	
	return false;
})
.on('click', '.button.del', function(){ // @ResponseBody
	
	$.post('/book/deleteRoom', {roomcode : list_target }, function(result){
		if (result == "OK") {
			$('.button.reset').trigger('click');
			$('.room_items').find('input[type="hidden"]').each(function(idx, item){
				if ($(this).val() == list_target) $(this).parent('.room_items').remove(); 
			})
		} 
	}, 'text' ) 
	
	
	
	return false;
})

</script>
</html>