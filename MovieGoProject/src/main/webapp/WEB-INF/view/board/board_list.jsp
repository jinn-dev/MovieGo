<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$.ajax({
		type : "POST",
		url : "<c:url value='/SessionCheck'/>",
		dataType : "text",
		data : "",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8"
	}).done(function(data) {
		if (data == "") {
			location.href = "로그인단으로이동";
		} else {
			onload_pay(); //스크립트 실행
		}
	});
</script>
<title>MOVIE GO</title>
</head>
<body>
   <jsp:include page="/WEB-INF/view/user/header.jsp" />
 	<header>
		<center><img width="500" src="<%=request.getContextPath() %>/img/qna.png"/></center>
	</header>
   <div class="list-table">
   <table id="list">
      <tr>
      <td colspan="4" align="right">
         <c:url value="/board/write" var="url" />
         <a href="${url }"><button class="div-button">WRITE</button></a>
      </td>
      </tr>
      <tr>
         <th>
            <div>
               <b>NO.</b>
            </div>
         </th>
         <th >
            <div>
               <b>TITLE</b>
            </div>
         </th>
         <th>
            <div>
               <b>WRITER</b>
            </div>
         </th>
         <th>
            <div>
               <b>REG DATE</b>
            </div>
         </th>
      </tr>
      <c:forEach items="${list }" var="list">
      <tr>
         <td width="55">
         <c:out value="${list.boardId}"/></td>
         <td align=left width="318">
         <c:url value="/board/view?boardId=${list.boardId}" var="url"/>
         <a href="${url }" target=_self><c:out value="${list.boardTitle}"/></a></td>
         <td width="110"><c:out value="${list.userId}"/></td>
         <fmt:formatDate value="${list.boardDate}" type="date" var="date"/>         
         <td width="119"><c:out value="${date}"/></td>
      </tr>
      </c:forEach>
   </table>
   </div>
</body>
</html>