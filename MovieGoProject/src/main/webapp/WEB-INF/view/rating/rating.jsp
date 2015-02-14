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
});
function wishlist(){
/*  위시리스트 db에 추가
 */	
       alert("위시리스트에 추가되었습니다");
}


</script>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

영화평가하기
포스터 or 리스트 형태
별점 추가<br>
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
          <td>위시리스트</td>
      </tr>
      </c:forEach>
   </table>

<input type="button" value="코멘트" id="comment" name="comment"></input>
<input type="button" onclick="javascript:wishlist();" value="보고싶어요"></input>

</body>
</html>