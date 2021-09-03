<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/lib/style.css">
<script src="/resources/lib/jquery.js"></script>

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
            <div class="col-6">
                <form name="insert_form" action=#>
                   <label for="name">객실 이름</label><br>
                    <input readonly type="text" id="name" name="name"><br><br>
                    <label for="typecode">객실 분류</label><br>
                    <select id="typecode" name="typecode">
                        
                        <!-- ModelAttribute -->
                    <c:forEach var="roomType" items="${roomTypes}">
                   	<option value="${roomType.type_typecode}">${roomType.type_name}</option>
                    </c:forEach>

                    </select><br><br>
                   <label for="howmany">최대인원</label><br>
                   <input readonly type="number" id="howmany" name="howmany"> 명<br><br>
                   <label for="howmuch">1박 요금</label><br>
                   <input type="hidden" id="roomcode">
                   <input readonly type="text" id="howmuch" name="howmuch"> 원<br><br>
                </form>
                <input class="button reg" type="button" value="등록">
                <input class="button update" type="button" value="수정">
                <input class="button del" type="button" value="삭제"> 
                <input class="button reset" type="button" value="리셋"> 
                
            </div>
        </div>
    </div>
</body>
<script>
var list_target;

$(document)
.on('click', '.button.reg, .button.update', function(){
	let name = $('input[name="name"]').val()
	let type = $('#typecode').val()
	let howmany = $('input[name="howmany"]').val()
	let howmuch = $('input[name="howmuch"]').val()
	console.log(name + "/" + type +"/"+ howmany + "/" + howmuch + "/" + roomcode + "/");
	if (name == "" || type == "" || howmany == "" || howmuch == "") {
		alert('입력란이 비었습니다')  
		return false
	}
	
	if ($.trim($('#roomcode').val()) == "") { // insert
		$.post('/book/addRoom', {name : name, type : type, howmany : howmany, howmuch : howmuch}, 
				function(result) {
				if (result == 'OK') {
					location.reload();
				}
		}, 'text')
	} else { // update
		$.post('/book/updateRoom', {name : name, roomcode : $('#roomcode').val(), type : type, howmany : howmany, howmuch : howmuch },
				function(result) {
				if (result == "OK")
					location.reload()
		}, 'text')
	}
	
	return false;
})
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
	$('#roomcode').val(list_target);
	return false;
})
.on('click', '.button.reset', function(){
	$('form[name="insert_form"]').find('input').each(function(){
		$(this).val('');
	})
	
	$('#roomcode').val('');
	
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