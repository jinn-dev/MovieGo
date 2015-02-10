<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <script type="text/javascript">
 function deleteCheck() {
	 if(confirm("회원탈퇴하시겠습니까??")) {
		 location.href="<%=request.getContextPath()%>/main";
	 }
	 
 }
</script>
<style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
	#modufy {
		width : 70%;
		float : right;
	}
</style>
<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
<div id="modufy">
개인정보수정
ID <input type="text"> <br>
비밀번호<input type="password"><br> 
비밀번호 확인<input type="password"> <br>
EMAIL<input type="email"> <br>
생년월일<input type="text"> <br>
<input type="button" value="수정 확인">
<input type="button" value="수정 취소">
<input type="button" onclick="deleteCheck();" value="회원탈퇴">

</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>
</body>
</html>