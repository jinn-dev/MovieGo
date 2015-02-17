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
	
	String movieCd = request.getParameter("movieCd")==null?"20120424":request.getParameter("movieCd");

	String key = "837ec14c288f69ef9955fc6d8917c9ba";
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
	String movieItem = service.getMovieInfo(true, movieCd);
	
	//json
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String, Object> movieResult = mapper.readValue(movieItem, HashMap.class);
	Map<String, Object> moviInfoResult = (Map)movieResult.get("movieInfoResult");
	Map<String, Object> movieInfo = (Map)moviInfoResult.get("movieInfo");
	String movieNm = (String)movieInfo.get("movieNm");
	String movieNmEn = (String)movieInfo.get("movieNmEn");
	out.println("영화제목:"+movieNm);
	out.println("영화제목(영어):"+movieNmEn);
	ArrayList actors = (ArrayList)movieInfo.get("actors");
	// request.setAttribute("actors", actors);  
	// request.setAttribute("movieResult", movieResult);
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


	<c:if test="${not empty movieInfo }">
		<c:forEach items="${movieInfo}" var="movieInfo">
			<tr>
				<td><c:out value="${movieInfo.movieCd }" /></td>
				<td><c:out value="${movieInfo.movieNm }" /></td>
				<td><c:out value="${movieInfo.movieNmEn }" /></td>
				<td><c:out value="${movieInfo.genreNm }" /></td>
				<td><c:out value="${movieInfo.directors }" /></td>
				<td><c:out value="${movieInfo.actors }" /></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</html>