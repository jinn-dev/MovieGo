<%@page import="com.mvg.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<script type="text/javascript">
function chk_seledVal(){
 //ajax keyup으로입력될때마다옆에메시지표시할것       	    
}

function check() {
    document.getElementById("myCheck").checked = true;
    //만약체크되어있으면 ajax처리
    //할인금액에 쿠폰이나포인트적용할것.
}
</script>

<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<h1>결제하기</h1>
<div id="rsvInfo">
<h2>${user.userId }님의 예매정보</h2>
<table border=1>
<tr><td>가격</td><td>${price }</td></tr>
<tr><td>좌석</td><td>${seats }</td></tr>
<tr><td>예매정보</td><td>${rinfo }</td></tr>
<tr><td>인원</td><td>${peopleNum }</td></tr>
</table>
</div>
<div>
<table border=1>
<tr><td colspan=2>할인수단</td></tr>
<tr><td>포인트</td><td><input type="text" id="point"/>점 / ${user.userId }점 사용가능</td></tr>
<tr><td>쿠폰</td><td>
<%
	User user = (User)session.getAttribute("user");
	if (user.getUserCoupon().equals('y')) {
		%>
		<input type="checkbox" name="coupon" id="coupon" value="사용하기"/>
		<%
	}
	else {
		%>
		<input type="checkbox" name="coupon" id="coupon" value="사용하기" disabled="disabled"/>
		<%
	}

%>
</td></tr>
</table>
</div>

<div id="payment">
결제금액 <input type="text" name="price" value="${price }" disabled="disabled"/>원<br>
할인금액 <input type="text" name="minus" value="0"/>원<br>
-------------------------------<br>
총 결제금액 <input type="text" id="total" value="[price-minus]"/>원<br>
포인트적립 <input type="text" id="addPoint" value="[total*0.1]"/>원<br>
</div>

<div class="reset" onclick="location.href='<%=request.getContextPath() %>/reserve'">예매 다시하기</div>
<div class="complete">결제 완료</div>
</body>
</html>