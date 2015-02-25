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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mypage/modify.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.core.css"  />
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.default.css" id="toggleCSS" />
<script src="<%=request.getContextPath ()%>/alert/js/alertify.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>MOVIEGO</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	
	/* 수정확인시 유효성 체크*/
	$("#submitB").click(function() {
	if ($("#pw1").val() != $("#pw2").val()) {
		alertify.alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
		event.preventDefault();
		$("#pw2").focus();
	}
	});
});
</script>

<jsp:include page="/WEB-INF/view/user/header.jsp" />
<body>
	<div class="modify-form">
		<table>
		
			<tr>
				<th><div id="modify-form-header"><img width="350" height="175" src="<%=request.getContextPath() %>/img/user_modify.png"/></div></th>
			</tr>
			<c:url value="/update" var="action"></c:url>
						<form:form modelAttribute="user" method="post" action="${action }" name="modifyFrm">
			<tr>
				<td>
					<div class="mygroup">
							<label>아이디</label>
							<form:input type="text" path="userId" readonly="true" />
							<br>
							<label>비밀번호</label>
							<form:input type="password" path="userPwd" id="pw1"/>
							<br>
							<label>비밀번호 확인</label>
							<form:input type="password" path="" id="pw2" onblur="javascript:passchk()"/>
							<input type="text" name="chk" id="confirm" value="비밀번호를 입력하세요" readonly="readonly">
							<br>
							<label>EMAIL</label>
							<form:input type="email" path="userEmail" />
							<br>
							<label>생년월일</label>
							<form:input type="date" path="userBirthday" id="userBirthday" />
							<br>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<button type="submit" name="_event_confirmed" id="submitB" class="div-button">수정확인</button>
					</form:form>
					<button onclick="deleteCheck()" class="div-button">회원탈퇴</button>	
				</td>
			</tr>
		</table>
	</div>
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
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
				}else {
		      }
		});
    return false;
   }
</script>
</body>
</html>