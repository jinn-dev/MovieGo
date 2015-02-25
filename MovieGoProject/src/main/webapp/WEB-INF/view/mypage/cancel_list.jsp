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
#submenu {
	width: 30%;
	float: right;
}

#cancellist {
	width: 70%;
	float: right;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	
	<div id="cancellist">
		예매취소내역
		<table>
			<tr>
				<th>취소번호</th>
				<th>영화관</th>
				<th>영화제목</th>
				<th>상영시간</th>
				<th>취소일</th>
			</tr>
			<c:forEach items="${clist }" var="cancel">
			<tr>
				<td><c:out value="${cancel.cancelId}" /></td>
				<td><c:out value="${cancel.theaterName}" /></td>
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