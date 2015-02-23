<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.util.JSONBuilder"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.w3c.dom.*" %>
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
	String itemPerPage = request.getParameter("itemPerPage")==null?"20":request.getParameter("itemPerPage");
	// 영화명으로 조회
	String movieNm = request.getParameter("movieNm")==null?"":request.getParameter("movieNm");
	// 감독명으로 조회
	String directorNm = request.getParameter("directorNm")==null?"호소다마모루":request.getParameter("directorNm");
	// YYYY형식의 조회시작 개봉연도 입력
	String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");
	// YYYY형식의 조회종료 개봉연도 입력
	String openEndDt = request.getParameter("openEndDt")==null?"":request.getParameter("openEndDt");
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
	// out.println(movieResult);
	
%>

</body>
<table border="1">
<!-- 	<tr>
		<td>영화코드</td>
		<td>영화명(국문)</td>
		<td>영화명(영문)</td>
		<td>영화장르</td>
		<td>국가</td>
		<td>영화감독</td>
		<td>포스터</td>
		<td>스토리</td>
		<td>평점</td>
		<td>배우</td>
	</tr> -->

	<c:if test="${not empty movieResult.movieListResult.movieList }"><!--  linked hash map -->
		<c:forEach items="${movieResult.movieListResult.movieList }" var="movie"> <!--  map 안에 있는 movie linked hash map -->
		<%
		/* 	System.out.println("영화"+pageContext.getAttribute("movie").getClass());  */
		%>
			<tr>
				<td><c:out value="${movie.movieCd }" /></td>
				<td><c:out value="${movie.movieNm }" /></td>
				<td><c:out value="${movie.movieNmEn }" /></td>
				<td><c:out value="${movie.repGenreNm }" /></td>
				<td><c:out value="${movie.repNationNm }" /></td>
				<td><c:out value="${movie.openDt }" /></td>
				
			<%
				LinkedHashMap map = (LinkedHashMap)pageContext.getAttribute("movie");
				String apiKey = "DAUM_CONTENTS_DEMO_APIKEY";     // 5b2f03cf0e14e9579391ce1940083538
				String str1 = (String)map.get("movieNm");
				String str2 =":";
				String movieName;
				boolean contains = str1.contains(str2);
				if(contains == true){
					int idx = str1.indexOf(":");
					movieName = str1.substring(0, idx-1);
				}
				else{
					movieName = str1;
				} 
				int result = 20;
				int pageno= 1;
				String movieUrl = "http://apis.daum.net/contents/movie?"+"output=json&apikey="+apiKey+"&pageno="+pageno+"&result="+result+"&q="+URLEncoder.encode(movieName, "UTF-8");
				URL url = new URL(movieUrl);
				// Connection 객체를 InputStreamReader로 읽고 utf-8로 인코딩.
				InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
				ObjectMapper daumMapper = new ObjectMapper(); 
				HashMap<String, Object> daumResult = daumMapper.readValue(isr, HashMap.class);
				Map<String, Object> daumResult2 = (Map)daumResult.get("channel");
		 		ArrayList daumResult3 = (ArrayList)daumResult2.get("item"); 
		 		for(int i=0;i<daumResult3.size();i++){
		 			if(daumResult3.get(i)==null){
		 				daumResult3.set(i, "false");
		 			}
					Map<String, Object> daumResult4 = (Map)daumResult3.get(i);
					ArrayList director = (ArrayList)daumResult4.get("director"); //감독
					request.setAttribute("director", director);
					ArrayList thumbnail = (ArrayList)daumResult4.get("thumbnail"); //포스터url
					request.setAttribute("thumbnail", thumbnail); 
					/* ArrayList openInfo = (ArrayList)daumResult4.get("open_info"); // 관람등급, 런닝타임
					request.setAttribute("openInfo", openInfo);  */ 
					ArrayList story = (ArrayList)daumResult4.get("story"); //줄거리
					request.setAttribute("story", story);
					ArrayList actor = (ArrayList)daumResult4.get("actor"); //배우
					request.setAttribute("actor", actor);
		 		}
				%>	
				<c:if test="${not empty director }">
					<c:forEach items="${director }" var="director">
						<td><c:out value="${director.content }" /></td>
						</c:forEach>
				</c:if>
			<%-- 	<c:if test="${not empty openInfo }">
					<c:forEach items="${openInfo }" var="openInfo">
						<td><c:out value="${openInfo.content }" /></td>
						</c:forEach>
				</c:if> --%>
				<c:if test="${not empty thumbnail }">
					<c:forEach items="${thumbnail }" var="thumbnail">
						<td><c:out value="${thumbnail.content }" /></td>
						</c:forEach>
				</c:if>
					<c:if test="${not empty story }">
					<c:forEach items="${story }" var="story">
						<td><c:out value="${story.content }" /></td>
						</c:forEach>
				</c:if>
				<c:if test="${not empty actor }">
					<c:forEach items="${actor }" var="actor">
						<td><c:out value="${actor.content }" /></td>
						</c:forEach>
				</c:if>
				
			<%-- <% 
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
				</c:if> --%>
		</tr>
	</c:forEach>
	</c:if>
</table>
</html>