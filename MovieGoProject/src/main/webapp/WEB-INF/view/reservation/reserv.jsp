<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/reserve2.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<style type="text/css">
html {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	overflow-y: scroll;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	font-size: 12px;
	font-family: NanumGothic, '나눔고딕', 'Nanum Gothic', '돋움', Dotum, '굴림',
		Gulim, Vernada, Arial, sans-serif !important;
	color: #484848;
}

html, h1, h2, h3, h4, h5, h6, dl, dt, dd, form, fieldset, img {
	margin: 0;
	padding: 0;
	font-family: NanumGothic, '나눔고딕', 'Nanum Gothic', '돋움', Dotum, '굴림',
		Gulim, Vernada, Arial, sans-serif !important;
	border: 0;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
	margin: 0;
	padding: 0;
	border: 0;
}

ul, ol, li {
	margin: 0;
	padding: 0;
	list-style: none;
	font-family: NanumGothic, '나눔고딕', 'Nanum Gothic', '돋움', Dotum, '굴림',
		Gulim, Vernada, Arial, sans-serif !important;
}

legend {
	position: absolute;
	margin: 0;
	padding: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999em;
	overflow: hidden;
}

label, input, button, select, img {
	vertical-align: middle;
	border: none;
}

button {
	cursor: pointer;
}

p {
	margin: 0;
	padding: 0;
	font-family: NanumGothic, '나눔고딕', 'Nanum Gothic', '돋움', Dotum, '굴림',
		Gulim, Vernada, Arial, sans-serif !important;
	word-break: break-all;
}

hr {
	display: none;
}

a, a:link, a:visited, a:hover, a:focus, a:active {
	text-decoration: none !important;
}

.hide {
	display: inline-block;
	position: absolute;
	top: -9999em;
	left: -9999em;
	line-height: 0;
	text-indent: -9999em;
	overflow: hidden;
}

.clearfix {
	*zoom: 1;
}

.clearfix:after {
	content: "";
	clear: both;
	display: block;
}

h1 {
	text-align: center;
	padding: 30px 0 10px;
}

h2 {
	padding-bottom: 10px;
}

.wrap {
	width: 800px;
	margin: 0 auto;
	border: 1px solid #ccc;
}

.set {
	padding: 20px 20px 30px 20px;
}

.peopleNum {
	float: left;
	width: 400px;
}

.peopleNum li {
	float: left;
	margin-right: 2px;
}

.peopleNum button {
	padding: 5px 10px;
	font-weight: normal;
	border: 1px solid #aaa;
}

.peopleNum .selected button {
	font-weight: bold;
	background: #444;
	color: #fff;
}

.peopleNum li:hover button {
	font-weight: bold;
	background: #444;
	color: #fff;
}

.seat {
	float: left;
}

.seat input {
	margin-top: -10px;
}

.seat label {
	font-size: 0;
	text-indent: -999em;
}

.seat span {
	display: inline-block;
	width: 11px;
	height: 11px;
	margin-right: 2px;
	border: 1px solid #aaa;
	background: #c9c9c9;
}

.seat .selected span {
	background: #fff;
}

.theaterMap .mapWrap {
	width: 450px;
	margin: 0 auto;
}

.theaterMap .screen {
	width: 480px;
	margin: 0 auto 10px;
	padding: 10px 0;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	border: 1px solid #aaa;
	background: #eee;
	cursor: default;
}

.theaterMap .map {
	padding: 2px 0;
}

.theaterMap .map .row {
	float: left;
	width: 20px;
	margin-right: 10px;
	font-weight: bold;
	text-align: center;
	line-height: 1.8em;
	color: #C75C5C;
}

.theaterMap .map .arrayNum {
	float: left;
	width: 420px;
}

.theaterMap .map .arrayNum button {
	padding: 4px 8px;
	margin: 0 1px;
	border: 1px solid #cacaca;
	background: #eee;
}

.theaterMap .map .arrayNum button:hover {
	background: #4F5D73;
}

.theaterMap .map .arrayNum button.selected {
	background: #4F5D73;
}

.theaterMap .map .arrayNum button.reserved {
	background: #4F5D73;
}

.theaterMap .map .arrayNum button.clicked {
	background: #C75C5C;
}

.theaterMap .map .arrayNum button:nth-of-type(4) {
	margin-right: 20px;
}

.charge {
	margin-top: 30px;
	padding: 30px;
	text-align: right;
	background: #444;
	color: #fff;
}

.charge label {
	font-size: 20px;
	margin-right: 5px;
}

.charge span {
	font-size: 15px;
}

