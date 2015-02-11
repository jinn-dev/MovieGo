<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/css/location.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<div class="main">
		<div id="video">동영상 넣기</div>
		<div id="box">
		<div id="rating1">무비고 사이트내 영화 인기순위</div>
		<div id="rating2">전날 박스 오피스 순위</div>
		</div>
	</div>
</body>
</html>
