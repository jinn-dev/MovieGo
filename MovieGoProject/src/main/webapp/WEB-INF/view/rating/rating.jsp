<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#comment").click(function() {

/* 		<c:url value="/FrontServlet" var="idchk"></c:url>
 */ 		
    var url = "http://localhost:9090/MovieGoProject/rating/write_comment.jsp";
	/*var url = "$(idchk)?userId="+$("#userId").val(); */	
 window.open(url,"_blank", "width=400px height=400px");
});
	
	$("#wishlist").click(function() {
	       alert("위시리스트에 추가되었습니다");
	});
});


</script>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

영화평가하기
포스터 or 리스트 형태
별점 추가<br>
<form>
  <table id="ratingList">
      <tr>
         <th>
            <div>
               <b>영화제목</b>
            </div>
         </th>
         <th >
            <div>
               <b>별점</b>
            </div>
         </th>
         <th>
            <div>
               <b>코멘트</b>
            </div>
         </th>
         <th>
            <div>
               <b>위시리스트</b>
            </div>
         </th>
      </tr>
      <c:forEach items="${movies }" var="movies">
      <tr>
         <td>
         <c:out value="${movies.movieTitleKr}"/></td>
  <td >별점</td>
          <td>코멘트</td>    
          <td>
            <input type="hidden" name="userId" value="${log.userId }"/>
           <input type="hidden" name="movieCode" value="${movies.movieCode }"/>
          <a href="<%=request.getContextPath() %>/addwishlist"><input type="button" id="wishlist" name="wishlist" value="위시리스트"></a>
          </td>
      </tr>
      </c:forEach>
   </table>
</form>
</body>
</html>