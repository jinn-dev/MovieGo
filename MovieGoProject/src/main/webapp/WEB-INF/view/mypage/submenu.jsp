<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:url value="/mypage" var="url"/>    
<a href="${url }"><input type="button" value="영화취향분석"></a><br>
<c:url value="/modify" var="url"/>    
<a href="${url }"><input type="button" value="개인정보수정"></a><br>
<a href="reservation_list.jsp"><input type="button" value="My예매내역"></a><br>
<a href="cancel_list.jsp"><input type="button" value="예매취소확인"></a><br>
<a href="wishlist.jsp"><input type="button" value="위시리스트"></a><br>
<a href="rating_list.jsp"><input type="button" value="영화평가목록"></a><br>

</body>
</html>