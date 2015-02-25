<%@page import="com.mvg.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<style type="text/css">
#submenu {
	width: 30%;
	float: right;
}

#reservationlist {
	width: 70%;
	float: right;
}
</style>
</head>
<script type="text/javascript">
 	var id;
	$(document).ready(function() {
		if ($("#cancel").val() == "n") {
			//$(":button").hide();
		}
	});
	
	function deleteRsv(id) {
		var answer = confirm("예매를 취소하시겠습니까?");
	    if (answer == true) {
	        $("#postForm input[name='rid']").val(id);
	        $("#postForm").submit();
	    }
	} 
</script>

<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	
	<div id="reservationlist">
		<table>
			<tr>
				<th>예매번호</th>
				<th>영화관</th>
				<th>영화제목</th>
				<th>예매일</th>
				<th>상영시간</th>
				<th>좌석</th>
				<th>결제금액</th>
				<th>예매취소</th>
			</tr>
			<c:forEach items="${rlist }" var="reservation">
			<tr>
				<td><c:out value="${reservation.reservationId }" /></td>
				<td><c:out value="${reservation.theaterName }"/></td>
				<td><c:out value="${reservation.movieName }"/></td>
				<td><c:out value="${reservation.reservationDate }"/></td>
				<td><c:out value="${reservation.movieTime }"/></td>
				<td><c:out value="${seats }" /></td>
				<td><c:out value="${reservation.reservationPrice }"/></td>
				<td><input type="hidden" id="cancel" value="${reservation.cancel }" />
					<input type="button" onclick="javascript:deleteRsv(${reservation.reservationId });" value="취소" /></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<form style="display: none;" id="postForm" method="post" action="<%=request.getContextPath()%>/cancelConfirm">
	<input type="hidden" name="rid"/>
	</form>
	
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
	</div>


</body>
</html>