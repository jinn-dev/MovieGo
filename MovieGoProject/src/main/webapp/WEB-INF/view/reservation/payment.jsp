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
/*  포인트는 사용가능한 범위로 입력해주세요 라는 창 뜨기
 */	
 location.href="reservation_complete.jsp"       	    
}

function re_seledVal(){
	/*  포인트는 사용가능한 범위로 입력해주세요 라는 창 뜨기
	 */	
	 location.href="reservation1.jsp"       	    
	}
</script>

<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
결제하기
${seats }
<table border="1">
<tr>
<td>
영화관/영화제목/날짜/시간/인원
</td>
<tr>
<th>
할인수단
</th>
<td>
포인트, 쿠폰
</td>
<td>
10000원
</td>
</tr>
</table>
<input type="button" onclick="re_seledVal();" value="예매다시하기"></input>
<input type="button" onclick="chk_seledVal();" value="결제완료"></input>
</body>
</html>