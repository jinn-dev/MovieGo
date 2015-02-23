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
		 location.href="<%=request.getContextPath()%>/deleteevaluation?evId="+id;
		 
		}
	}
</script>
<style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
	#ratinglist {
		width : 70%;
		float : right;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<div id="ratinglist">
영화평가목록
 <table id="ratingList" border="1">
      <tr>
         <th>
            <div>
               <b>영화제목</b>
            </div>
         </th>
         <th >
            <div>
               <b>감독</b>
            </div>
         </th>
         <th>
            <div>
               <b>장르</b>
            </div>
         </th>
          <th>
            <div>
               <b>별점</b>
            </div>
         </th>
          <th>
            <div>
               <b>코멘트</b>
            </div>
            <th>
            <div>
               <b>예매하기</b>
            </div>
         </th>
      </tr>
      	<c:forEach items="${evlist}" var="evlistItem">
		<c:set value="${evlistItem.movies}" var="movie">	</c:set>
		<c:forEach items="${movie}" var="movieItem">
		<tr>
		<td><a href="<%=request.getContextPath()%>/movieinfo?movieCode=${movieItem.movieCode}"><c:out value="${movieItem.movieTitleKr}"/></a></td>
		<td><c:out value="${movieItem.movieDirector}"/></td>
		<td><c:out value="${movieItem.movieGenre}"/></td>
		<td><c:out value="${evlistItem.evRating}"/></td>
		<td><c:out value="${evlistItem.evComment}"/></td>
		<td>
		<c:url value="/reserve" var="url"></c:url>
		<a href="${url }" class="icon-search">예매하기</a>		
		</td>
		<td>
		<button onclick="deleteCheck(${evlistItem.evId})"class="div-button">삭제</button>
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