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
<title>개인정보수정</title>
</head>
<script type="text/javascript">

function deleteCheck() {

	 alertify.confirm("회원탈퇴하시겠습니까?", function (e) {
			if(e) {
				 location.href="<%=request.getContextPath()%>/deleteuser?userId=${user.userId }";
			 
			}else {

	        }
	    });
	    return false;
	    
	}
</script>

<jsp:include page="/WEB-INF/view/user/header.jsp" />
<body>
	<div class="modify-form">
		<table>
		
			<tr>
				<th><div id="modify-form-header"><img width="350" height="175" src="<%=request.getContextPath() %>/img/user_modify.png"/></div></th>
			</tr>
			<c:url value="/update" var="action"></c:url>
						<form:form modelAttribute="user" method="post" action="${action }">
			<tr>
				<td>
					<div class="mygroup">
						
							<label>아이디</label>
							<form:input type="text" path="userId" readonly="true" />
							<br>
							<label>비밀번호</label>
							<form:input type="password" path="userPwd" />
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
					<button type="submit" name="_event_confirmed" class="div-button">수정확인</button>
					 <button class="div-button" type="reset">다시작성</button>
					</form:form>
					<button onclick="deleteCheck()" class="div-button">회원탈퇴</button>
				</td>
			</tr>
			
		</table>
	</div>
	<div id="submenu">
		<jsp:include page="submenu.jsp"></jsp:include>
	</div>
</body>
</html>