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
			var email = $("#email").val();
			var param="userEmail" +"="+ $("#email").val();
			$.ajax({
				url:'http://localhost:9090/MovieGoProject/idcheck',
 				type:'GET',	
 				data : param,
 				cache : false,
				async : false,
 				dataType : 'text',
			    success : function(data) {
			    	if(data) {
			    		  $("#idCheckResultView").html("<b>아이디는 " + data + " 입니다.<b>"); 
			    		  event.preventDefault();					}				   
				    
			    	else {
			    		$("#idCheckResultView").html("<b>찾는 아이디는가 없습니다.<b>"); 
			    		event.preventDefault();
			    	}

				},
			
				error : function(request, status, error) {
					if(request.status != '0') {
						alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
					}	
				}
				
			 });
		})
				$("#findPassword").click(function() {
					var email = $("#email").val();
					var id = $("#id").val();
					var param="userId" +"="+ $("#id").val() +"&userEmail" +"="+ $("#em").val();
					$.ajax({
						url:'http://localhost:9090/MovieGoProject/passwordCheck',
		 				type:'GET',	
		 				data : param,
		 				cache : false,
						async : false,
		 				dataType : 'text',
					    success : function(data) {
					    	if(data) {
						    	  $("#passwordCheckResultView").html("<b>비밀번호는" + data + " 입니다.<b>"); 
						    	  event.preventDefault();
							}
					    	else {
					    		$("#passwordCheckResultView").html("<b>찾는 비밀번호가 없습니다.<b>"); 
					    		event.preventDefault();
					    	}

						},
					
						error : function(request, status, error) {
							if(request.status != '0') {
								alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
							}	
						}
						
					 }); 
		
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
						<label>이메일</label><input type="text" id="email" name="email">
					</p>
					<p>
					<button id="findId">FIND ID</button></p>
					<span class="style4" id="idCheckResultView"></span> 					
	
				</form>
				
			</div>
			
				<div class="content-style-form content-style-form-3">
					<h3>비밀번호 찾기</h3>
					<form>
						<p>
							<label>아이디</label><input type="text" id="id" name="id">
						</p>
						<p>
							<label>이메일</label><input type="text" id="em" name="em">
						</p>
						<p>
						<button id="findPassword">FIND PASSWORD</button></p>
						<span class="style4" id="passwordCheckResultView"></span> 		
						
					</form>
				</div>
			</div>
			
</body>
</html>