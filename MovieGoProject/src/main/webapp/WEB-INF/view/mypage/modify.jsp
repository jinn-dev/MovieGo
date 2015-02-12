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
		 location.href="<%=request.getContextPath()%>/main";
		}

	}
</script>
<style type="text/css">
#submenu {
	width: 30%;
	float: right;
}

#modufy {
	width: 70%;
	float: right;
}
</style>
<jsp:include page="/WEB-INF/view/user/header.jsp" />


<body>
<div id="modify">
		개인정보수정<br>
		<c:url value="/update" var="action"></c:url>
		 <form:form modelAttribute="user" method="post" action="${action }">
		<label>아이디</label><form:input path="userId"/><br>
		<label>비밀번호</label><form:input path="userPwd" /> <br>
		<label>EMAIL</label><form:input path="userEmail" /><br>
		<label>생년월일</label><form:input path="userBirthday" /><br>
		<input type="submit" id="update" name="_event_confirmed" value="수정 확인">
		<input type="button" value="수정 취소">
		<input type="button" onclick="deleteCheck();" value="회원탈퇴">
		</form:form> 
		
 		<%--<form:form modelAttribute="user" method="post" action="${action }">
		<label>아이디</label><form:input path="userId" /><br>
		<label>비밀번호</label><form:input path="userPwd"/> <br>
		<label>EMAIL</label><form:input path="userEmail" /><br>
		<label>생년월일</label><form:input path="userBirthday" /><br>
		<input type="button" value="수정 확인">
		<input type="button" value="수정 취소">
		<input type="button" onclick="deleteCheck();" value="회원탈퇴">
		</form:form> --%>
</div>
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
	</div>
</body>
</html>