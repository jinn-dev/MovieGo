<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rating.css" />
<title>Insert title here</title>
<style>
.movieComment{
	border: 0px; 
	font-size:1.0em;
	background: #F2F2F2;
}
.back_to_top{
	position:fixed;
	bottom:0;
	left:45%;
	margin-left:700px;
	text-decoration:none;
	color:#f2f2f2;
	background-color:rgba(79, 93, 115, 0.50);
	font-size:15px;
	padding:1em;
	display:none;
}  
.back_to_top:hover{
	background-color:rgba(199, 92, 92, 0.50);
	color:#f2f2f2;
}
</style>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

 $(document).ready(function() {
	 
			/* 스크롤 위로 이동 소스 */
        	var offset = 220;  
            var duration = 500;  
            $(window).scroll(function() {  
                if ($(this).scrollTop() > offset) {  
                    $('.back_to_top').fadeIn(duration);  
                } else {  
                    $('.back_to_top').fadeOut(duration);  
                }  
            });  
            $('.back_to_top').click(function(event) {  
                event.preventDefault();  
                $('html, body').animate({scrollTop: 0}, duration);  
                return false;  
            })  	
	 		
	<c:url value="/ratinglist.ajax" var="url"/>
            
	$.ajax({
		url:'${url}',
			type:'GET',	    
            cache : false,
            async : false,
            dataType : 'json',
	    success : function(data) {
	    var output = '<div class="list-table"><table><tr><th>포스터</th><th>영화제목</th><th>감독</th><th>개봉일자<th>장르</th><th>별점</th><th>예매하기</th><th>삭제하기</th></tr>';
	    for(var i = 0; i < data.evaluation.length; i++) {	
	   
       	output += '<tr><td class ="thumbnail">'+
		'<img width="140" height="197" src="'+data.evaluation[i].movies[0].movieImgUrl+'"/></div></td>'+
		'<td width="300" height="50">'+
		'<c:url value="/movieinfo?movieCode='+data.evaluation[i].movies[0].movieCode +'" var="url"></c:url>'+
		'<a href="${url }">'+data.evaluation[i].movies[0].movieTitleKr+'</a></td>'+
		'<td width="120">'+data.evaluation[i].movies[0].movieDirector +'</td>'+
		'<td width="100">'+data.evaluation[i].movies[0].movieOpenDate +'</td>'+
		'<td width="100">'+data.evaluation[i].movies[0].movieGenre +'</td>'+
		'<td width="100">'+data.evaluation[i].evRating +'</td>';
		output += '<td width="100">';
		for(var j = 0; j < data.nowlist.length; j++) {
			if(data.nowlist[j] == data.evaluation[i].movies[0].movieCode) {
				output += '<c:url value="/reserve" var="url"></c:url>'+
				'<a href="${url }" class="icon-search">예매하기</a></td>';
				break;
			}
			else if(data.nowlist[j] != data.evaluation[i].movies[0].movieCode) {
				if(j == data.nowlist.length - 1) {
					output += '-</td>';
					break;
				}
				else {
					
				}
			}
		}
	
		output += '<td width="80"><button onclick="deleteCheck('+data.evaluation[i].evId+')"class="div-button">삭제</button>'+
		'</td></tr>';
		}
		'</table>';

	  

         $('#evlist').html(output);
		},
		error : function(request, status, error) {
			alert("노노");
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
	});
});  

 function evc(m) {
	 var param2="?movieCode" +"="+m;
		<c:url value="/evcomment" var="url"></c:url>
		window.open('${url}'+param2,'_blank', "width=800, height=300, toolbar=no, menubar=no, resizable=no");
}
 
function deleteCheck(id) {
	 if(confirm("영화평가를 삭제하시겠습니까??")) {
		 location.href="<%=request.getContextPath()%>/deleteevaluation?evId="+id;
		 
		}
	}
</script>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
			<div class="list-table">
 			<div id="evlist"></div>
 			</div>
  			<a href="#" class="back_to_top">Back to Top</a>
			
			<div id="submenu">
				<jsp:include page="submenu.jsp"></jsp:include>
			</div>
			
	<script type="text/javascript">
		function commentSubmit(id, comment) {
			var param = "evId="+id+"&evComment="+comment;
			<c:url value="/addevcomment" var="url"></c:url>
			$.ajax({
				url:'${url}',
 				type:'POST',	
 				data : param,
 				cache : false,
				async : false,
 				dataType : 'number',
			    success : function(data) {
					alert(data);
			    },
				error : function(request, status, error) {
					if(request.status != '0') {
						alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
					}	
				}
			 }); 
		}
	</script>
</body>
</html>