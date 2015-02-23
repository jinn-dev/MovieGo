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
	
	alert(s + "점추가되었습니다.");
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
 
function evcomment(m) {
	var param="movieCode" +"="+ m;
	$.ajax({
			url:'http://localhost:9090/MovieGoProject/evcommentchk',
			type:'GET',
			data : param,
			cache : false,
			async : false,
			dataType : 'text',
	    	success : function(data) {
	    	if(data == 0) {
	    		 alert("별점을 먼저 선택하세요.");
			}				   
		    
	    	else {
	    		<c:url value="/evcomment" var="url"></c:url>
	 			window.open('${url}','_blank', "width=800, height=300, toolbar=no, menubar=no, resizable=no");
	    	}

		},
	
		error : function(request, status, error) {
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
		
	 });	

}

function wishlist(m) {
	var param="movieCode" +"="+ m;
	$.ajax({
			url:'http://localhost:9090/MovieGoProject/addwishlist',
			type:'GET',
			data : param,
			cache : false,
			async : false,
			dataType : 'text',
	    success : function(data) {
	    	if(data == 0) {
	    		 alert("위시리스트 추가되었습니다.");
			}				   
		    
	    	else {
	    		alert("위시리스트 이미 포함되어 있습니다.");
	    	}

		},
	
		error : function(request, status, error) {
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
		
	 });	
}

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
		
        <input type="button" id="evcomment" name="evcomment" value="한줄평" onclick="javascript:evcomment(${movies.movieCode})"/>
        
        </td>    
        <td>

 <%-- 	 	 <c:url value="/addwishlist" var="action"></c:url>
		<form:form method="post" modelAttribute="wishlists" action="${action }">
  	<input type="hidden" name="movieCode" value="${movies.movieCode }"/>
 	<input type="hidden" name="userId" value="${log.userId }"/> 
 	   </form:form>
 	--%>
 	<input type="button" id="wishlist" onclick="javascript:wishlist(${movies.movieCode });" value="위시리스트"></input> 

          
          </td> 

      </tr>  
      </c:forEach>
   </table>
</body>
</html>
