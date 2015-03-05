<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/bootstrap/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/bootstrap/bootstrap-theme.css">
<!-- Custom CSS -->
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery-2.1.3.js"></script>
<style type="text/css">
.no {
	width: 70px;
}

.title {
	width: 800px;
}

.writer {
	width: 200px;
}

.regdate {
	width: 200px;
}

.table th {
	background: #4F5D73;
	color: white;
	text-align: center;
	padding: 0.25em;
	font-size: 1.25em;
}

.div-button {
	background: #C75C5C;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 0.5em;
	outline: none;
}

.div-button:hover {
	background: #4F5D73;
	color: #F2F2F2;
}
</style>
<script>
</script>
<title>MOVIE GO</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<div class="container">
		<header>
		<center><img width="500" src="<%=request.getContextPath()%>/img/qna.png" /></center>
		</header>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-responsive">
					<tr><td colspan="4"><div class="pull-right"><c:url value="/board/write" var="url"/>
					<a href="${url }"><button class="div-button btn btn-primary">글쓰기</button></a>
					</div></td></tr>
					<tr><th class="no">NO</th><th class="title">TITLE</th><th class="writer">WRITER</th><th class="regdate">REG DATE</th></tr>
					<c:forEach items="${list }" var="list" varStatus="status">
						<c:url value="/board/read" var="url"/>
						<tr><td class="no"><c:out value="${list.boardId }"/></td>
							<td class="title"><a href="${url}?boardId=${list.boardId}"><c:out value="${list.boardTitle }"/></a></td>
							<td class="writer">${list.userId }</td>
							<fmt:formatDate value="${list.boardDate }" type="date" var="date"/>
							<td class="regdate"><c:out value="${date }"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>