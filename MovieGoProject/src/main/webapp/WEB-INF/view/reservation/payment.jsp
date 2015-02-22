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
/*  포인트는 사용가능한 범위로 입력해주세요 라는 창 뜨기
 */	
 location.href="reservation_complete.jsp"       	    
}

function re_seledVal(){
	/*  포인트는 사용가능한 범위로 입력해주세요 라는 창 뜨기
	 */	
	 location.href="reservation1.jsp"       	    
	}
</script>

<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<h1>결제하기</h1>
포인트: ${user.userPoint }
<div id="rsvInfo">
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
<tr><td>포인트</td><td><input type="text" id="point"/>점 / [포인트얻어오기]점 사용가능</td></tr>
<tr><td>쿠폰</td><td><input type="checkbox" id="coupon" value="생일쿠폰"/></td></tr>
</table>
</div>

<div id="payment">
결제금액 <input type="text" id="price" value="[seat에서넘어온가격]"/>원<br>
할인 <input type="text" id="minus" value="[포인트+쿠폰]"/>원<br>
-------------------------------<br>
총 결제금액 <input type="text" id="total" value="[price-minus]"/>원<br>
포인트적립 <input type="text" id="addPoint" value="[total*0.1]"/>원<br>
</div>

<div class="reset" onclick="location.href='<%=request.getContextPath() %>/reserve'">예매 다시하기</div>
<div class="complete">결제 완료</div>
</body>
</html>