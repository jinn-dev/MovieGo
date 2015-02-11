<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	 <c:out value="${log.userId}"/>님 반갑습니다.<br> 

	<!--  header 시작 -->
	<div class="container">
		<div class="cbp-af-header">
			<div class="cbp-af-inner">
				<h1><font color="#0e0e0e">MOVIE</font><font color="#a52127">GO</font></h1>
				<nav>
					<a href="#">RESERVATION</a> 
					<a href="#">영화평가</a>
					<a href="#">MY PAGE</a>
					<a href="#">고객센터</a>
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