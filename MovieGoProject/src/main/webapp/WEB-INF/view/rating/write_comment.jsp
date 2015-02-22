<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.mvg.entity.Evaluation" %>
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
		alert("코멘트가 추가되었습니다.");
		});
	});
</script>
<body>
사용자 아이디 : ${evRating.userId }<br>
코멘트 날길 영화제목 : ${onemovie.movieTitleKr}<br>
영화의 별점 : ${evRating.evRating }<br>

코멘트 남기기<br>
<c:url value="/addevcomment" var="action"></c:url>
<form:form modelAttribute="ecomment" method="post" action="${action }">
<input type="hidden" name="movieCode" value="${evRating.movieCode}"/>
<input type="hidden" name="userId" value="${evRating.userId}"/>
<input type="hidden" name="evRating" value="${evRating.evRating }"/>
<input type="hidden" name="evId" value="${evRating.evId }"/>
<input type="text" id="evComment" size = 100 name="evComment" value="코멘트를 입력하세요. ">
<input type="submit" name="_event_confirmed" value="입력" id="add"/>
</form:form>
</body>
</html>