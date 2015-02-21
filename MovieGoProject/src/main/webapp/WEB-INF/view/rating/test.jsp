<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style>
</style>
<script type="text/javascript">
	$(document).ready(function() {
		<c:url value="/rating.ajax" var="url"/>
		var param="page"+"="+0;
		$.ajax({
			url:'${url}',
				type:'GET',	
				cache : false,
				async : false,
				data : param,
				dataType : 'json',
		   		 success : function(data) {
		   			 // var json = JSON.stringify(data);
		   			 $("#movies").append("<tr>");
		   			 for(var i in data){
						$("#movies").append('<td><img src="'+data[i].movieImgUrl+'"/></td>');
		   			 } 
		   			$("#movies").append("</tr>");  
		   			$("#page").val(6);
		   		 },
			error : function(request, status, error) {
				if(request.status != '0') {
					alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
				}	
			}
		 }); 
	 $("#more").click(function(){
		 <c:url value="/rating.ajax" var="url"/>
		 var page = $('#page').val();
		 var param = "page"+"="+page;
		 $.ajax({
				url:'${url}',
					type:'GET',	
					cache : false,
					async : false,
					data : param,
					dataType : 'json',
			   		 success : function(data) {
			   			 // var json = JSON.stringify(data);
			   			 $("#movies").append("<tr>");
			   			 for(var i in data){
			   				$("#movies").append('<td><img src="'+data[i].movieImgUrl+'"/></td>');
			   			 } 
			   			 $("#movies").append("</tr>"); 
			   			$("#page").val()+6;
			   		 },
				error : function(request, status, error) {
					if(request.status != '0') {
						alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
					}	
				}
			 }); 
		 
		 
	 });
	
	});
</script>
</head>
<body>
<table border="1">
	<input type="hidden" var="${page }" id="page" name="page"/>
	<div id="movies">
	</div>
</table>
<button id="more">더보기</button>
</body>
</html>