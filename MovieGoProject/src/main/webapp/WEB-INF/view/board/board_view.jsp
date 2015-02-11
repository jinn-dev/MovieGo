<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board.css" /> --%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
</script>
<title>고객센터</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<header>
		<h3>1:1문의</h3>
		<h5>
			- 문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.<br> - 1:1 문의 운영 시간
			(09:00 ~ 20:00)
		</h5>
	</header>
	<section>
		<table border="1">
			<tr>
				<td id="title" colspan="4">
				<c:out value="${content.boardTitle }"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><c:out value="${content.userId}"/></td>
				<td>작성일자</td>
				<fmt:formatDate value="${content.boardDate}" type="date" var="date"/>	
				<td><c:out value="${date}"/></td>
			</tr>
			<tr>
				<td colspan="4"><c:out value="${boardContent }"/></td>
			</tr>
			<tr>
		</table>
	</section>
</body>
</html>