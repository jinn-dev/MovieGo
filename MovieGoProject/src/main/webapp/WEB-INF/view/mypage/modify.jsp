<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.mvg.entity.User" %>

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
 	<jsp:include page="/WEB-INF/view/user/header.jsp" />

<body>

<%-- <form:form modelAttribute="editDept" method="post" action="${action }">
	<label>부서명 </label> : <form:input path="departmentId"/><br> 
	<label>부서ID </label> : <form:input path="departmentName"/><br>
	<label>관리자ID </label> : <form:input path="managerId"/><br>
	<label>부서위치 </label> : <form:input path="locationId"/><br> 
	<button type="submit" name="proceed">다음</button>
</form:form> --%>
<div id="modify">
개인정보수정<br>
<c:url value="/mypage" var="action"></c:url>
<form:form modelAttribute="log" method="post" action="${action }">
<label>ID</label><form:input path="${log.userId}"/><br> 
<label>비밀번호</label><form:input path="${log.userPwd}"/><br> 
<label>비밀번호 확인</label><input type="password"> <br>
<label>EMAIL</label><form:input path="${log.userEmail}"/> <br>
<label>생년월일</label><form:input path="${log.userBirthday}"/> <br>
<input type="button" value="수정 확인">
<input type="button" value="수정 취소">
<input type="button" onclick="deleteCheck();" value="회원탈퇴">
</form:form>

</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>
</body>
</html>