<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mypage/modify.css"/>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css">
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<body>
<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-responsive">
		
			<tr>
				<th>아이디</th><th>이메일</th><th>생일</th><th>쿠폰</th><th>포인트</th><th>탈퇴</th>
			</tr>
							 <c:forEach items="${userlist }" var="list">
  		
  		<tr>
         <td width="55">
         <c:out value="${list.userId}"/></td>
         <td width="55">
         <c:out value="${list.userEmail}"/></td>
         <td width="200">
         <fmt:formatDate value="${list.userBirthday }" type="date" var="date"/>		
         
         <c:out value="${date}"/></td>
         <td width="55">
         <c:out value="${list.userCoupon}"/></td>
         <td width="55">
         <c:out value="${list.userPoint}"/></td>
<%--           <td width="55">
          <div class="col-lg-offset-2 col-lg-10">
   		<button type="button" onclick="deleteCheck(${list.userId})" class="div-button btn btn-primary">회원탈퇴</button>
		</div>
			</td> --%>
			
      </tr>
      </c:forEach>
		</table>
	</div>
	</div>
	</div>
	<%-- <script>
	function deleteCheck(id) {
		
		
		 alertify.confirm("회원탈퇴하시겠습니까?", function(e){
				if(e){
				location.href="<%=request.getContextPath()%>/deleteuser?userId="+id;
					}
				 else {
								}
							});
			return false;
		}
	</script> --%>
</body>
</html>