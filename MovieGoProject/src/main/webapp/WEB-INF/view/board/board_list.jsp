<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board.css" />
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
		<h5>- 문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.<br>
		- 1:1 문의 운영 시간 (09:00 ~ 20:00) </h5>
		<c:url value="/board/write" var="url" />
		<a href="${url }"><button>WRITE</button></a>
	</header>
	<table>
		<tr >
			<th>
				<div>
					<b>글번호</b>
				</div>
			</th>
			<th width="318">
				<div>
					<b>제목</b>
				</div>
			</th>
			<th width="110">
				<div>
					<b>작성자</b>
				</div>
			</th>
			<th width="119">
				<div>
					<b>등록일</b>
				</div>
			</th>
		</tr>
		<c:forEach items="${lists }" var="list">
		<tr>
			<td width="55"><c:out value="${list.boardId}"/></td>
			<td align=left width="318"><a href="#" target=_self><c:out value="${list.boardTitle}"/></a></td>
			<td width="110"><c:out value="${list.userId}"/></td>
			<fmt:formatDate value="${list.boardDate}" type="date" var="date"/>			
			<td width="119"><c:out value="${date}"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>