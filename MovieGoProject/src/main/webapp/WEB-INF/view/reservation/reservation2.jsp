<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function chk_seledVal(){
/*  선택좌석 alert창으로 뜨는거 구현
 */	
 location.href="payment.jsp"       	    
}
</script>


<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp"" />

<table border="1">
<tr><th>인원/좌석</th></tr>
<tr>
<td>
일반
<select name="adult">
<option value="1">1명</option>
<option value="2">2명</option>
<option value="3">3명</option>
</select>
<br>
청소년
<select name="student">
<option value="1">1명</option>
<option value="2">2명</option>
<option value="3">3명</option>
</select>
<br>
</td>
<td>
선택하신 상영관/영화/시간<br>
건대입구/쏘우/2015-02-06/오전(잔여40석)
</td>
</tr>
<tr>
<td>좌석 그림
</td>
</tr>

</table>
<input type="button" onclick="chk_seledVal();" value="결제하기"></input>
</body>
</html>