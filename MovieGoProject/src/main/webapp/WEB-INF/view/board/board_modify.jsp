<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap-theme.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.core.css"  />
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.default.css" id="toggleCSS" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath ()%>/alert/js/alertify.min.js"></script>
<style type="text/css">
#boardContent {
	height: 500px;
}
</style>
<title>MOVIE GO</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<div class="container">
		<header>
			<div class="align"><img width="500" src="<%=request.getContextPath()%>/img/qna.png" /></div>
		</header>
		<c:url value="/board/modified" var="url" />
		<table class="table">
			<form:form modelAttribute="content" method="POST" action="${url }">
				<input type="hidden" name="userId" value="${log.userId }" />
				<tr><td>
				<div class="input-group input-group-lg">
 					 <span class="input-group-addon">제목</span>
 					 <form:input type="text" class="form-control input-lg"  path="boardTitle" />
				</div></td></tr>
				<tr><td>
				<div class="input-group input-group-lg">
  					<span class="input-group-addon">내용</span>
  					<form:textarea class="form-control input-lg" id="boardContent" path="boardContent" />
				</div></td></tr>
				<tr><td><div class="pull-right">
				<button type="submit" name="_event_confirmed" class="div-button btn btn-primary">완료</button> 
				<input type="reset" class="div-button btn btn-primary"/></div></td>
				</tr>
			</form:form>
		</table>
	</div>
</body>
</html>