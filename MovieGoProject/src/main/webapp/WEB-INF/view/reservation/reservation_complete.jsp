<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<script>
</script>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

예매 완료
가격 : ${price }
인원 : ${peopleNum }
극장 : ${theater }
영화 : ${movie }
상영시간 : ${movieTime }
좌석 : ${seats }

<input type="button" onclick="location.href='<%=request.getContextPath() %>/mainlogined'" value="메인페이지로" />
<input type="button" onclick="location.href='<%=request.getContextPath() %>/myrlist'" value="MY예매내역" />

</body>
</html>