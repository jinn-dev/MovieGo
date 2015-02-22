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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery.labelinplace.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function deleteCheck() {
	 if(confirm("회원탈퇴하시겠습니까??")) {
		 location.href="<%=request.getContextPath()%>/deleteuser?userId=${user.userId }";
		 
		}
	}
</script>

<style type="text/css">
body{
	width: 100%;
	overflow-y: hidden;
	background-color:#F2F2F2;
	color: #4F5D73;
	
}
#submenu {
	width: 30%;
	float: left;
}

.modify-form {
}

.modify-form table{
	padding: 100px;
	margin: 0 auto;
}

#modify-form-header{
	padding: 0 0 30px 0;
	font-size: 2.0em;
}
.modify-form label{
	display: inline-block;
	width: 100px;
	padding: 10px;
}

#userBirthday{
	width: 146.5px;
}

.div-button {
	background: #C75C5C;
	font-size: 1.0em;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 0.5em;
	outline: none;
	margin: 30px 0 0 0;
}
</style>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<body>
<div class="modify-form">
<table>
	<tr><th><div id="modify-form-header">개인정보수정</div></th></tr>
	<tr>
	<td>
	<div class="mygroup">
		<c:url value="/update" var="action"></c:url>
		 <form:form modelAttribute="user" method="post" action="${action }">
			<label>아이디</label><form:input type="text" path="userId" readonly="true" /><br>
			<label>비밀번호</label><form:input type="password" path="userPwd" /> <br>
			<label>EMAIL</label><form:input type="email" path="userEmail" /><br>
			<label>생년월일</label><form:input type="date" path="userBirthday" id="userBirthday" /><br>
	</div>
	</td>
	</tr>
	<tr>
	<td align="center">
			<button type="submit" name="_event_confirmed" class="div-button">수정확인</button>
			<button type="submit" name="_event_reverse" class="div-button">재입력</button>
		</form:form> 
	<button onclick="deleteCheck()"class="div-button">회원탈퇴</button>
	</td>
	</tr>
</table>
</div>
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
	</div>
</body>
</html>