<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap-theme.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.core.css"  />
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.default.css" id="toggleCSS" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath ()%>/alert/js/alertify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap/bootstrap.js"></script>
<style type="text/css">
#boardContent {
	height: 500px;
}

.div-button {
	background: #C75C5C;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 1.0em;
	font-size: 1.0em;
	outline: none;
}

.div-button:hover {
	background: #4F5D73;
	color: #F2F2F2;
}
</style>
<script>
	$(document).ready(function() {
		$("#write_submit").click(function() {
			if ($("#boardTitle").val() == "") {
				 alertify.alert("제목을 입력해주세요.");
				event.preventDefault();
			}

			else if ($("#boardContent").val() == "") {
				 alertify.alert("내용을 입력해주세요.");
				event.preventDefault();
			}
		});

	});
</script>
<title>MOVIE GO</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<div class="container">
		<center>
			<img width="500" src="<%=request.getContextPath()%>/img/qna.png" />
		</center>
				<table class="table write_table">
					<tr>
						<c:url value="/board/submit" var="url" />
						<form:form method="POST" action="${url }" modelAttribute="board">
							<td><input type="hidden" name="userId" value="${log.userId }" /><br> 
							<div class="input-group input-group-lg">
  								<span class="input-group-addon">제목</span>
  								<input type="text" class="form-control input-lg" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요." />
							</div></td>
							<tr><td>
							<div class="input-group input-group-lg">
  								<span class="input-group-addon">내용</span>
  								<textarea name="boardContent" class="form-control input-lg" id="boardContent" placeholder="내용을 입력해주세요."></textarea>
							</div></td>
							</tr>
							<tr>
								<td>
								<div class="pull-right">
									<button class="div-button btn btn-primary" type="submit" id="write_submit"
										name="_event_confirmed">SUBMIT</button> <input
									class="div-button btn btn-primary" type="reset" value="RESET" />
									</div>
								</td>
						</form:form>
					</tr>
				</table>
	</div>
</body>
</html>
