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
.reserve-wrap{
	width: 40%;
	min-width: 500px;
	border-radius: 4px;
	background: rgba(30, 30, 30, 0.1);
	padding: 20px;
	margin: 0 auto;

}
/* 
table:first-child{
background: rgba(201, 00, 00, 0.1);
} */

.reserv-table {
	margin: 0 auto;
	table-layout: fixed;
	padding: 10px;
}

.reserv-table th {
	background: #4F5D73;
	color: white;
	width: 4em;
	padding: 5px;
	border: 0px;
}

.reserv-table td {
	word-break: break-all;
	padding: 5px;
	border: 0px;
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
<script type="text/javascript">
 	var id;
	$(document).ready(function() {
		if ($("#cancel").val() == "n") {
			$(":button").hide();
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
	<center><img width="350" src="<%=request.getContextPath() %>/img/myreserve.png"/></center>
		<c:forEach items="${rlist }" var="reservation" varStatus="status">
		<div class="reserve-wrap">
	<table class="reserv-table">
		<tr><td colspan="6">No.${status.index+1 }<hr></td></tr>
		<tr><td colspan="2" rowspan="7"><div id="img"></div></td></tr>
		<tr><th>영화</th><td><c:out value="${reservation.movieName }"/></td>
		<th>예매번호</th><td id="rid"><c:out value="${reservation.reservationId }" /></td></tr>
		<tr><th>상영시간</th><td><c:out value="${reservation.movieTime }"/></td>
		<th>영화관</th><td><c:out value="${reservation.theaterName }"/></td></tr>
		<tr><th>예매일</th><td><c:out value="${reservation.reservationDate }"/></td><th>결제금액</th><td><c:out value="${reservation.reservationPrice }"/></td></tr>
		<tr><td colspan="5" align="right"><hr><input type="hidden" id="cancel" value="${reservation.cancel }" />
		<input type="button" onclick="javascript:deleteRsv(${reservation.reservationId });" value="예매취소" class="div-button"/></td></tr>
		</table>
		</div>		
		<c:if test="${status.index+1/2==0 }">
		<br>
		</c:if>
		
		</c:forEach>
		
	<form style="display: none;" id="postForm" method="post" action="<%=request.getContextPath()%>/cancelConfirm">
	<input type="hidden" name="rid"/>
	</form>
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
	</div>


</body>
</html>
