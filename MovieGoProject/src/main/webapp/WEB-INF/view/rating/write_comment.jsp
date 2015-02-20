<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코멘트쓰기</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* input 박스에 기본값 넣어주고 마우스 클릭시 초기화 */ 
	$(document).ready(function() {
		$("#evComment").focus(function() {
			$(this).val('');
		}).blur(function() {
			if ($(this).val() == "") {
				$(this).val("");
			}
		});
		
		$("#add").click(function() {
		alert("추가");
		});
	});
</script>
<body>
${evRating.evId }
${evRating.movieCode}
코멘트
<c:url value="/addcomment" var="action"></c:url>
<form:form modelAttribute="addComment" method="post" action="${action }">
<input type="hidden" id="movieCode" value="${evRating.movieCode}"/>
<input type="hidden" id="userId" value="${evRating.userId}"/>
<input type="hidden" id="evRating" value="${evRating.evRating }"/>
<input type="hidden" id="evId" value="${evRating.evId }"/>
<input type="text" id="evComment" name="evComment" value="코멘트를 입력하세요. ">
<input type="submit" value="입력" id="add"/>
</form:form>
</body>
</html>