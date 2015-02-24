<%@page import="com.mvg.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<style>
.rsvInfo {
	padding-left: 600px;
	padding-bottom: 30px; 
	margin: 0 auto;
	width: 2000px;
	height: 100%;
	
}

.discount {
	padding-left: 700px; 
	padding-bottom: 50px;
	margin: 0 auto;
	width: 2000px;
	height: 100%;
}

.payment {
	padding-left: 800px; 
	margin: 0 auto;
	width: 2000px;
	height: 100%;
}

.but {
	padding-left: 800px; 
	margin: 0 auto;
	width: 2000px;
	height: 100%;
}

.table1 th {
	background: #4F5D73;
	text-align: center;
	color: #ffffff;
}

.table1 td {

	text-align: center;

}

.table2 th {
	background: #4F5D73;
	text-align: center;
	color: #ffffff;
}

.table2 td {
	width: 550px;
	text-align: center;

}
.btn {
	background: #0094d9;
	color: #fff;
}
</style>
<script type="text/javascript">
var price = ${price };
var totalprice = price;
var spoint = price * 0.1;
var yncoupon="notused";
var upoint=0;

function cal() {
	totalprice = $("#price").val() - $("#minusCoupon").val() - $("#minusPoint").val();
	$("#total").val(totalprice);
	spoint = totalprice * 0.1;
	$("#savePoint").val(spoint);
}

function useCoupon() {
	alert("쿠폰이 사용되었습니다.");
	var cp = $("#price").val() * 0.1;
	$("#minusCoupon").val(cp);
	cal();
	yncoupon="used";
}

function cancelCoupon() {
	alert("쿠폰 사용이 취소되었습니다.");
	$("#minusCoupon").val(0);
	cal();
	yncoupon="notused";
}

function usePoint() {
 	var point = $("#inputPoint").val();
 	if (point == null || point == 0) {
 		alert("포인트를 10점 이상 입력해주세요.");
 	}
 	else if (point <= $("#userPoint").val()) {
		if (point%10==0) {
			alert("포인트가 사용되었습니다.");
			$("#minusPoint").val(point);
			upoint=point;
		}
		else {
			alert("포인트를 10점 단위로 입력해주세요.");
			$("#inputPoint").val(0);
		}
	}
	else {
		alert("적용되지 않았습니다.");
		$("#inputPoint").val(0);
	}
	cal();
 }
 
function cancelPoint() {
	alert("포인트 사용이 취소되었습니다.");
	$("#minusPoint").val(0);
	$("#inputPoint").val(0);
	cal();
	upoint=0;
}

function completeReserv() {
	//예매 완료버튼
	$("#postForm input[name='totalprice']").val(totalprice);
	$("#postForm input[name='spoint']").val(spoint);
	$("#postForm input[name='yncoupon']").val(yncoupon);
	$("#postForm input[name='upoint']").val(upoint);
	$("#postForm").submit();
}

</script>

<body>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<center>
<h1>결제하기</h1></center>
<div class="rsvInfo">

<h2>${user.userId }님의 예매정보</h2>
<table border=0 class ="table1">
<tr><th width="70px" background= "#c9c9c9">가격</th><th width="100px">좌석</th><th width="700px">예매정보</th><th width="50px">인원</th></tr>
<tr><td>${price }</td>
<td>${seats }</td>
<td>${rinfo }</td>
<td>${peopleNum }</td></tr>
</table>
</div>

<div class="discount">
<table border=0 class ="table2">
<tr><th colspan=2>할인수단</th></tr>
<tr><th>포인트</th><td><input type="text" id="inputPoint"/>점 / ${user.userPoint }점 사용가능
<input type="button" id="usePoint" class="btn" value="사용" onclick="javascript:usePoint();" />
<input type="button" id="cancelPoint" class="btn" value="사용취소" onclick="javascript:cancelPoint();" /><br>

<div>
<table border=1>
<tr><td colspan=2>할인수단</td></tr>
<tr><td>포인트</td><td><input type="text" id="inputPoint"/>점 / <input type="text" id="userPoint" value="${user.userPoint }" disabled="disabled"/>점 사용가능
<input type="button" id="usePoint" value="사용" onclick="javascript:usePoint();" />
<input type="button" id="cancelPoint" value="사용취소" onclick="javascript:cancelPoint();" /><br>
포인트를 10점 단위로 입력해주세요.</td></tr>
<tr><th>쿠폰</th><td>
<%
	User user = (User)session.getAttribute("user");
	if (user.getUserCoupon().equals("y")) {
		%>
		생일쿠폰 <input type="button" id="useCoupon" value="사용" onclick="javascript:useCoupon();" />
				 <input type="button" id="cancelCoupon" value="사용취소" onclick="javascript:cancelCoupon();" />
		<%
	}
	else {
		%>
		사용 가능한 쿠폰이 없습니다.
		<%
	}
%>
</td></tr>
</table>
</div>

<div class="payment">
결제 금액		 <input type="text" id="price" value="${price }" disabled="disabled" style="text-align: right;" />원<br>
포인트 할인 금액 <input type="text" id="minusPoint" value="0" disabled="disabled" style="text-align: right;"/>원<br>
쿠폰 할인 금액   <input type="text" id="minusCoupon" value="0" disabled="disabled" style="text-align: right;"/>원<br>
-----------------------------------------<br>
총 결제금액 	 <input type="text" id="total" value="${price }" disabled="disabled" style="text-align: right;"/>원<br>
포인트적립		 <input type="text" id="savePoint" value="0" disabled="disabled" style="text-align: right;"/>점<br>
</div>

<div class="but">
<input type="button" id="toReserve" onclick="location.href='<%=request.getContextPath() %>/reserve'" value="예매 다시하기" />
<input type="button" id="complete" onclick="javascript:completeReserv()" value="예매 완료"/>
</div>
<form style="display: none;" id="postForm" method="post" action="<%=request.getContextPath()%>/reserve/complete">
	<input type="hidden" name="totalprice"/>
	<input type="hidden" name="spoint"/>
	<input type="hidden" name="yncoupon" />
	<input type="hidden" name="upoint" />
</form>

</body>
</html>
