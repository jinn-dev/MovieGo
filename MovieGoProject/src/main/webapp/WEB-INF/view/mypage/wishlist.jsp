<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery.labelinplace.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">



function deleteCheck(id) {
	 if(confirm("위시리스트를 삭제하시겠습니까??")) {
		 location.href="<%=request.getContextPath()%>/deletewishlist?wishId="+id;
		 
		}
	}
</script>
 <style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
 	#reservationlist {
		width : 70%;
		float : right;
	} 
	.div-button {
	background: #C75C5C;
	font-size: 1.0em;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 0.5em;
	outline: none;
	margin: 30px 0 0 0;
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
		<td>
		<a href="<%=request.getContextPath()%>/movieinfo?movieCode=${movieItem.movieCode}"><c:out value="${movieItem.movieTitleKr}"/></a></td>
		<td><c:out value="${movieItem.movieDirector }"/></td>
		<td><c:out value="${movieItem.movieGenre}"/></td>
		<td>
		<c:url value="/reserve" var="url"></c:url>
		<a href="${url }" class="icon-search">예매하기</a>			
		</td>
		<td>
		<button onclick="deleteCheck(${wishListItem.wishId})"class="div-button">삭제</button>
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