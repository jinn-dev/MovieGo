<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

영화정보페이지<br>
<table border = 1>
<tr>
	<td>제목</td>
	<td><c:out value="${movieinfo.movieTitleKr }"/></td>
</tr>
<tr>
	<td>평균별점</td>
	<td><c:out value="${avgRating }"/></td>
</tr>
<tr>
	<td>장르</td>
	<td><c:out value="${movieinfo.movieGenre }"/></td>
</tr>
<tr>
	<td>감독</td>
	<td><c:out value="${movieinfo.movieDirector }"/></td>
</tr>
<tr>
	<td>배우1</td>
	<td><c:out value="${movieinfo.movieActor1 }"/></td>
</tr>
<tr>
	<td>배우2</td>
	<td><c:out value="${movieinfo.movieActor2 }"/></td>
</tr>
<tr>
	<td>배우3</td>
	<td><c:out value="${movieinfo.movieActor3 }"/></td>
</tr>
<tr>
	<td>줄거리</td>
	<td><c:out value="${movieinfo.movieStory }"/></td>
</tr>
<c:forEach items="${evlist}" var="evlist">
<tr>
	<td>코멘트</td>
	<td><c:out value="${evlist.evComment }"/></td>
</tr>
<tr>
	<td>코멘트</td>
	<td><c:out value="${evlist.evRating }"/></td>
</tr>
</c:forEach>
</table>


</body>
</html>