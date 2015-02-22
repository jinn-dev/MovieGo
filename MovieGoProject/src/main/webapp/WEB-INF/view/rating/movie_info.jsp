<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

영화정보페이지
장르: ${movieinfo.movieTitleKr }
감독: ${movieinfo.movieTitleKr }
배우: ${movieinfo.movieActor1 }
배우: ${movieinfo.movieActor2 }
배우: ${movieinfo.movieActor3 }
줄거리: ${movieinfo.movieStory }


</body>
</html>