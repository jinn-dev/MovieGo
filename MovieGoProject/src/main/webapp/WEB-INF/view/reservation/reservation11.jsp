<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mvg.entity.Theater" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function selectedVal() {
	var checkedValue = $("input[type=radio][name=thChk]:checked").val()
	alert(checkedValue);
}


</script>

</head>
<body>

<%
//극장 선택에서 cnt만큼 반복문돌면서 radio버튼만들고
//<input type="radio" name ="thChk" id="" value=""><br>
//value에 set
%>

<table align="center">
<tr><th>영화관</th><th>영화</th><th>날짜</th><th>시간</th></tr>
<tr>
<td>
<input type="radio" name ="thChk" id="kk" value="건대입구점"><br>
<input type="radio" name ="thChk" id="gb" value="강변점"><br>
<input type="radio" name ="thChk" id="gj" value="군자점"><br>
</td>

<td>
 <input type="radio" name ="mvChk" id="item1" value="쎄씨봉"><br>
 <input type="radio" name ="mvChk" id="item2" value="강남"><br>
 <input type="radio" name ="mvChk" id="item3" value="군도"><br>
</td>

<td>
 <input type="radio" name ="dtChk" id="day1" value="1일"><br>
  <input type="radio" name ="dtChk" id="day2" value="2일"><br>
  <input type="radio" name ="dtChk" id="day3" value="3일"><br>
</td>

<td>
 <input type="radio" name ="tmChk" id="am" value="오전"><br>
  <input type="radio" name ="tmChk" id="pm" value="오후"><br>
<input type="button" onclick="javascript:selectedVal();" value="확인"></input>
</td>
</tr>
</table>

<table border="1">
		<tr>
			<th>상영영화코드</th>
		</tr><tr>
		<c:forEach items="${nowmovies }" var="nowmovies">
			
				<td><c:out value="${nowmovies}" />
			
		</c:forEach>
	</tr></table>
</body>
</html>