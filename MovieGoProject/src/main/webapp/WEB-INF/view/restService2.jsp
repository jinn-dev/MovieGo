<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.util.JSONBuilder"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	
	String movieCd = request.getParameter("movieCd")==null?"20124079":request.getParameter("movieCd");

	String key = "837ec14c288f69ef9955fc6d8917c9ba";
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
	String movieItem = service.getMovieInfo(true, movieCd);
	
	//json
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String, Object> movieResult = mapper.readValue(movieItem, HashMap.class);
	
	request.setAttribute("movieResult", movieResult);
	
	String codeResponse = service.getComCodeList(true, "0105000000");
	HashMap<String, Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
	request.setAttribute("codeResult", codeResult);

%>

</body>
<table border="1">
	<tr>
		<td>영화코드</td>
		<td>영화명(국문)</td>
		<td>영화명(영문)</td>
		<td>장르</td>
		<td>영화감독</td>
		<td>배우</td>
		<!-- <td>포스터url</td>
		<td>줄거리</td> -->
	</tr>


	<c:if
		test="${not empty movieResult.movieInfoResult }">
		<c:forEach items="${movieResult.movieInfoResult }" var="movieInfo">
			<tr>
				<td><c:out value="${movieCd }" /></td>
				<td><c:out value="${movieNm }" /></td>
				<td><c:out value="${movieNmEn }" /></td>
				<td><c:out value="${genreNm }" /></td>
				<td><c:out value="${directors }" /></td>
				<td><c:out value="${actors }" /></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</html>