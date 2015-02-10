<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/board/css/board.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	if(xhr.readyState==4 && xhr.status==200){
		var data = xhr.responseText;
		var obj = JSON.parse(data);
		var output ="<table id='list' border='1'><tr>";
		output+="<th>번호</th><th>제목</th><th>작성자</th><th>작성일자</th></tr>";
		for(var i=0;i<obj.length;i++){
			output+=("<tr><td class='no'>");
			output+=(obj[i].boardId+"</td><td class='userid'>");
			output+=(obj[i].userId+"</td><td>");
			<c:url value="/board_view" var="url"></c:url>
			var link = "${url}?no="+JSON.stringify(obj[i].boardId);
			output+=("<a id='commentinfo' href="+url+">"
					+obj[i].commentContent+"</a></td><td class='date'>");
			
		}
	}
}
</script>
<title>고객센터</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
	<h2>1:1문의</h2>
	<div id="drophere">
	</div>
</body>
</html>