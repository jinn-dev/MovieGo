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
	$("#button").click(function(){
		<c:url value="/ajax" var="url"/>
		var url = "${url}";
		$.ajax({
			type : "get",
			url : url,
			dataType : "JSON",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				for (var idx = 0; idx < data.length; idx++) { 
					$("#moives").append(data[idx]+ "<br>")
				}  
			},
			error : function(XHR, textStatus) {
				alert("Error: "+ textStatus);
			}
		});
	});	
	});
</script>
</head>
<body>
	<div id="movies" border="1"></div>
	<button id="button">ajax 테스트</button>
</body>
</html>