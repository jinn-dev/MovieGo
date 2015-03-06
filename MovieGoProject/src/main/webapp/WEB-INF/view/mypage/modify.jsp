<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.mvg.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css">
<!-- Custom CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/alert/css/alertify.core.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/alert/css/alertify.default.css"
	id="toggleCSS" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-2.1.3.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/alert/js/alertify.min.js"></script>
<style type="text/css">
body {
	width: 100%;
	overflow-y: hidden;
	background-color: #F2F2F2;
	color: #4F5D73;
}

.header {
	text-align: center;
}

#confirm {
	margin: auto auto auto 200px;
	border: 0;
	background: rgba(30, 30, 30, 0.0);
}

.div-button {
	background: #C75C5C;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 1.0em;
	font-size: 1.0em;
	outline: none;
}

.div-button:hover {
	background: #4F5D73;
	color: #F2F2F2;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	/* 수정확인시 유효성 체크*/
	$("#submitB").click(function() {
	if ($("#pw1").val() != $("#pw2").val()) {
		alertify.alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
		$("#pw2").focus();
		event.preventDefault();
	}
	});
});
</script>
<title>MOVIE GO</title>
</head>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<body>
	<div class="container">
		<div class="align">
			<img width="500" src="<%=request.getContextPath()%>/img/user_modify.png" />
		</div>
		<c:url value="/update" var="action"></c:url>
		<form:form modelAttribute="user" method="post" action="${action }"
			name="modifyFrm" class="form-horizontal" role="form">
 						 <div class="form-group">
				<label for="userId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<form:input type="text" id="userId" class="form-control"
						path="userId" readonly="true" />
				</div>
			</div>
			<div class="form-group">
				<label for="pw1" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<form:input type="password" class="form-control" path="userPwd"
						id="pw1" />
				</div>
			</div>
			<div class="form-group">
				<label for="pw2" class="col-lg-2 control-label">비밀번호 확인</label>
				<div class="col-lg-10">
					<form:input type="password" path="" id="pw2" class="form-control"
						onblur="javascript:passchk()" />
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<label for="confirm" class="col-lg-2 control-label"></label> <input
						type="text" name="chk" id="confirm" value="비밀번호를 입력하세요"
						class="form-control" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<form:input id="email" type="email" class="form-control"
						path="userEmail" />
				</div>
			</div>
			<div class="form-group">
				<label for="userBirthday" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-10">
					<form:input type="date" class="form-control" path="userBirthday"
						id="userBirthday" />
				</div>
			</div>
			<div class="form-group">
			  <div class="col-lg-offset-2 col-lg-10">
				<button type="submit" name="_event_confirmed" id="submitB" class="div-button btn btn-primary">수정확인</button>&nbsp;&nbsp;
				<button type="button" onclick="deleteCheck()" class="div-button btn btn-primary">회원탈퇴</button>
			</div>
			</div>
			</form:form>
	</div>
	<script type="text/javascript">
	/* 비밀번호 유효성 체크 */
	function passchk() {
		var userPwd = document.modifyFrm.pw1.value;
		var pass2 = document.modifyFrm.pw2.value;
		if (pass2.length == 0 || pass2 == null) {
			document.modifyFrm.chk.value = "비밀번호를 입력하세요";
		} else if (userPwd != pass2) {
			document.modifyFrm.chk.value = "비밀번호가 다릅니다.";
		} 
		else {
			document.modifyFrm.chk.value = "비밀번호가 동일합니다.";
		}
		return;
	}
	
	/* 회원탈퇴시 유효성 체크 */
	function deleteCheck() {
		 alertify.confirm("회원탈퇴하시겠습니까?", function(e){
				if(e){
					if(document.modifyFrm.pw2.value==""){
						alertify.alert("확인 비밀번호를 입력해주세요.");
					}		
					else if(document.modifyFrm.pw1.value!=document.modifyFrm.pw2.value){
						alertify.alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
						event.preventDefault();
						document.modifyFrm.pw2.focus();
					}
					else{
						 location.href="<%=request.getContextPath()%>/deleteuser?userId=${user.userId }";
									}
								} else {
								}
							});
			return false;
		}
	</script>
</body>
</html>