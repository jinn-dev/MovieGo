<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
	#cancellist {
		width : 70%;
		float : right;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<div id="cancellist">
예매취소내역
<table>
<tr>
<th>영화관</th><th>영화제목</th><th>상영시간</th><th>취소일</th><th>결제취소금액</th>
</tr>
<tr>
<td>
왕십리</td>
<td>쏘우</td>
<td>2015-05-01</td>
<td>2015-04-01</td>
<td>10000</td>
</tr>
</table>
</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>
</body>
</html>