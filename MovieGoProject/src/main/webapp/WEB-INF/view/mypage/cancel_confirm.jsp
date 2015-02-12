<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
	#cancelconfirm {
		width : 70%;
		float : right;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp"" />
<div id="cancelconfirm">
예매가 성공적으로 취소되었습니다.<br>
<a href="cancel_list.jsp"><input type="button" value="예매취소확인"></a>
<a href="mypage.jsp"><input type="button" value="마이페이지"></a><br>
</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>





</body>
</html>