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

<style>
div.search_data {
	display: inline-block;
	line-height: 20px;
	vartical-align: middle;
}
div.search_data input {
	display: inline-block;
	vertical-align: middle;
	line-height: 20px;
}
.search_btn {
	display: inline-block;
	line-height: 20px;
	vertical-align: middle;
	margin: 0 auto;
	float:right;
}
.search_type {
	
}
div.search_input {
	background-color: #C8C6C6;
	font: bold;
	border-bottom: solid #ff7f50;
}
div.input_box {
	display : inline-block;
}
div.input_box input {
	width: 90%
}
</style>

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
                	
                	 	 <!-- BookingVO 사용 -->
	                	<div class="search_data search_date">
		                    <label for="checkin">시작일</label><br>
		                    <input type="date" id="checkin" name="checkin"><br><br>
	                	</div> 
						<div class="search_data search_date">
		                    <label for="checkout">종료일</label><br>
		                    <input type="date" id="checkout" name="checkout"><br><br>
						</div>
						
						<div style="width: 100%" class="search_data search_type">
                    	<label for="room_class">객실종류</label><br>
						<div class="helper">
						<select id="sel_type" name=name>
							<option value="all" selected>WHATEVER CLASS</option>
							<c:forEach var="roomType" items="${roomTypes}">
		                    	<option value="${roomType.type_name}">${roomType.type_name}</option>
                		    </c:forEach>
						</select>	                    
						<input class="search_btn" type="button" value="조회">
						</div>
						</div>
						
						                    
                	</div>
                
                    <table id='roomListTbl'>
                        <tr style="color: coral;">
                            <th>객실 이름</th>
                            <th>객실 클래스</th>
                            <th>최대 인원</th>
                            <th>일박 가격</th>
                        </tr>
                        	<%-- <c:forEach var="room" items="${roomList}" varStatus="status">
                        <tr class="room_items">
                            <td>${room.name}</td>
                            <td>${room.type_name}</td>
                            <td>${room.howmany}</td>
                            <td>${room.howmuch}</td>
                            <input type="hidden"  id="room_seq_${status.count}" value="${room.roomcode}">
                        </tr>
                        	</c:forEach> --%>
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
                    <div class=input_box>
                    <label for="time_first">시작일</label><br>
                    <input readonly type="date" id="time_first" name="time_first"><br><br>
                    </div>
                    <div class=input_box>
                    <label for="time_last">종료일</label><br>
                    <input readonly type="date" id="time_last" name="time_last"><br><br>
                    </div>
                    
                    <div class=input_box>
                    <label for="howmany">최대인원</label><br>
                    <input readonly type="number" id="howmany" name="howmany"><br><br>
                    </div>
                    <div class=input_box>
                    <label for="howmany">숙박인원</label><br>
                    <input type="number" id="stay_num" name="stay_num"><br><br>
                    </div>
                    
                    <div class=input_box>
                    <label for="howmuch">1박 요금</label><br>
                    <input readonly type="text" id="howmuch" name="howmuch"><br><br>
                    </div>
                    <div class=input_box>
                    <label for="total_price">총 숙박비</label><br>
                    <input readonly type="text" id="total_price" name="total_price"><br><br>
                    </div>
                    
                    
                    <label for="mobile">예약자 성함</label><br><br>
                    <input type="text" id="reg_name" name="reg_nam"> <br><br>
                    <label for="mobile">예약자 모바일</label><br>
                    <input type="text" id="mobile" name="mobile">
                    
                    <input type="hidden" id="form_bookcode">
                </form>
                <div class="d-flex justify-content-left mt-3" style="width: 100%;">
                    <input class="button reg" type="button" value="등록">
                    <input class="button update" type="button" value="수정"> 
                    <input class="button del" type="button" value="삭제"> 
                    <input class="button reset" type="button" value="리셋"> 
                </div>
                
            </div>
            <div class="col-4" style="border-left: solid; padding: 0;">
                <h4>예약된 객실</h4>
                <div class="row list_header">
                    <table id='tbl_booking'>
                        <tr style="color: coral;">
                            <th>객실 이름</th>
                            <th>숙박 기간</th>
                            <th>숙박 인원</th>
                            <th>모바일 번호</th>
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

var checkin;
var checkout;

var list_target = "";
var booking_target = "";
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
	
	$('#form_bookcode').val('') // 객실목록에서 클릭하였기 때문에 초기화시켜줌
	
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
	
	$('#time_first').val($('#checkin').val());
	$('#time_last').val($('#checkout').val());
	
	$('#time_first, #time_last').trigger('change')
	
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
		if (diff < 0) {
			alert('체크아웃 날짜을 다시 확인해주세요')
			$('#time_last').val('');
		}
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
/* 객실관리에서 구현하였음
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
 */	
