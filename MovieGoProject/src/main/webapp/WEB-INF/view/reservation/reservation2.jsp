<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- http://pino0308.cafe24.com/gnu5/uz/lab/movie_reserve/ver2.html -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reserve2.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
function chk_seledVal(){
/*  선택좌석 alert창으로 뜨는거 구현
 */	
 location.href="payment.jsp"       	    
}
</script>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<table class="reserve-seat">
<tr><th colspan="4" id="seat-first">인원/좌석</th></tr>
<tr>
<td>
<label>일반</label>
<select name="adult">
<option value="1">1명</option>
<option value="2">2명</option>
<option value="3">3명</option>
</select>
<br>
<label>청소년</label>
<select name="student">
<option value="1">1명</option>
<option value="2">2명</option>
<option value="3">3명</option>
</select>
<br>
</td>
<td>
<!-- 좌석 설정 -->
</td>
<td colspan="2" align="center">
선택하신 상영관/영화/시간<br>
건대입구/쏘우/2015-02-06/오전(잔여40석)
</td>
</tr>
<tr>
<td colspan="4">
<!-- 좌석 선택 화면 -->
<div class="theaterMap">
	<div class="screen">screen</div>
	<div class="mapWrap"></div>
</div>
</td>
</tr>
<tr class="peopleResult">
<th>인원</th><td><span>명</span></td>
</tr>
<tr>
<th>좌석</th><td><span>좌석</span></td>
</tr>
</table>

<input type="button" onclick="chk_seledVal();" value="결제하기"></input>
<script type="text/javascript">
//좌석배치
var rowArray = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
var map = $('.mapWrap');

for (i=0; i<8; i++){
	map.append('<div class="map clearfix"><div class="row">'+rowArray[i]+'</div><div class="arrayNum"></div></div>');
}
for (i=1; i<14; i++){
	map.find('.arrayNum').append('<button>'+i+'</button>');
}

//인원 설정
peopleNum.bind('click', function(){
	var peopleIdx = $(this).parent().index();
	seatNum.removeClass('clicked selected');
	$(this).parent().addClass('selected').siblings().removeClass('selected');
	if (peopleIdx == 1){
		seat1.prop('checked', true).next().addClass('selected');
		seat2.next().removeClass('selected');
	} else if (peopleIdx > 1){
		seat1.next().addClass('selected');
		seat2.prop('checked', true).next().addClass('selected');
	} else {
		selectSeat.prop('checked', false).next().removeClass('selected');
	}
	//인원설정에 따른 합계금액
	charge.val(peopleIdx*8000);
});

//좌석설정
selectSeat.bind('click', function(){
	//인원이 0일 때 좌석설정을 하려고 하면
	if (peopleNum.closest('ul').find('li.selected').index() == 0){
		alert('인원은 최소 1명 이상 선택해야 합니다.');
		selectSeat.prop('checked', false);
	}
});
seat2.bind('click', function(){
	//인원이 1일 때 2개좌석을 설정하려고 하면
	if (peopleNum.closest('ul').find('li.selected').index() == 1){
		alert('2인 이상시 선택 가능합니다.');
		$(this).prop('checked', false);
		seat1.prop('checked', true);
	}
});

//좌석선택
seatNum.bind({
	hover: function(){
		var limitSeat1 = (peopleNum.closest('ul').find('li.selected').index()-1);
		var limitSeat2 = (peopleNum.closest('ul').find('li.selected').index());
		var checkSeatCnt =  $('.arrayNum button.clicked').length;
		if (seat2.prop('checked') == true){
			if (limitSeat2 - checkSeatCnt <= 1){
			} else {
				$(this).next().toggleClass('selected');
			}
		}
	}, click: function(){
		var limitSeat1 = (peopleNum.closest('ul').find('li.selected').index()-1);
		var limitSeat2 = (peopleNum.closest('ul').find('li.selected').index());
		var checkSeatCnt =  $('.arrayNum button.clicked').length;
		if (seat1.prop('checked') == true){
			if (limitSeat1 < checkSeatCnt){
			} else {
				$(this).addClass('clicked');
			}
		} else if (seat2.prop('checked') == true){
			if (limitSeat2 == checkSeatCnt){
			} else if (limitSeat2 - checkSeatCnt == 1){
				$(this).addClass('clicked');
			} else {
				$(this).addClass('clicked').next().addClass('clicked');
			}
		} else {
			alert('인원은 최소 1명 이상 선택해야 합니다.');
		}
	}
});

//좌석 다시선택 : 선택된 좌석 초기화
refresh.bind('click', function(){
	seatNum.removeClass('clicked selected');
});

//선택완료 : 
submitBtn.bind('click', function(){
	var chargeTotal = $('.charge input').val();
	var peopleTotal = $('.map .arrayNum button.clicked').length;
	if ($('.peopleNum li').eq(0).hasClass('selected')){
		alert('인원은 최소 1명이상 선택해야 합니다.');
		return;
	} else if (peopleTotal != $('.peopleNum li.selected').index()){
		alert('좌석이 모두 선택되지 않았습니다.');
		$('.peopleNum li.selected').focus();
	} else {
		$('.result').show();
		//인원결과
		$('.peopleResult span').text(peopleTotal);
		//금액결과
		$('.chargeResult span').text(chargeTotal);
		//좌석결과 : 선택된 좌석을 모두 뿌려줌
		var clickedSeat = new Array();
		$('.arrayNum button').each(function(){
		if ($(this).hasClass('clicked')){
				clickedSeat.push(
					$(this).closest('.map').find('.row').text()+($(this).index()+1)
				);
				$('.seatResult td').text(clickedSeat.join(' / '));
			}
		});
	}
	
});
//완료창 닫기
closeRestult.bind('click', function(){
	$('.result').hide();
});
</script>
</body>
</html>