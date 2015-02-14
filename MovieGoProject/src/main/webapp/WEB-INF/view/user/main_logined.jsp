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
	<header>
		<section>
			<div class="main-div-1">
				<video id="example_video_1" class="video-js vjs-default-skin"
					controls preload="none"
					poster="<%=request.getContextPath()%>/img/main_poster.PNG"
					data-setup="{}">
					<source
						src="<%=request.getContextPath()%>/vid/Despicable_Me_Trailer.mp4"
						type='video/mp4' />
				</video>
			</div>
		</section>
		<section>
			<div class="main-div-2"></div>
		</section>
	</header>
</body>
</html>