.on('click', '.search_btn', function(){
// 	alert('start')
	checkin = $('#checkin').val().replaceAll('-', '')
	checkout = $("#checkout").val().replaceAll('-', '')
	sel_type = $('#sel_type').val().replaceAll('-', '')
	
	if (checkin =='' || checkout == '')  {
		alert('조회일자를 입력해주세요') 
		return false
	}
	
	if (checkin > checkout) {
		alert('체크아웃은 체크인보다 먼저일 수 없습니다')
		$('#checkout').val('')
		return false
	}
	// console.log(checkin + '/' + checkout + '/' + sel_type)
	
	$.post('/book/searchRooms', {checkin : checkin, checkout : checkout, name : sel_type}, function(result){
 		$('.room_items').remove()
			let str = "";
 		
			for (var idx in result) {
				str += '<tr class="room_items">\n'
				str += '<td>'+result[idx].name+'</td>\n'
	            str += '<td>'+result[idx].type_name+'</td>\n'
	            str += '<td>'+result[idx].howmany+'</td>\n'
	            str += '<td>'+result[idx].howmuch+'</td>\n'
	            str += '<input type="hidden"  value="'+result[idx].roomcode+'">\n'
	            str += '</tr>\n'
			}
			$('#roomListTbl').append(str);
			return false;
	})
	
})
.on('change', '#stay_num', function(){
	if ($('#howmany').val() == '') {
		alert('객실을 선택해주세요')
		$(this).val('')
	}
	if ($(this).val() > $('#howmany').val() || $(this).val() < 0) {
		alert('유효하지 않은 인원 수 입니다')
		$(this).val('')
	}
})
.on('click', '.button.reg', function(){
	$.post('/book/addBooking', {
		roomcode : list_target,
		person : $('#stay_num').val(),
		checkin : $('#time_first').val().replaceAll('-', ''),
		checkout : $('#time_last').val().replaceAll('-', ''),
		name : $('#reg_name').val(),
		mobile : $('#mobile').val(),
		total : $('#total_price').val()
	}, function(result){
		console.log(result);
		post_getBookings();
	})
})
.on('click', '.button.update', function(){
	
	if ($('#form_bookcode').val() != "") {
		$.post('/book/doUpdateBooking', {
			id : $('#form_bookcode').val(),
			person : $('#stay_num').val(),
			name : $('#reg_name').val(),
			mobile : $('#mobile').val()
		}, function(result){
			console.log(result);
			post_getBookings();
		})
	} else {
		alert('수정할 대상이 없습니다')
	}
	
})
.ready(function(){
	post_getBookings();
})
.on('click', '.booking_items', function(){
	
	booking_target = $(this);
	
	$.post('/book/getOneBooking', {id : $(this).find('input').val()}, function(result){
		console.log(result)
		$('#name').val(result.room_name)
		$('#typecode option:selected').text(result.room_typename)
 		let str1 = result.checkin.substring(0, 4) +'-'+ result.checkin.substring(4, 6) +'-'+ result.checkin.substring(6, 8)
 		let str2 = result.checkout.substring(0, 4) +'-'+ result.checkout.substring(4, 6) +'-'+ result.checkout.substring(6, 8)
		$('#time_first').val(str1)
		$('#time_last').val(str2)
		$('#howmany').val(result.howmany)
		$('#howmuch').val(result.howmuch)
		$('#stay_num').val(result.person)
		$('#total_price').val(result.total)
		$('#reg_name').val(result.name)
		$('#mobile').val(result.mobile)
		$('#form_bookcode').val(result.bookcode)
	})
	
})
.on('click', '.button.del', function(){
	$.post('/book/doDeleteBooking', {id : $('#form_bookcode').val()}, function(result){
		console.log(result);
		
		if (result == 'OK') {
			booking_target.remove();
		}
	})
})


function post_getBookings() {
	$.post('/book/getBookings', {}, function(result){
		$('.booking_items').remove();
		
		let str = '';
		for (var idx in result) {
			str += '<tr class="booking_items">\n'
			str += '<td>'+result[idx].room_name+'</td>\n'
			str += '<td>'+result[idx].checkin+'~'+result[idx].checkout+'</td>\n'
			str += '<td>'+result[idx].person+'</td>\n'
			str += '<td>'+result[idx].mobile+'</td>\n'
			str += '<input type="hidden"  value="'+result[idx].bookcode+'">\n'
			str += '</tr>\n'
		}
		
		$('#tbl_booking').append(str);
	})
}



</script>
</html>