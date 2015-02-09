<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/component.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/content.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* input 박스에 기본값 넣어주고 마우스 클릭시 초기화 */ 
	$(document).ready(function() {
		$("#email").focus(function() {
			$(this).val('');
		}).blur(function() {
			if ($(this).val() == "") {
				$(this).val("이메일을 입력해주세요.");
			}
		});
		$("#id").focus(function() {
			$(this).val('');
		}).blur(function() {
			if ($(this).val() == "") {
				$(this).val("아이디를 입력해주세요.");
			}
		});
	});
</script>
<style>
body{
	background-color: #C9C9C9;
}
</style>
<title>ID/비밀번호 찾기</title>
</head>
<body>
<div class="content-style-text-3  content-style-form-3">
<h2>아이디 찾기</h2>
<form>
<label>Email</label><input type="text" id="email" value="이메일을 입력해주세요.">
<button id="findemail">FIND ID</button>
</form>
<h2>비밀번호 찾기</h2>
<form>
<p>
<label>ID</label><input type="text" id="id" value="아이디를 입력해주세요."></p>
<p>
<label>Email</label><input type="text" id="email" value="이메일을 입력해주세요."></p>
<button id="findemail">FIND PASSWORD</button>
</form>
</div>
</body>
</html>