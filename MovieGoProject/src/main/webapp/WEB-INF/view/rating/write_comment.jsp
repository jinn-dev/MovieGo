<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코멘트쓰기</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* input 박스에 기본값 넣어주고 마우스 클릭시 초기화 */ 
	$(document).ready(function() {
		$("#comment").focus(function() {
			$(this).val('');
		}).blur(function() {
			if ($(this).val() == "") {
				$(this).val("");
			}
		});
	});
</script>
<body>
별점<input type="text" id="star" name="star" value="별점 입력하세요. ">
코멘트<input type="text" id="comment" name="comment" value="코멘트를 입력하세요. ">
<input type="submit" value="입력"/>
</body>
</html>