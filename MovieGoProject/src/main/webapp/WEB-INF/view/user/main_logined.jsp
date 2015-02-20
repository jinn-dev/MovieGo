<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/location.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/video-js.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>MOVIE GO 메인 페이지</title>
<script>


</script>
</head>
<body>
<%	
	// 조회일자
	String targetDt = request.getParameter("targetDt")==null?"20150219":request.getParameter("targetDt");	
	// 결과 row 수	
	String itemPerPage = request.getParameter("itemPerPage")==null?"30":request.getParameter("itemPerPage");
	// "Y": 다양성영화 "N": 상업영화 (default: 전체)
	String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");
	// "K": 한국영화 "F": 외국영화 (default: 전체)
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
	// "0105000000" 로서 조회된 지역코드
	String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");
	//발급키 (test key)
	String key = "837ec14c288f69ef9955fc6d8917c9ba";
	// KOBIS 오픈 API Rest Client를 통해 호출
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	// 일일 박스오피스 서비스 호출
	String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
	request.setAttribute("dailyResult", dailyResult);
	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode)
	String codeResponse = service.getComCodeList(true, "0105000000");
	HashMap<String, Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
	request.setAttribute("codeResult", codeResult);

%>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<section class="wrap">
	<%-- 	<div class="main-box-1">
			<video id="example_video_1" class="video-js vjs-default-skin"
				controls preload="none"
				poster="<%=request.getContextPath()%>/img/main_poster.png"
				data-setup="{}" width="600" height="360">
				<source
					src="<%=request.getContextPath()%>/vid/Despicable_Me_Trailer.mp4"
					type='video/mp4' />
			</video>
		</div> --%>
		<div class="main-box-2">
		<table align="right">
			<tr>
			<td colspan="6">박스오피스</td></tr>
			<tr><td></td>
			<td>영화명</td>
			<td>누적매출액</td>
			<td>누적관객수</td>
			<td>스크린수</td>
			<td>상영횟수</td>
			</tr>
			<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }">
			<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList }" var="boxoffice">
			<%
			LinkedHashMap map = (LinkedHashMap)pageContext.getAttribute("boxoffice");
			String apiKey = "DAUM_CONTENTS_DEMO_APIKEY";  
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
			
			int result = 1;
			int pageno= 1;
			String movieUrl = "http://apis.daum.net/contents/movie?"+"output=json&apikey="+apiKey+"&pageno="+pageno+"&result="+result+"&q="+URLEncoder.encode(movieName, "UTF-8");
			URL url = new URL(movieUrl);
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
	 			ArrayList thumbnail = (ArrayList)daumResult4.get("thumbnail");
	 			request.setAttribute("thumbnail", thumbnail);  
	 		}
			%>
	 	<div align="left" class="main-box-2-inner">
			<c:if test="${not empty thumbnail }">
				<c:forEach items="${thumbnail }" var="thumbnail" start="1" end="1">
					<img src='<c:out value="${thumbnail.content }" />'/>
				</c:forEach>
			</c:if> 
			</div>
			<tr>
				<td class="rank"><c:out value="${boxoffice.rank }" /></td>
				<input type="hidden" value="${boxoffice.movieNm }" id="movieNm"/>
				<td><a href="#" class="movieNm"><c:out value="${boxoffice.movieNm }" /></a></td>
				<td><c:out value="${boxoffice.salesAcc }" /></td>
				<td><c:out value="${boxoffice.audiAcc }" /></td>
				<td><c:out value="${boxoffice.scrnCnt }" /></td>
				<td><c:out value="${boxoffice.showCnt }" /></td>
				</c:forEach>
			</c:if>
			</tr>
			</table> 
		</div>
		<div class="main-box-3">
		</div>
		<div class="main-box-4">
		</div>
	</section>
</body>
</html>



