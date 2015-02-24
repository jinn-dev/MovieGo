<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mvg.entity.User" %>
<%@ page import="com.mvg.entity.Movie" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta name="author" content="Codrops" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mypage/component.css" />
<script src="<%=request.getContextPath()%>/js/mypage/modernizr.custom.js"></script>
	<div class="container">
		<ul class="cbp-vimenu">
			<li><a href="45" class="icon-logo"></a></li>
			<c:url value="/mypage" var="url"></c:url>
			<li><a href="${url }" class="icon-archive">영화취향분석</a></li>
			<c:url value="/modify" var="url"></c:url>
			<li><a href="${url }" class="icon-search">개인정보수정</a></li>
			<li><a href="#" class="icon-pencil">MY예매내역</a></li>
			<li><a href="<%=request.getContextPath() %>/wishlist?userId=${log.userId }" class="icon-location">위시리스트</a></li>
			
			<c:url value="/ratinglist?userId=${log.userId }" var="url"></c:url>
			<li><a href="${url }" class="icon-images">영화평가목록</a></li>
		</ul>

	</div>
