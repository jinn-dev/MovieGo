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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script>
$(document).ready(function() {
	$("#board_delete").click(function(){
		var result = window.confirm("글을 삭제하시겠습니까?")
		if(result){
			<c:url value="/board/delete" var="url"></c:url>
			location.href="${url}?boardId=${detail.boardId }";
		}
	});
	
	$("#comment_submit").click(function(){
		if($("#commentContentInput").val()==""){
			alert("코멘트 내용을 입력해주세요.");
			event.preventDefault();
		}
	});
	$("#comment_delete").click(function(){
		var result = window.confirm("코멘트를 삭제하시겠습니까?");
		if(result){
			<c:url value="/comment/drop" var="url"></c:url>
			location.href="${url}?commentId="+$("#comment_id").val();
		}
	});   
	
	$(".content").click(function(){
		var commentId = $("#id1").val();
		var userId = $("#id2").val();
		if(commentId ==  userId){
			$(".content").attr("readonly",false);
		}
		else{
			return false;
		}
	})
	$("#comment_modify").click(function(){
		var result = window.confirm("코멘트를 수정하시겠습니까?");
		if(result){
			$("#commentForm").submit();
		}
	});
});
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
						<button class="div-button" id="board_delete">DELETE</button>
					</c:if>
					<c:url value="/board/list.do" var="url"></c:url>
					<a href="${url }"><button class="div-button">LIST</button></a>
				</td>
				</tr>
				<tr>
		</table><p><p>
	</div>
		<div class="comment-table">
		<table width="602">
			<tr>
				<th colspan="5">COMMENT</th>
			</tr>
			<tr>
			<td colspan="5" align="center">*댓글을 수정하려면 글을 클릭하세요.</td>
			</tr>
		  	<tr>
		    <c:if test="${detail.comments[0].commentId!=0 }">
				<c:forEach items="${detail.comments }" var="comments">
				<c:url value="/comment/modify" var="url"/>
					<form:form method="POST" modelAttribute="comment" id="commentForm" action="${url }">
					<td>
					<c:out value="${comments.userId }" />
					<input type="hidden" id="id1" value="${comments.userId }"/>
					</td>
					<fmt:formatDate value="${comments.commentDate }" type="date" var="date"/>		
					<td align="left" colspan="2">
					<c:out value="${date }" />
					</td>
					<c:if test="${comments.userId==log.userId }">
						<td colspan="2" align="right">
						<input type="hidden" name="commentId" id="comment_id" value="${comments.commentId }"/>
						<input type="hidden" name="boardId" value="${detail.boardId }" />
						<input type="submit" class="div-button" id="comment_modify" value="MODIFY">
						<c:url value="/comment/drop" var="url"></c:url>
						<input type="button" class="div-button" id="comment_delete" value="DELETE">
						</td>
					</c:if>
					<tr>
					<td colspan="5" align="left" height="25">
					<input type="text" name="commentContent" class="content" value="${comments.commentContent }" style='border: 0px; font-size:1.0em;'
					 readonly/>
					</td>
					</tr>
					</form:form>
				</c:forEach>
			</c:if>
			</tr>  
			<tr>
					<td colspan="5">
					<div class="comment-form">		
					<c:url value="/comment/write" var="url"></c:url>
						<form:form method="post" modelAttribute="comment" action="${url }" name="comment-form">
							<div class="comment-form-inner">
								<input type="text" name="commentContent" id="commentContentInput"/>
								<input type="hidden" name="boardId" value="${detail.boardId }" />
								<input type="hidden" name="userId" id="id2" value="${log.userId }" />&nbsp;&nbsp;
								<input type="submit" class="div-button"  id="comment_submit" value="SUBMIT"/>
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
