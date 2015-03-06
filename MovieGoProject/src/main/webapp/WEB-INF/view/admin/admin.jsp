<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap-theme.css">
<title>Insert title here</title>
</head>
<body>
관리자페이지
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<div class="container">
<c:url value="/userlist" var="url" />
<a href="${url }">회원목록보기</a>
<input type="button" value="영화삽입하기" id="btn"/>
</div>
</body>
</html>