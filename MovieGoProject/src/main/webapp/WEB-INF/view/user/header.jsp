<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="text/html;charset=euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath() %>/header/css/default.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/header/css/component.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/header/js/modernizr.custom.js"></script>
<title>MOVIE GO</title>
</head>
<body>

	<!--  header 시작 -->
	<div class="container">
		<div class="cbp-af-header">
			<div class="cbp-af-inner">
				<h1>
					<font color="#0e0e0e">MOVIE</font><font color="#a52127">GO</font>
				</h1>
				<nav>
					<a href="#">RESERVATION</a> 
					<a href="#">영화평가</a>
					<c:url value="/mypage" var="url" />
					<a href="${url }">MY PAGE</a>
					<c:url value="/board" var="url" />
					<a href="${url }">고객센터</a>
					<c:url value="/logout" var="url" />
					<a href="${url }"><button>LOGOUT</button></a>
					<c:out value="${log.userId}" />
				</nav>
			</div>
		</div>
	</div>
	<!-- classie.js by @desandro: https://github.com/desandro/classie -->
	<!-- 스크롤바 내릴때 header size 바뀌는 js -->
	<script src="<%=request.getContextPath() %>/header/js/classie.js"></script>
	<script src="<%=request.getContextPath() %>/header/js/cbpAnimatedHeader.js"></script> 
</body>
</html>
