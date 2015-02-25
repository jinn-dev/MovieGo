<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
.complete-table{
	margin: 0 auto;
	table-layout: fixed;
	padding: 10px;
}

.complete-table th{
	background: #4F5D73;
	color: white;
	width: 4em;
	padding: 5px;
	border: 0px;
}
.complete-table td{
	word-break:break-all;
	padding: 5px;
	border: 0px;
}
.complete-table #poster{
	width: 1em;
}

.div-button {
	background: #C75C5C;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 0.5em;
	outline: none;
}
</style>
</head>
<script>
</script>
<body>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<table class="complete-table">
<tr><td colspan="4"><img id="tasteimg" width="500" height="123" src="<%=request.getContextPath() %>/img/complete.png"/><hr></td></tr>
<tr><td colspan="2" rowspan="7" id="poster"><img src="${imgurl }"/></td>
<th>예매번호</th><td></td></tr>
<tr><th>영화</th><td>${movie }</td></tr>
<tr><th>극장</th><td>${theater }</td></tr>
<tr><th>상영시간</th><td>${movieTime }</td></tr>
<tr><th>인원</th><td>${peopleNum }</td></tr>
<tr><th>좌석</th><td>${seats }</td></tr>
<tr><th>결제금액</th><td>${price }</td></tr>
<tr><td colspan="2"></td><td colspan="3" align="center"><hr>
<input type="button" onclick="location.href='<%=request.getContextPath() %>/mainlogined'" class="div-button" value="메인페이지로" />
<input type="button" onclick="location.href='<%=request.getContextPath() %>/myrlist'" class="div-button" value="MY예매내역" />
</td></tr>
</table>



</body>
</html>
