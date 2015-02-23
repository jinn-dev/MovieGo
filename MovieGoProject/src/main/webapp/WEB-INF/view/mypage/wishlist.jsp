<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery.labelinplace.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/wishlist.css" />
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


</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	
   <div class="list-table">
위시리스트


<table id="list">
	<tr>
		<th><div>영화제목</div></th><th><div>감독</div></th><th><div>장르</div></th><th><div>예매하기</div></th>
	</tr>
	<c:forEach items="${wishlist}" var="wishListItem">
	<c:set value="${wishListItem.movies}" var="movie">	</c:set>
		<c:forEach items="${movie}" var="movieItem">
		<tr>
		<td width="300" height="50">
		<c:url value="/movieinfo?movieCode=${movieItem.movieCode}" var="url"></c:url>
		<a href="${url }"><c:out value="${movieItem.movieTitleKr}"/></a></td>
		<td width="100"><c:out value="${movieItem.movieDirector }"/></td>
		<td width="100"><c:out value="${movieItem.movieGenre}"/></td>
		<td width="100">
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