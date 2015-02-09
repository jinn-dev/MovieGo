<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function main(){
/*  선택좌석 alert창으로 뜨는거 구현
 */	
 location.href="main_logined.jsp"       	    
}
function mypage(){
	/*  선택좌석 alert창으로 뜨는거 구현
	 */	
	 location.href="mypage.jsp"       	    
	}
</script>
<body>
예매 완료

<input type="button" onclick="main();" value="메인페이지로"></input>
<input type="button" onclick="mypage();" value="My예매내역"></input>

</body>
</html>