<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <script type="text/javascript">
 function deleteCheck() {
	 if(confirm("정말 삭제하시겠어요?")) {
		 location.href="cancel_confirm.jsp";
	 }
	 
 }
</script>
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
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<div id="reservationlist">
<table>
<tr>
<th>예매번호</th><th>영화관</th><th>영화제목</th><th>예매일</th><th>상영시간</th><th>결제금액</th><th>예매취소</th>
</tr>
<tr>
<td>100000</td>
<td>왕십리</td>
<td>쏘우</td>
<td>2015-05-01</td>
<td>2015-04-01</td>
<td>10000</td>
<td><input type="button" onclick="deleteCheck();" value="취소"></td>
</tr>
</table>
</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>


</body>
</html>