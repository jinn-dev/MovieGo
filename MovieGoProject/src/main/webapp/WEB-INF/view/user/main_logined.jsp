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
<script type="text/javascript">
$(document).ready(function() {
	$(".boxoffice-tr").mouseenter(function(){
		$(this).css("background-color","#C75C5C");
	});
	
	$(".boxoffice-tr").mouseleave(function(){
		$(this).css("background-color","#F2F2F2");
	});
	
	$(".movieName").mouseenter(function() { 
		$(this).css("color","#F2F2F2");
		var movieCd = $(".movieCd").val();
		var param="movieCode"+"="+movieCd;
		<c:url value="/thumbnail" var="url"/>
		$.ajax({
			url:'${url}',
				type:'GET',	
				data : param,
				cache : false,
			async : false,
				dataType : 'text',
		    success : function(data) {
		    	$("#thumbnail").attr("src", data);
				
			},
			error : function(request, status, error) {
				if(request.status != '0') {
					alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
				}	
			}
		 }); 
	});
	
	$(".movieName").mouseleave(function() { 
		$(this).css("color","#4F5D73");
		});
});

</script>
<title>MOVIE GO 메인 페이지</title>
<script>
</script>
<style>
section{
	margin: 0 auto;
	width: 75%;
	height: 100%;
}
.box-office {
	margin: 0 auto;
	text-align: center;
	width: 1000px;
	height: 400px;
}

table{
	background:#F2F2F2;
	padding: 10px;
}


.table-th{
	padding: 10px;
	font-size: 1.0em;
	background: #4F5D73;
	color:#F2F2F2;
}

#table-index{
	border-bottom: 1px solid;
	border-bottom-color: #8C8C8C;
}

#video-tr{
	margin: 10px;
}

#moviego-table{
	position: relative;
	top: 8%;
	left: 3.5%;
}

</style>
</head>
<body>
<%	
	// 조회일자
	Calendar now = new GregorianCalendar();
	String year = Integer.toString(now.get(Calendar.YEAR));
	String month = Integer.toString(now.get(Calendar.MONTH)+1);
	String date = Integer.toString(now.get(Calendar.DAY_OF_MONTH)-1);
	String sysdate = year+"0"+month+date;
	String targetDt = request.getParameter("targetDt")==null?sysdate:request.getParameter("targetDt");	
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
	<section>
		<div class="box-office">
		<img id="thumbnail" src="#" width="213" height="301">
			<table align="right">
				<tr>
					<th colspan="6" class="table-th">BOX OFFICE</th>
				</tr>
				<tr>
					<td></td>
					<td>영화명</td>
					<td>누적매출액</td>
					<td>누적관객수</td>
					<td>스크린수</td>
					<td>상영횟수</td>
				</tr>
				<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }">
					<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList }" var="boxoffice" varStatus="status">
					<tr class="boxoffice-tr">
					<input type="hidden" value="${boxoffice.movieCd }" class='movieCd' />
							<td><c:out value="${status.count }"/>
							<%-- <c:out value="${boxoffice.rank }" /> --%></td>
							<td><a href="#" class="movieName"><c:out value="${boxoffice.movieNm }" /></a></td>
							<td><c:out value="${boxoffice.salesAcc }" /></td>
							<td><c:out value="${boxoffice.audiAcc }" /></td>
							<td><c:out value="${boxoffice.scrnCnt }" /></td>
							<td><c:out value="${boxoffice.showCnt }" /></td>
					</c:forEach>
				</c:if>
				</tr>
				<tr>
					<td colspan="6" id="video-tr">
					<hr><video id="main-video"
							class="video-js vjs-default-skin" controls preload="none"
							poster="<%=request.getContextPath()%>/img/main_poster.png"
							data-setup="{}" width="600" height="360">
							<source
								src="<%=request.getContextPath()%>/vid/Despicable_Me_Trailer.mp4"
								type='video/mp4' />
						</video></td>
				</tr>
			</table>
			<table id="moviego-table">
				<tr><th colspan="2" class="table-th">무비고 내 영화 예매 순위</th></tr>
				<tr><td>1</td><td></td></tr>
				<tr><td>2</td><td></td></tr>
				<tr><td>3</td><td></td></tr>
				<tr><td>4</td><td></td></tr>
				<tr><td>5</td><td></td></tr>
			</table>
		</div>
	</section>
	
</body>
</html>