.charge input {
	width: 100px;
	padding: 6px 5px;
	font-size: 18px;
	text-align: right;
}

.charge button {
	padding: 10px 15px;
	font-weight: bold;
}

.charge .refresh {
	margin-left: 20px;
	margin-right: 5px;
}

.charge .submitBtn {
	background: #0094d9;
	color: #fff;
}

.result {
	display: none;
	position: absolute;
	top: 200px;
	left: 50%;
	width: 300px;
	margin-left: -201px;
	padding: 30px 50px;
	text-align: center;
	background: #fff;
	border: 5px solid #0094d9;
}

.result table {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
}

.result caption {
	font-size: 15px;
	font-weight: bold;
	padding-bottom: 10px;
}

.result th, .result td {
	padding: 10px 0;
	text-align: center;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.result th {
	background: #eee;
}

.result td {
	padding: 10px 5px;
}

.result button {
	margin-top: 20px;
	padding: 10px 20px;
	font-weight: bold;
	border: 1px solid #09567a;
	background: #0094d9;
	color: #fff;
}

.result .seatResult td {
	padding: 10px 40px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<input type="hidden" id="rseats" value="${reservedSeats }" />
	<div id="rsv1">
		${rinfo }<br> 예약된 좌석: ${reservedSeats }
	</div>

	<div class="wrap">
		<div class="set clearfix">
			<div class="peopleNum">
				<h2>인원설정</h2>
				<ul class="clearfix">
					<li class="selected"><button>0</button></li>
					<li><button>1</button></li>
					<li><button>2</button></li>
					<li><button>3</button></li>
					<li><button>4</button></li>
					<li><button>5</button></li>
					<li><button>6</button></li>
					<li><button>7</button></li>
					<li><button>8</button></li>
				</ul>
			</div>
			<div class="seat">
				<h2>좌석설정</h2>
				<input type="radio" id="seat1" name="selectSeat" /> <label
					for="seat1">떨어진 자리<span></span></label> <input type="radio"
					id="seat2" name="selectSeat" /> <label for="seat2">붙은 2자리<span></span>
					<span></span></label>
			</div>
		</div>
		<div class="theaterMap">
			<div class="screen">screen</div>
			<div class="mapWrap"></div>
		</div>
		<div class="charge">
			<label for="">합계</label><input type="text" value="0" /> <span>원</span>
			<button class="refresh">좌석 다시선택</button>
			<button class="submitBtn">선택완료</button>
		</div>
	</div>

	<div class="result">
		<table>
			<colgroup>
				<col style="width: 30%" />
				<col style="width: 70%" />
			</colgroup>
			<caption>좌석선택 결과</caption>
			<tr class="peopleResult">
				<th>인원</th>
				<td><span></span>명</td>
			</tr>
			<tr class="seatResult">
				<th>좌석</th>
				<td></td>
			</tr>
			<tr class="chargeResult">
				<th>합계</th>
				<td><span></span>원</td>
			</tr>
		</table>
		<button id="submit">확인</button>
		<button id="cancel">취소</button>
	</div>

	<script type="text/javascript">
		//좌석배치
		var rowArray = ['A', 'B', 'C', 'D'];
		var map = $('.mapWrap');

		for (i = 0; i < 4; i++) {
			map.append('<div class="map clearfix"><div class="row">'
					+ rowArray[i] + '</div><div class="arrayNum"></div></div>');
		}
		for (i = 1; i < 14; i++) {
			map.find('.arrayNum').append("<button value='"+i+"' id='"+i+"'>" + i + "</button>");
		}

		var peopleNum = $('.peopleNum button');
		var selectSeat = $('.seat input');
		var seat1 = $('.seat input#seat1');
		var seat2 = $('.seat input#seat2');
		var charge = $('.charge input');
		var seatNum = $('.arrayNum button');
		var refresh = $('.charge .refresh');
		var submitBtn = $('.charge .submitBtn');
		var closeResult = $('.result button#cancel');
		var sendResult = $('.result button#submit');
		var clickedSeat;
		var chargeTotal;
		var peopleTotal;

		$(document).ready(function() {
			var rseats = ${testjson	};
			var rseatsarr = rseats.rsvdSeats;
			var rowchar;
			var seatNo;
			for ( var temp in rseatsarr) {
				var s = rseatsarr[temp].seat;
				console.log("좌석 정보 : " + s);
				n = Math.floor(s/14);
				rowchar = rowArray[n];
				seatNo = s-(13*n);
				var seatNoStr = seatNo.toString();
				console.log(seatNoStr);
			}
			/* if ((document.querySelector(".theaterMap .map .row").innerHTML == rowchar)
					&&($(":button[value~=]").val()==seatNoStr)){
				//$(".theaterMap .map .arrayNum button").addClass('reserved');
				alert(rowchar);
				alert(seatNo);
			} */
		});
		
		
		//인원 설정
		peopleNum.bind('click', function() {
			var peopleIdx = $(this).parent().index();
			seatNum.removeClass('clicked selected');
			$(this).parent().addClass('selected').siblings().removeClass(
					'selected');
			if (peopleIdx == 1) {
				seat1.prop('checked', true).next().addClass('selected');
				seat2.next().removeClass('selected');
			} else if (peopleIdx > 1) {
				seat1.next().addClass('selected');
				seat2.prop('checked', true).next().addClass('selected');
			} else {
				selectSeat.prop('checked', false).next()
						.removeClass('selected');
			}
			//인원설정에 따른 합계금액
			charge.val(peopleIdx * 8000);
		});

		//좌석설정
		selectSeat.bind('click', function() {
			//인원이 0일 때 좌석설정을 하려고 하면
			if (peopleNum.closest('ul').find('li.selected').index() == 0) {
				alert('인원은 최소 1명 이상 선택해야 합니다.');
				selectSeat.prop('checked', false);
			}
		});
		seat2.bind('click', function() {
			//인원이 1일 때 2개좌석을 설정하려고 하면
			if (peopleNum.closest('ul').find('li.selected').index() == 1) {
				alert('2인 이상시 선택 가능합니다.');
				$(this).prop('checked', false);
				seat1.prop('checked', true);
			}
		});

		//좌석선택
		seatNum.bind({
			hover : function() {
				var limitSeat1 = (peopleNum.closest('ul').find('li.selected')
						.index() - 1);
				var limitSeat2 = (peopleNum.closest('ul').find('li.selected')
						.index());
				var checkSeatCnt = $('.arrayNum button.clicked').length;
				if (seat2.prop('checked') == true) {
					if (limitSeat2 - checkSeatCnt <= 1) {
					} else {
						$(this).next().toggleClass('selected');
					}
				}
			},
			click : function() {
				var limitSeat1 = (peopleNum.closest('ul').find('li.selected')
						.index() - 1);
				var limitSeat2 = (peopleNum.closest('ul').find('li.selected')
						.index());
				var checkSeatCnt = $('.arrayNum button.clicked').length;
				if (seat1.prop('checked') == true) {
					if (limitSeat1 < checkSeatCnt) {
					} else {
						$(this).addClass('clicked');
					}
				} else if (seat2.prop('checked') == true) {
					if (limitSeat2 == checkSeatCnt) {
					} else if (limitSeat2 - checkSeatCnt == 1) {
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
		refresh.bind('click', function() {
			seatNum.removeClass('clicked selected');
		});

		//선택완료 : 
		submitBtn.bind('click', function() {
			chargeTotal = $('.charge input').val();
			peopleTotal = $('.map .arrayNum button.clicked').length;
			if ($('.peopleNum li').eq(0).hasClass('selected')) {
				alert('인원은 최소 1명이상 선택해야 합니다.');
				return;
			} else if (peopleTotal != $('.peopleNum li.selected').index()) {
				alert('좌석이 모두 선택되지 않았습니다.');
				$('.peopleNum li.selected').focus();
			} else {
				$('.result').show();
				//인원결과
				$('.peopleResult span').text(peopleTotal);
				//금액결과
				$('.chargeResult span').text(chargeTotal);
				//좌석결과 : 선택된 좌석을 모두 뿌려줌
				clickedSeat = new Array();
				$('.arrayNum button').each(
						function() {
							if ($(this).hasClass('clicked')) {
								clickedSeat.push($(this).closest('.map').find(
										'.row').text()
										+ ($(this).index() + 1));
								$('.seatResult td').text(
										clickedSeat.join(' / '));
							}
						});
			}

		});
		//완료창에서 취소버튼 눌렀을때(창닫기)
		closeResult.click(function() {
			$('.result').hide();
		});

		//완료창에서 확인버튼 눌렀을 때
		sendResult.click(function() {
			$("#postForm input[name='seatlist']").val(clickedSeat);
			$("#postForm input[name='price']").val(chargeTotal);
			$("#postForm").submit();
		});
	</script>
	<form style="display: none;" id="postForm" method="post"
		action="<%=request.getContextPath()%>/reserve/payment">
		<input type="hidden" name="seatlist" /> <input type="hidden"
			name="price" />
	</form>
</body>
</html>