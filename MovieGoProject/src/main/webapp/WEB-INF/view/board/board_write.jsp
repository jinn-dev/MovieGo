<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script>
	$(document).ready(function() {
		$("#write_submit").click(function() {
			if ($("#boardTitle").val() == "") {
				alert("제목을 입력해주세요.");
				event.preventDefault();
			}

			else if ($("#boardContent").val() == "") {
				alert("내용을 입력해주세요.");
				event.preventDefault();
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
			<table class="write-table">
				<tr>
					<c:url value="/board/submit" var="url" />
					<form:form method="POST" action="${url }" modelAttribute="board">
						<td align="left"><input type="hidden" name="userId"
							value="${log.userId }" /><br> <input type="text"
							name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요." /><br>
						</td>
						<tr>
							<td><textarea rows="5" cols="80" name="boardContent"
									id="boardContent"></textarea><br></td>
						</tr>
						<tr>
							<td>
								<button class="div-button" type="submit" id="write_submit"
									name="_event_confirmed">SUBMIT</button> <input
								class="div-button" type="reset" value="RESET" />
							</td>
					</form:form>
				</tr>
			</table>
	</section>

</body>
</html>
