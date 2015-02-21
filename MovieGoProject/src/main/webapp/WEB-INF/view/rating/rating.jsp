<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page import="com.mvg.entity.User"%>
  <%@ page import="com.mvg.entity.Wishlist"%>
   <%@ page import="com.mvg.entity.Movie"%>
   
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="<%=request.getContextPath() %>/mypage/css/component.css" rel="stylesheet" />
<style>
#ratingList{
	margin: 0 auto;
}

</style>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
var flag = "n";

function ratingInfo(s, m){
	var mov = m.toString();
	var str = s + mov;
	alert(str);
	flag = "y";
	var code;
	 var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState==4&&xhr.status==200) {
			}
		}
				
	var url = "<%=request.getContextPath()%>/evrating";
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("code=" + str);

} 

/*  
 function ratingInfo(s){
	
	flag = "y";
	alert(s + "점 추가");

} */

 
function evcomment() {
	if(flag == "y") {
		<c:url value="/evcomment" var="url"></c:url>    	    
		window.open('${url}','_blank', "width=500, height=500, toolbar=no, menubar=no, resizable=no");
		flag = "n";

	}
	else {
		alert("별점 먼저 선택하세요.");


	}	

}


 function wishlist() {
	   alert("위시리스트에 추가되었습니다");

}
/* 
function wishlist() {
	   alert("위시리스트에 추가되었습니다");
}
$( "wishlist" ).click(function() {
		   alert("위시리스트에 추가되었습니다");

	})
 */

	
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");


	     return false;
	});




</script>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

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
         <td><c:out value="${movies.movieTitleKr}"/></td>
  		<td > 
  		
  	<a href="javascript:ratingInfo(1, ${movies.movieCode})" class="on" id="one">★</a>
    <a href="javascript:ratingInfo(2, ${movies.movieCode})" class="on" id="two">★</a>
    <a href="javascript:ratingInfo(3, ${movies.movieCode})" class="on" id="three">★</a>
    <a href="javascript:ratingInfo(4, ${movies.movieCode})" id="four">★</a>
    <a href="javascript:ratingInfo(5, ${movies.movieCode})" id="five">★</a>
  
 <!--    	
 p태그안에 들어가면 a태그 안먹힘
 <p class="star_rating">
</p> -->
 </td>
        <td>
    <%--     <c:url value="/evcomment" var="action"></c:url>
		<form:form method="post" modelAttribute="evcomment" action="${action }">
		 <input type="hidden" name="movieTitleKr" value="${movies.movieTitleKr }"/> 
		 <input type="hidden" name="userId" value="${log.userId }"/> 
		  </form:form>
		  --%>
		 
        <input type="button" id="evcomment" name="evcomment" value="한줄평" onclick="javascript:evcomment()"/>
        
        </td>    
        <td>

<%--	<c:url value="/addwishlist?userId=${log.userId }&movieCode=${movies.movieCode }" var="url"/>
			
 	<a href="${url }"><button>위시리스트</button></a>  --%>
 	 	 <c:url value="/addwishlist" var="action"></c:url>
		<form:form method="post" modelAttribute="wishlists" action="${action }">
  	<input type="hidden" name="movieCode" value="${movies.movieCode }"/>
 	<input type="hidden" name="userId" value="${log.userId }"/>
 	<input type="submit" id="wishlist" name="_event_confirmed" onclick="javascript:return wishlist();" value="위시리스트"></input> 
 	  </form:form>
          </td> 

      </tr>  
      </c:forEach>
      
   </table>
 
</body>
</html>