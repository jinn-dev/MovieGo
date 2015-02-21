<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
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
	<table class="writeform">
	<form:form modelAttribute="content" method="POST" action="${url }">
	<input type="hidden" name="userId" value="${log.userId }"/>
	<tr><td><label>제목 </label><form:input type="text" path="boardTitle"/></td></tr>
	<tr><td><label>　　 </label><form:textarea row="30" col="50" path="boardContent"/></td></tr>
	<tr><td align="center"><button type="submit" name="_event_confirmed" class="div-button">완료</button>
	<input type="reset" class="div-button"/></td></tr>
	</form:form>
	</table>
	</section>
</body>
</html>