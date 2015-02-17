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

 <style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
 	#reservationlist {
		width : 70%;
		float : right;
	} 
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	
<div id="reservationlist">
위시리스트


<table border="1">
	<tr>
		<th>영화제목</th><th>감독</th><th>장르</th><th>예매하기</th>
	</tr>
	<c:forEach items="${wishlist}" var="wishListItem">
	<c:set value="${wishListItem.movies}" var="movie">	</c:set>
		<c:forEach items="${movie}" var="movieItem">
		<tr>
		<td><c:out value="${movieItem.movieTitleKr}"/></td>
		<td><c:out value="${movieItem.movieDirector }"/></td>
		<td><c:out value="${movieItem.movieGenre}"/></td>
		<td>
			예매하기
		</td>
		</tr>
		</c:forEach>
	</c:forEach>		
	
</table>

</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>
</body>
</html>