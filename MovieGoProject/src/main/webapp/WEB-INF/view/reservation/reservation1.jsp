<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style>
table {
	width:800px;
}

#htable {
	visibility: hidden;
}

</style>
<script type="text/javascript">
function check() {
	var v1 = document.querySelector("#selTheater").innerHTML;
	var v2 = document.querySelector("#selMovie").innerHTML;
	var v3 = document.querySelector("#selTime").innerHTML;
	if (v1=="") {
		alert("영화관을 선택하세요.");
		event.preventDefault();
	}
	else if (v2=="") {
		alert("영화를 선택하세요.");
		event.preventDefault();
	}
	else if (v3=="") {
		alert("시간을 선택하세요.");
		event.preventDefault();
	}
	else {
		event.preventDefault();
		location.href="<%=request.getContextPath()%>/reserve/seat";
	}
}

function clickTime(time) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState==4 && xhr.status==200) {
			document.querySelector("#selTime").innerHTML = time;
		}
	}
	var url = "<%=request.getContextPath()%>/reserve/time";
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("time="+time);
} 
	
function clickMovie(movie) {
	$("#timelist").empty();
	$("#selTime").empty();
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState==4 && xhr.status==200) {
			var jsonobj2 = JSON.parse(xhr.responseText);
			$("#timelist").empty();
			document.querySelector("#selMovie").innerHTML = movie;
			for (var i=0;i<jsonobj2.times.length;i++){
				var appendTxt = "<a href='javascript:clickTime(" + jsonobj2.times[i].ampm + ")'>" + jsonobj2.times[i].time +"</a><br>";
				$("#timelist").append(appendTxt);
			}
		}
	}
	var url = "<%=request.getContextPath()%>/reserve/movie";
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("movieCode="+movie);

	} 


function clickTheater(theater) {	
	$("#timelist").empty();
	$("#movielist").empty();
	$("#selMovie").empty();
	$("#selTime").empty();
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState==4&&xhr.status==200) {
			var jsonobj = JSON.parse(xhr.responseText);
			$("#movielist").empty();
			document.querySelector("#selTheater").innerHTML = theater;
			for(var i = 0; i < jsonobj.movies.length; i++) {
				var appendText = "<a href='javascript:clickMovie(" + jsonobj.movies[i].code + ")'>" + jsonobj.movies[i].movieName +"</a><br>";
				$("#movielist").append(appendText);
			}
		}
	}
	var url = "<%=request.getContextPath()%>/reserve/theater";
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("theaterId="+theater);
	
}

</script>
</head>


<body>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<h1> '아이디: ${log.userId }' 영화 예매 </h1>
<form name="frm" id="frm">
<table border=1>
<tr><th>영화관</th><th>영화</th><th>날짜</th></tr>
<tr>
<td height="400px" >
  <c:forEach items="${theaters }" var="theater">
  <a href="javascript:clickTheater(${theater.theaterId })" id="thChk${theater.theaterId }">${theater.theaterName }</a><br>
  </c:forEach>
</td>
<td>
  <div id="movielist"></div>
</td>
<td>
  <div id="timelist"></div>
</td>
</tr>
<tr>
<td colspan="3" height="100px" align="right">
<!-- 추가: 좌석선택 image button  -->
<input type="image" name="seat" src="<%=request.getContextPath() %>/img/seatSelect.png" onclick="javascript:check();" />
</td>
</tr>
</table>
</form> 
<table id="htable" >
<tr>
<td><div id="selTheater"></div></td>
<td><div id="selMovie"></div></td>
<td><div id="selTime"></div></td>
</tr>
</table>
</body>
</html>
