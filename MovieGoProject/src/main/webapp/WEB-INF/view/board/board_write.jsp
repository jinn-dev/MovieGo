<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
<title>고객센터</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp"" />
	<header>
		<h3>1:1문의</h3>
		<h5>
			- 문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.<br> - 1:1 문의 운영 시간
			(09:00 ~ 20:00)
		</h5>
	</header>

	<section>
	<c:url value="/board/submit" var="url"/>
	<div id="writeform">
	<form:form method="POST" action="${url }" modelAttribute="board">
	<input type="hidden" name="userId" value="${log.userId }"/><br>
	<label>제목 </label><input type="text" name="boardTitle" id="boardTitle" value="제목을 입력해주세요."/><br>
	<label>내용 </label><textarea rows="5" cols="80" name="boardContent" id="boardContent"></textarea><br>
	<button type="submit" name="proceed">완료</button>
	<input type="reset"/>
	</form:form>
	</div>
	</section>
	
</body>
</html>
