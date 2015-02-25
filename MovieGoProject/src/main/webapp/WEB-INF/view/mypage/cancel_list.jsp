<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
.cancellist table {
	margin: 0 auto;
	width: 1000px;
	table-layout: fixed;
	border: 1px;
	text-align: center;
}

.cancellist-table th {
	background: #4F5D73;
	color: white;
	text-align: center;
	width: 55px;
	padding: 0.25em;
}

.cancellist-table tr:nth-child(even){
	background: #F2F2F2;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	
	<div class="cancellist">
		<table class="cancellist-table">
			<tr><td colspan="4"><img id="tasteimg" width="350" height="130" src="<%=request.getContextPath() %>/img/cancel_list.png"/></td></tr>
			<tr>
				<th>영화관</th>
				<th>영화제목</th>
				<th>상영시간</th>
				<th>취소일</th>
			</tr>
			<c:forEach items="${clist }" var="cancel">
			<tr>
				<td><c:out value="${cancel.theaterName}점" /></td>
				<td><c:out value="${cancel.movieName}" /></td>
				<td><c:out value="${cancel.movieTime}" /></td>
				<td><c:out value="${cancel.cancelDate}" /></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
	</div>
</body>
</html>