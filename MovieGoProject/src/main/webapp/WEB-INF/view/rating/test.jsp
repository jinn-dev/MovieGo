<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach items="${movies }" var="movies">
			<tr>
				<td>${movies.movieTitleKr }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" name="page" id="page" value="${page}" />
	<a href="#" onclick="loadNextPage()">더보기</a>
	<script>
		function loadNextPage(page) {
			<c:url value="/test" var="url"/>
			var page = $('#page').val();
			page = parseInt(page);
			page += 10;
			$.ajax({
				type : 'get',
				url : '${url}?page='+page,
				data : ({
					page : page
				}),
				success : function(data) {
					$('table').append(data);
					$('#page').val(page);
				}
			});
		}
	</script>

</body>
</html>