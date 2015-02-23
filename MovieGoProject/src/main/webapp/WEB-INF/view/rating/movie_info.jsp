<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.util.JSONBuilder"%>
<%@ page import="net.sf.json.JSONArray"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var param="movieCode"+"="+${onemovie.movieCode };
	<c:url value="/onemovieimg" var="url"/>
	$.ajax({
		url:'${url}',
			type:'GET',	
			data : param,
			cache : false,
			async : false,
			dataType : 'text',
	    success : function(data) {
	    	$("#img").attr("src", data);
		},
		error : function(request, status, error) {
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
	});
});
</script>
<style>
table{

	table-layout:fixed;
}

.table-th{
	padding: 10px;
	font-size: 1.0em;
	background: #4F5D73;
	color:#F2F2F2;
}

.table-td{
	font-size: 1.0em;
	width : 60%;
	word-wrap:break-word;	
}
.box-office {
	margin: 0 auto;
	text-align: center;
	width : 70%;
	height: 400px;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

영화정보페이지<br>
<section>
<div class="box-office">

<img id="img" src="#" width="213" height="301">

<table align="right" border=1>

<tr>
	<th>제목</th>
	<td><c:out value="${onemovie.movieTitleKr }"/></td>
</tr>
<tr>
	<th>평균별점</th>
	<td><c:out value="${avgrating }"/></td>
</tr>
<tr>
	<th>장르</th>
	<td><c:out value="${onemovie.movieGenre }"/></td>
</tr>
<tr>
	<th>감독</th>
	<td><c:out value="${onemovie.movieDirector }"/></td>
</tr>
<tr>
	<th>배우1</th>
	<td><c:out value="${onemovie.movieActor1 }"/></td>
</tr>
<tr>
	<th>배우2</th>
	<td><c:out value="${onemovie.movieActor2 }"/></td>
</tr>
<tr>
	<th>배우3</th>
	<td><c:out value="${onemovie.movieActor3 }"/></td>
</tr>
<tr>
	<th>줄거리</th>
	<td><c:out value="${onemovie.movieStory }"/></td>
</tr>
<c:forEach items="${evlist}" var="evlist">
<tr>
	<th>코멘트</th>
	<td><c:out value="${evlist.evComment }"/></td>
</tr>
<tr>
	<th>코멘트</th>
	<td width="200"><c:out value="${evlist.evRating }"/></td>
</tr>
</c:forEach>
</table>
</div>
</section>


</body>
</html>