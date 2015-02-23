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
</head>
<body>
 <input type="hidden" var="${page }" id="page" name="page"/>
</body>
</html>