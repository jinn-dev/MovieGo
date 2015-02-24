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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
 $(document).ready(function() {
	<c:url value="/wishlist.ajax" var="url"/>
	$.ajax({
		url:'${url}',
			type:'GET',	    
            cache : false,
            async : false,
            dataType : 'json',
	    success : function(data) {
	    var output = '<div class="list-table"><table><tr><th>포스터</th><th>영화제목</th><th>감독</th><th>개봉일자<th>장르</th><th>예매하기</th><th>삭제하기</th></tr>';
	    for(var i = 0; i < data.wishlist.length; i++) {	
       	output += '<tr><td class ="thumbnail">'+
		'<img width="180" height="253" src="'+data.wishlist[i].movies[0].movieImgUrl+'"/></div></td>'+
		'<td width="300" height="50">'+
		'<c:url value="/movieinfo?movieCode='+data.wishlist[i].movies[0].movieCode +'" var="url"></c:url>'+
		'<a href="${url }">'+data.wishlist[i].movies[0].movieTitleKr+'</a></td>'+
		'<td width="100">'+data.wishlist[i].movies[0].movieDirector +'</td>'+
		'<td width="120">'+data.wishlist[i].movies[0].movieOpenDate +'</td>'+
		'<td width="100">'+data.wishlist[i].movies[0].movieGenre +'</td>'+
		'<td width="100">';
		for(var j = 0; j < data.nowlist.length; j++) {
			
				if(data.nowlist[j] == data.wishlist[i].movies[0].movieCode) {
					output += '<c:url value="/reserve" var="url"></c:url>'+
					'<a href="${url }" class="icon-search">예매하기</a></td>';
					break;
				}
				else if(data.nowlist[j] != data.wishlist[i].movies[0].movieCode) {
					if(j == data.nowlist.length - 1) {
						output += '-</td>';
						break;
					}
					else {
						
					}
				}
				
		}
		output +='<td width="80"><button onclick="deleteCheck(${wishListItem.wishId})"class="div-button">삭제</button>'+
		'</td></tr>';
		}
		'</table>';

	  

         $('#movies').html(output);
		},
		error : function(request, status, error) {
			alert("노노");
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
	});
	
});  

function deleteCheck(id) {
	 if(confirm("위시리스트를 삭제하시겠습니까??")) {
		 location.href="<%=request.getContextPath()%>/deletewishlist?wishId="+id;
		 
		}
	}
jQuery(document).ready(function() {  
    var offset = 220;  
    var duration = 500;  
    jQuery(window).scroll(function() {  
        if (jQuery(this).scrollTop() > offset) {  
            jQuery('.back_to_top').fadeIn(duration);  
        } else {  
            jQuery('.back_to_top').fadeOut(duration);  
        }  
    });  
      
    jQuery('.back_to_top').click(function(event) {  
        event.preventDefault();  
        jQuery('html, body').animate({scrollTop: 0}, duration);  
        return false;  
    })  
});
</script>
 <style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}

.back_to_top{
	position:fixed;
	bottom:0;
	left:50%;
	margin-left:700px;
	text-decoration:none;
	color:#000000;
	background-color:rgba(0, 0, 0, 0.80);
	font-size:12px;
	padding:1em;
	display:none;
}  
.back_to_top:hover{
	background-color:rgba(0, 0, 0, 0.50);
	color:#000;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	
  <a href="#" class="back_to_top">Back to Top</a>
 
 <div id="movies"></div>
 <div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>
</body>
</html>
