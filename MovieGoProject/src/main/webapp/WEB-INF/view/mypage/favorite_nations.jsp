<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			alert(data);	    
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

</body>
</html>