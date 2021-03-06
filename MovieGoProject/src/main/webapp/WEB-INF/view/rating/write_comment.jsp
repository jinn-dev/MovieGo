<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.mvg.entity.Evaluation" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>코멘트쓰기</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.core.css"  />
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.default.css" id="toggleCSS" />
<script src="<%=request.getContextPath ()%>/alert/js/alertify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/writecomment.css"/>
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
		self.close();
		opener.location.reload();

		});
	});
</script>

<body>
<div class="content">
사용자 아이디 : ${user.userId }<br>
코멘트 날길 영화제목 : ${onemovie.movieTitleKr}<br>
영화의 별점 : ${evRating.evRating }<br>

</div>

<c:url value="/addevcomment" var="action"></c:url>
<form:form modelAttribute="ecomment" method="post" action="${action }">
<div class="comment">
<input type="hidden" name="movieCode" value="${evRating.movieCode}"/>
<input type="hidden" name="userId" value="${evRating.userId}"/>
<input type="hidden" name="evRating" value="${evRating.evRating }"/>
<input type="hidden" name="evId" value="${evRating.evId }"/>
<textarea id="evComment" cols = "50" rows="4" name="evComment" placeholder="코멘트를 입력하세요. ."></textarea>
<input type="submit" name="_event_confirmed" value="입력" id="add"/>
</div>

</form:form>

</body>
</html>