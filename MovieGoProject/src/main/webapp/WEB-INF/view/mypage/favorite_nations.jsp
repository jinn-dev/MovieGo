<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/mypage/horizBarChart.css" />
<script src="<%=request.getContextPath ()%>/js/mypage/jquery.horizBarChart.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	<c:url value="/nation.count.do" var="url"></c:url>
	$.ajax({
		url:'${url}',
		type:'POST',
		cache : false,
		async : false,
		dataType : 'json',
    success : function(data) {
			var output = '<ul class="chart">'+
			'<li class="title" title="선호 국가"></li>'+
            '<li class="current" title="'+data[0].movieNation+'"><span class="bar" data-number="'+data[0].count+'"></span><span class="number">'+data[0].count+'</span></li>'+
            '<li class="current" title="'+data[1].movieNation+'"><span class="bar" data-number="'+data[1].count+'"></span><span class="number">'+data[1].count+'</span></li>'+
            '<li class="current" title="'+data[2].movieNation+'"><span class="bar" data-number="'+data[2].count+'"></span><span class="number">'+data[2].count+'</span></li><ul>';
			$('.chart-horiz').html(output);
	},

	error : function(request, status, error) {
		if(request.status != '0') {
			alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
		   }	
	   }
   });
	
	
	});
</script>
<body>
	<div class="chart-horiz"></div>
	<script>
		$('.chart').horizBarChart({
			selector : '.bar',
			speed : 1500
		});
	</script>
</body>
</html>