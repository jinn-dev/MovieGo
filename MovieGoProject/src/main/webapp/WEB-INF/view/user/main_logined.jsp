<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/css/location.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/video-js.css">
<title>MOVIE GO 메인 페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<section class="wrap">
		<div class="main-box-1">
			<video id="example_video_1" class="video-js vjs-default-skin"
				controls preload="none"
				poster="<%=request.getContextPath()%>/img/main_poster.png"
				data-setup="{}" width="600" height="360">
				<source
					src="<%=request.getContextPath()%>/vid/Despicable_Me_Trailer.mp4"
					type='video/mp4' />
			</video>
		</div>
		<div class="main-box-2">
		 영화 예매 목록
		</div>
		<div class="main-box-3">
		무비고 사이트내 영화 인기 순위
		</div>
		<div class="main-box-4">
		전날 박스오피스 순위 (api)
		</div>
	</section>
</body>
</html>



