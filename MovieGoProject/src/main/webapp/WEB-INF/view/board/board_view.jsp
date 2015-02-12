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
		<table border="1">
			<tr>
				<th id="title" colspan="4"><c:out
						value="${detail.boardTitle }" /></th>
			</tr>
			<tr>
				<th>작성자</th>
				<td><c:out value="${detail.userId}" /></td>
				<th>작성일자</th>
				<fmt:formatDate value="${detail.boardDate}" type="date" var="date" />
				<td><c:out value="${date}" /></td>
			</tr>
			<tr>
				<td colspan="4"><c:out value="${detail.boardContent }" /></td>
			</tr>
				<tr>
					<td colspan="4">
						<c:if test="${detail.userId==log.userId }">
							<c:url value="/board/modify?boardId=${detail.boardId }" var="url"></c:url>
							<a href="${url }"><button>수정</button></a>
							<button>삭제</button>
						</c:if>
					</td>
				</tr>
				<tr>
		</table>
		</div>
		<div class="comment-table">
		<table border="1">
			<tr>
				<td colspan="5">COMMENT</td>

			</tr>
			<c:if test="${detail.comments.size()!=0 }">
				<c:forEach items="${detail.comments }" var="comments">
				<tr>
					<td><c:out value="${comments.commentId }" /></td>
					<td><c:out value="${comments.userId }" /></td>
					<fmt:formatDate value="${comments.commentDate }" type="both" var="date"/>		
					<td colspan="3"><c:out value="${date }" /></td>
				</tr>
				<tr>
					<td colspan="5"><c:out value="${comments.commentContent }" /></td>
				</tr>
				</c:forEach>
			</c:if>
		</table><br>

			<div class="comment-form">
				<c:url value="/comment/write" var="url"></c:url>
				<form:form method="post" modelAttribute="comment" action="${url }">
					<div class="comment-form-inner">
						<input type="hidden" name="boardId" value="${content.boardId }" />
						<input type="hidden" name="userId" value="${log.userId }" />
						<c:out value="${log.userId }"></c:out>
						<label>코멘트 쓰기</label><input type="text" name="commentContent" />
						<button type="submit">등록</button>
					</div>
				</form:form>
			</div>
		</div>
	</section>
</body>
</html>
