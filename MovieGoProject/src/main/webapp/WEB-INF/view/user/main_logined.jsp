<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.util.JSONBuilder"%>
<%@ page import="net.sf.json.JSONArray"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap-theme.css">
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap/clean-blog.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/video-js.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap/clean-blog.js"></script>
<style>
table {
	background: #F2F2F2;
	padding: 10px;
}
body{
	padding-bottom: -100px;
}
.container{
	margin-top: 5em;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var param="movieCode"+"="+$(".firstMovie").val();
	alert(param);
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
	
	$(".boxoffice-tr").mouseenter(function(){
		$(this).css("background-color","#C75C5C");
	});
	
	$(".boxoffice-tr").mouseleave(function(){
		$(this).css("background-color","#F2F2F2");
	});
	
	$(".movieName").mouseenter(function() { 
		$(this).css("color","#F2F2F2");
	});
	
	$(".movieName").mouseleave(function() { 
		$(this).css("color","#4F5D73");
		});
});
</script>
<title>MOVIE GO</title>
</head>
<body>
	<%	
	// 조회일자
	Calendar now = new GregorianCalendar();
	String year = Integer.toString(now.get(Calendar.YEAR));
	String month = Integer.toString(now.get(Calendar.MONTH)+1);
	String date = Integer.toString(now.get(Calendar.DAY_OF_MONTH)-1);
	String sysdate = year+"0"+month+"0"+date;  
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
	 <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('<%=request.getContextPath()%>/img/interstellar.png')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1><font color="#4F5D73">MOVIE</font><font color="#C75C5C">GO</font></h1>
                        <hr class="small">
                        <span class="subheading"><font color="#393939">영화예매 및 영화추천 서비스</font></span>
                    </div>
                </div>
            </div>
        </div>
    </header>
		<div class="row" style="border:1px;">
			<div class="col-md-2">
				<div class="align img-rounded"><img id="thumbnail" src="#" width="213" height="301"></div>
			</div>
			<div class="col-md-6">
				<table class="table table-bordered table-striped table-responsive">
					<tr>
						<th colspan="6" class="align"><img id="tasteimg"
							src="<%=request.getContextPath()%>/img/boxoffice.png" /></th>
					</tr>
					<tr>
						<td></td>
						<td>영화명</td>
						<td>누적매출액</td>
						<td>누적관객수</td>
						<td>스크린수</td>
						<td>상영횟수</td>
					</tr>
					<c:if
						test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }">
							<c:forEach
								items="${dailyResult.boxOfficeResult.dailyBoxOfficeList }"
								var="boxoffice" varStatus="status">
								<input type="hidden" value="${boxoffice.movieCd }" class='firstMovie' />
								<tr class="boxoffice-tr"><td><c:out value="${boxoffice.rank }" /></td>
								<td><a href="#" class="movieName"
									onmouseover="javascript:viewThumbnail('${boxoffice.movieCd}')"><c:out
											value="${boxoffice.movieNm }" /></a></td>
								<td><c:out value="${boxoffice.salesAcc }" /></td>
								<td><c:out value="${boxoffice.audiAcc }" /></td>
								<td><c:out value="${boxoffice.scrnCnt }" /></td>
								<td><c:out value="${boxoffice.showCnt }" /></td></tr>
							</c:forEach>
					</c:if>
				</table>
			</div>
			<div class="col-md-4">
				<video style="text-align: center;" id="main-video" class="video-js vjs-default-skin" controls preload="none"
					poster="<%=request.getContextPath()%>/img/kingsman12-1024x576.jpg"
					data-setup="{}" width="600" height="360">
					<source src="<%=request.getContextPath()%>/vid/KINGSMAN.mp4"
						type='video/mp4' />
				</video>
			</div>
		</div>
<script>
function viewThumbnail(m){
	var param="movieCode"+"="+m;
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
}

</script>
</body>
</html>



