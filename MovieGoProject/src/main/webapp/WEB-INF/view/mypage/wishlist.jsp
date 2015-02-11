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
	#reservationlist {
		width : 70%;
		float : right;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp"" />
<div id="reservationlist">
위시리스트
<table>
<tr>
<th>영화제목</th><th>감독</th><th>개봉일자</th><th>장르</th><th>예매하기</th>
</tr>
<tr>
<td>쏘우</td>
<td>이수연</td>
<td>2015-05-01</td>
<td>공포</td>
<td><a href="reservation1.jsp">예매하기</a></td>
</tr>
</table>
</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>

</body>
</html>