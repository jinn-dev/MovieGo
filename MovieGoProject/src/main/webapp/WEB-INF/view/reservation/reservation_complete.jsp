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

<table>
<tr></tr>
</table>


<input type="button" onclick="location.href='<%=request.getContextPath() %>/mainlogined'" value="메인페이지로" />
<input type="button" onclick="location.href='<%=request.getContextPath() %>/myrlist'" value="MY예매내역" />

</body>
</html>