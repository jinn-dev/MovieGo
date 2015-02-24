<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mypage/favorite.css" />
<script type="text/javascript">
$(document).ready(function() {
	
	<c:url value="/genre.rmd.do" var="url"/>
	var param="page"+"="+0;
	
	$.ajax({
		type: "GET",
		url: "${url}",
		cache: false,
        async: false,
        data: param,
		dataType:"json",
		success: function(data){
			var output = '<table><tr><th>영화 추천</th></tr><tr>';
			for (var i=0; i<6; i++){
					output+='<td><div class="grid">'+
					'<figure class="effect-zoe">'+
					'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
					'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
					'<p class="icon-links">'+
					'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
					'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
					'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
				    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
				    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
				    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
				    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
			} 
			 output+='</tr><tr></table>';
               $(".genre-rmd-content").html(output);
               
		},
		error : function(request, status, error) {
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
	});
});
</script>
</head>
<body>
 <input type="hidden" var="${page }" id="page" name="page"/>
 <div class="genre-rmd-content"></div>
</body>
</html>