<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<c:url value="/board/modified" var="url"/>
	<div id="writeform">
	<form:form modelAttribute="content" method="POST" action="${url }">
	<input type="hidden" name="userId" value="${log.userId }"/><br>
	<label>제목 </label><form:input type="text" path="boardTitle"/><br>
	<label>내용 </label><form:textarea row="30" col="50" path="boardContent"/>
	<button type="submit" name="_event_confirmed">완료</button>
	<input type="reset"/>
	</form:form>
	</div>
	</section>
</body>
</html>