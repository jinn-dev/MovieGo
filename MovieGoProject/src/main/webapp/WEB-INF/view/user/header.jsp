<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.mvg.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap-theme.css">
<!-- Custom CSS -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap/bootstrap.js"></script>
<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');

* {
	font-family: '나눔고딕';
}

a {
	color: #4F5D73;
	text-decoration: none;
}

a:hover {
	color: #C75C5C;
}

body {
	padding-bottom: 70px;
}

.container {
	margin-top: 10em;
}

.align {
	text-align: center;
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
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <c:url value="/main.do" var="url"/>
      <a class="navbar-brand" href="${url }"><font color="#4F5D73"><b>MOVIE</b></font><font color="#C75C5C"><b>GO</b></font></a>
    </div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<c:url value="/reserve" var="url" />
					<li><a href="${url }">영화 예매 <span class="sr-only">(current)</span></a></li>
					<c:url value="/rating" var="url" />
					<li><a href="${url }">영화 평가하기</a></li>
					<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">MY PAGE<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:url value="/mypage" var="url"></c:url>
							<li role="presentation"><a href="${url }">영화취향분석</a></li>
							<c:url value="/modify" var="url"></c:url>
							<li role="presentation"><a href="${url }">개인정보수정</a></li>
							<c:url value="/myrlist" var="url"></c:url>
							<li role="presentation"><a href="${url }">MY 예매내역</a></li>
							<c:url value="/myclist" var="url"></c:url>
							<li role="presentation"><a href="${url }">예매취소내역</a></li>
							<li class="divider"></li>
							<c:url value="/wishlist" var="url"></c:url>
							<li role="presentation"><a href="${url }?userId=${log.userId }">위시리스트</a></li>
							<c:url value="/ratinglist" var="url"></c:url>
							<li role="presentation"><a href="${url }?userId=${log.userId }">영화평가목록</a></li>
						</ul> 
					<c:url value="/board" var="url" />
					<li><a href="${url }">고객센터</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				
				
				<%
					User user = (User)session.getAttribute("user");
					String userId = user.getUserId();
					if(userId.equals("admin")) {
					
					%>

					<c:url value="/admin" var="url" />
					<li><a href="${url }">관리자</a></li>
					<%
					}
					else {
						%>
						<c:url value="/logout" var="url" />
						<li><a href="#"><img id="headerimg" width="25px" src="<%=request.getContextPath() %>/img/Roundicons-16.png"/>&nbsp;&nbsp;&nbsp;
						<c:out value="${user.userId}"/>님 반갑습니다.</a></li>
						<li><a href="${url }"><b>LOGOUT</b></a></li>
						
						<%
					}
						%> 
						
						</ul>
					</div>
		</div>
</nav>


