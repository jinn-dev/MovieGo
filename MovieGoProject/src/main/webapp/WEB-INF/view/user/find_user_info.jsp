<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/css/content.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	/* input 박스에 기본값 넣어주고 마우스 클릭시 초기화 */
	$(document).ready(function() {
			$("#findId").click(function() {
				<c:url value="/user/IdCheck" var="idchk"></c:url>
				var url = "${idchk}?id="+$("#joinid").val();
				alert("이메일");
			document.findform.chk.value = "이메일을 입력하세요";

	});
		
	});
</script>
<style>
body {
	background-color: #F2F2F2;
}
</style>
<title>ID/비밀번호 찾기</title>
</head>
<body>
	<div class="mockup-content">
			<div class="content-style-form content-style-form-3">
				<h3>아이디 찾기</h3>
				<form name="findform">
					<p>
						<label>이메일</label><input type="text" id="email">
					</p>
					<p>
					</p>
				
				
				</form>
				
			</div>
			<input type="text" name="chk" id="chk" value="" readonly="readonly">  
				<input type="button" id="findId" value="FIND ID"/>
				<div class="content-style-form content-style-form-3">
					<h3>비밀번호 찾기</h3>
					<form>
						<p>
							<label>아이디</label><input type="text" id="id">
						</p>
						<p>
							<label>이메일</label><input type="text" id="email">
						</p>
						<p>
							<button>FIND PASSWORDDD</button>
						</p>
					</form>
				</div>
			</div>
			
</body>
</html>