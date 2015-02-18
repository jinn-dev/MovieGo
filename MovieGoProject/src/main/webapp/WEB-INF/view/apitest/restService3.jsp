<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.util.JSONBuilder"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="org.xml.sax.SAXException" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
	// 현재 페이지를 지정
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");
	// 결과 ROW의 개수를 지정 
	String itemPerPage = request.getParameter("itemPerPage")==null?"500":request.getParameter("itemPerPage");
	// 영화명으로 조회
	String movieNm = request.getParameter("movieNm")==null?"":request.getParameter("movieNm");
	// 감독명으로 조회
	String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");
	// YYYY형식의 조회시작 개봉연도 입력
	String openStartDt = request.getParameter("openStartDt")==null?"1960":request.getParameter("openStartDt");
	// YYYY형식의 조회종료 개봉연도 입력
	String openEndDt = request.getParameter("openEndDt")==null?"2015":request.getParameter("openEndDt");
	// YYYY형식의 조회시작 제작연도 입력
	String prdtStartYear = request.getParameter("prdtStartYear")==null?"":request.getParameter("prdtStartYear");
	// YYYY형식의 조회종료 제작연도 입력
	String prdtEndYear = request.getParameter("prdtEndYear")==null?"":request.getParameter("prdtEndYear");
	// N개의 국적 조회할 수 있음 (default: 전체)
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
	// N개의 영화유형코드로 조회할 수 있음 (default: 전체)
	String[] movieTypeCds = {""};
	String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr")==null?movieTypeCds:request.getParameterValues("movieTypeCdArr");

	String key = "837ec14c288f69ef9955fc6d8917c9ba";
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
	String movieItem = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
	
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
		<td>영화장르</td>
		<td>영화감독</td>
		<td>배우</td>
	</tr>

	<c:if test="${not empty movieResult.movieListResult.movieList }"><!--  linked hash map -->
		<c:forEach items="${movieResult.movieListResult.movieList }" var="movie"> <!--  map 안에 있는 movie linked hash map -->
		<%
			System.out.println("영화"+pageContext.getAttribute("movie").getClass()); 
		%>
			<tr>
				<td><c:out value="${movie.movieCd }" /></td>
				<td><c:out value="${movie.movieNm }" /></td>
				<td><c:out value="${movie.movieNmEn }" /></td>
				<td><c:out value="${movie.genreAlt }" /></td>
				<td><c:out value="${movie.directors }" /></td>
			
			<% 
			/* System.out.println("영화"+pageContext.getAttribute("movie").getClass()); */
			LinkedHashMap map = (LinkedHashMap)pageContext.getAttribute("movie");
			String code = (String)map.get("movieCd");			
			String movieCd = request.getParameter("movieCd")==null?code:request.getParameter("movieCd");
			
			String movieInfoItem = service.getMovieInfo(true, movieCd);
			ObjectMapper InfoMapper = new ObjectMapper();
			
			HashMap<String, Object> movieResult2 = InfoMapper.readValue(movieInfoItem, HashMap.class);
			Map<String, Object> moviInfoResult = (Map)movieResult2.get("movieInfoResult");
			Map<String, Object> moviInfo = (Map)moviInfoResult.get("movieInfo");
			ArrayList actors = (ArrayList)moviInfo.get("actors");
			request.setAttribute("actors", actors);  
			%>
				<c:if test="${not empty actors }">
					<c:forEach items="${actors }" var="actorInfo">
						<td><c:out value="${actorInfo.peopleNm }" /></td>
						</c:forEach>
				</c:if>
		</tr>
	</c:forEach>
	</c:if>
</table>
</html>