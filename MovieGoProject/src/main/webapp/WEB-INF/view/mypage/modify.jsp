<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.mvg.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
 function deleteCheck() {
	 if(confirm("회원탈퇴하시겠습니까??")) {
		 location.href="<%=request.getContextPath()%>/mypage/del?userId=${user.userId }";
		 
		}

	}
</script>
<style type="text/css">
body{
	width: 75%;
	
}
#submenu {
	width: 30%;
	float: right;
}

.modify-form {
	position: absolute;
	top: 50%;
	left: 50%;
}

.modify-form label{
	display: inline-block;
}
</style>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<body>
<div class="modify-form">
<table>
	<tr><th>개인정보수정</th></tr>
	<tr>
	<td>
		<c:url value="/update" var="action"></c:url>
		 <form:form modelAttribute="user" method="post" action="${action }">
			<label>아이디</label><form:input type="text" path="userId" readonly="true" /><br>
			<label>비밀번호</label><form:input type="password" path="userPwd" /> <br>
			<label>EMAIL</label><form:input type="email" path="userEmail" /><br>
			<label>생년월일</label><form:input type="date" path="userBirthday" /><br>
	</td>
	<tr>
	<td>
			<button type="submit" name="_event_confirmed">수정확인</button>
			<button type="submit" name="_event_reverse">재입력</button>
		</form:form> 
	<button onclick="deleteCheck()">회원탈퇴</button>
	</td>
	</tr>
</table>
</div>
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
	</div>
</body>
</html>