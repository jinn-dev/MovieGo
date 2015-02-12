<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
</script>
<title>고객센터</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<header>
		<h3>1:1문의</h3>
		<h5>
			- 문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.<br> - 1:1 문의 운영 시간
			(09:00 ~ 20:00)
		</h5>
	</header>
	<section>
		<div class="view-table">
		<table width="602">
			<tr>
				<th id="title" colspan="4"><c:out
						value="${detail.boardTitle }" /></th>
			</tr>
			<tr>
				<th>작성자</th>
				<td><c:out value="${detail.userId}" /></td>
				<th>작성일자</th>
				<fmt:formatDate value="${detail.boardDate}" type="date" var="date" />
				<td align="left"><c:out value="${date}" /></td>
			</tr>
			<tr>
				<td colspan="4" align="left" height="300"><c:out value="${detail.boardContent }" /></td>
			</tr>
				<tr>
				<td colspan="4" align="right">
					<c:if test="${detail.userId==log.userId }">
						<c:url value="/board/modify?boardId=${detail.boardId }" var="url"></c:url>
						<a href="${url }"><button class="div-button">MODIFY</button></a>
						<c:url value="/board/delete?boardId=${detail.boardId }" var="url"></c:url>
						<a href="${url }"><button class="div-button">DELETE</button></a>
					</c:if>
					<c:url value="/board" var="url"></c:url>
					<a href="${url }"><button class="div-button">LIST</button></a>
				</td>
				</tr>
				<tr>
		</table><p><p>
		</div>
		<div class="comment-table">
		<table width="602" border="1">
			<tr>
				<th colspan="5">COMMENT</th>

			</tr>
			<c:if test="${detail.comments[0].commentId!=0 }">
				<c:forEach items="${detail.comments }" var="comments">
				<tr>
					<td><c:out value="${comments.userId }" /></td>
					<fmt:formatDate value="${comments.commentDate }" type="date" var="date"/>		
					<td align="left" colspan="3"><c:out value="${date }" />
					</td>
					<td>
						<c:if test="${comments.userId==log.userId }">
						<button class="div-button">MODIFY</button>&nbsp;
						<c:url value="/comment/delete?commentId=${comments.commentId }" var="url"></c:url>
						<a href="${url }"><button class="div-button">DELETE</button></a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="left" height="25"><c:out value="${comments.commentContent }" /></td>
				</tr>
				</c:forEach>
			</c:if>
			<tr>
					<td colspan="5">
					<div class="comment-form">		
					<c:url value="/comment/write" var="url"></c:url>
						<form:form method="post" modelAttribute="comment" action="${url }">
							<div class="comment-form-inner">
								<input type="hidden" name="boardId" value="${detail.boardId }" />
								<input type="hidden" name="userId" value="${log.userId }" />
								<input type="text" name="commentContent"/>
								<button class="div-button" type="submit">SUBMIT</button>
							</div>
						</form:form>
					</div>
					</td>
				</tr>
		</table><br>
		</div>
	</section>
</body>
</html>
