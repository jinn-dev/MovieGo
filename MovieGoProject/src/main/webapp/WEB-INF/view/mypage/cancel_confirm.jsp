<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
	#cancelconfirm {
		width : 70%;
		float : right;
	}
	
	.div-button {
	background: #C75C5C;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 0.5em;
	outline: none;
}

</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<div id="cancelconfirm">
예매가 성공적으로 취소되었습니다.<br>
<input type="button" class="div-button" onclick="location.href='<%=request.getContextPath() %>/myclist'" value="예매취소확인" />
<input type="button" class="div-button" onclick="location.href='<%=request.getContextPath() %>/mainlogined'" value="메인페이지로" />
</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>





</body>
</html>