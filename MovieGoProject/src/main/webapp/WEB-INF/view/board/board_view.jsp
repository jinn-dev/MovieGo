<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap/bootstrap-theme.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.core.css"  />
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/css/alertify.default.css" id="toggleCSS" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath ()%>/alert/js/alertify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap/bootstrap.js"></script>
<style type="text/css">
.div-button {
	background: #C75C5C;
	color: #F2F2F2;
	border: none;
	letter-spacing: 1px;
	padding: 1.0em;
	font-size: 1.0em;
	outline: none;
}

.div-button:hover {
	background: #4F5D73;
	color: #F2F2F2;
}

#comment_header {
	background: #4F5D73;
	color: #F2F2F2;
	text-align: center;
	font-size: 1.25em;
}

#commentContent{
	width: 1000px;
	height: 48px;
}

.comment_link{
	text-decoration: underline;
}
</style>
<title>MOVIE GO</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<div class="container">
		<center><img width="500" src="<%=request.getContextPath()%>/img/qna.png" /></center>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-responsive">
					<tr>
						<th colspan="4"><c:out value="${board.boardTitle }" /></th>
					</tr>
					<tr>
						<th>작성자</th>
						<td><c:out value="${board.userId}" /></td>
						<th>작성일자</th>
						<fmt:formatDate value="${board.boardDate}" type="date" var="date" />
						<td align="left"><c:out value="${date}" /></td>
					</tr>
					<tr>
						<td colspan="4" align="left" height="300"><c:out
								value="${board.boardContent }" /></td>
					</tr>
					<tr>
						<td colspan="4" align="right"><c:if
								test="${board.userId==log.userId }">
								<c:url value="/board/modify?boardId=${board.boardId }" var="url"></c:url>
								<a href="${url }"><button class="div-button btn btn-primary">수정</button></a>
								<button class="div-button btn btn-primary" id="board_delete">삭제</button>
							</c:if> <c:url value="/board" var="url"></c:url>
							<a href="${url }"><button class="div-button btn btn-primary">목록</button></a></td>
					</tr>
					<tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			<div class="comment_wrap">
				<table class="table table-bordered table-striped table-responsive">
					<tr><th colspan="5" id="comment_header">COMMENT</th></tr>
					<c:forEach items="${comment }" var="comments" varStatus="status">
						<tr>
							<td><c:out value="${comments.userId }" /></td>
							<fmt:formatDate value="${comments.commentDate }" type="both"
								var="date" />
							<td colspan="4"><c:out value="${date }" /></td>
						</tr>
						<tr>
						<td colspan="5" align="left" height="25">
						<div class="comment_modify_${status.index }">
							<c:out value="${comments.commentContent }"/>
							<c:if test="${comments.userId==log.userId }">
								<div class="pull-right">
										 <a onclick="javascript:commentLoad(${comments.commentId},${status.index })" 
										 class="comment_link">수정</a> 
								<a onclick="javascript:commentDelete(${comments.commentId})" 
										 class="comment_link">삭제</a>
								</div>
							</c:if>
						</div>		
						</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			<table class="table"><tr><td>
				<form method="POST" id="writeForm">
					<input type="hidden" name="boardId" value="${board.boardId}" />
					<input type="hidden" name="userId" value="${log.userId }" />
					<div class="pull-left">
					<input name="commentContent" class="form-control" id="commentContent" onkeypress="if(event.keyCode==13) {commentWrite(); return false;}" placeholder="댓글을 입력해주세요."/></div>
					<div class="pull-right">
					<button type="button" class="div-button btn btn-primary" style="height:48px;"onclick="commentWrite()">댓글쓰기</button>
			   		</div>
			    </form>
			   </td></tr>
			</table> 
			</div>
		</div>
	</div>
<script>

function commentLoad(id, index){
	var param = "commentId="+id;
	<c:url value="/comment/modify" var="url"/>
	var xhr = new XMLHttpRequest();
	   xhr.onreadystatechange = function() {
	      if (xhr.readyState==4 && xhr.status==200){
			var jsonobj = JSON.parse(xhr.responseText);
			<c:url value="/comment/modified" var="action"/>
			var output= '<form method="POST" id="modifyform" name="modifyform" action="${action}">'+
			'<textarea id="commentContent" name="commentContent" onkeypress="if(event.keyCode==13) {commentModify(); return false;}">'+jsonobj.commentContent+'</textarea>';
			output+= '<input type="hidden" id="commentId" name="commentId" value="'+jsonobj.commentId+'"/>'+
			'<input type="hidden" id="boardId" name="boardId" value="'+jsonobj.boardId+'"/>'; 
			output+= '<div class="pull-right"><a onclick="commentModify()" class="btn btn-success">수정</a>&nbsp';
			output+= '<a class="div-button btn btn-primary">수정취소</a></div></form>';
			$(".comment_modify_"+index).html(output);
	      }
	   }
	var url = "${url}";
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("commentId="+id);
}

function commentWrite(){
	var param = $("#writeForm").serialize();
	var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
		  if (xhr.readyState==4 && xhr.status==200){
			  var jsonobj = JSON.parse(xhr.responseText); 
			  var output = '<table class="table table-bordered table-striped table-responsive">'+
			  '<tr><th colspan="5" id="comment_header">COMMENT</th></tr>';
			  for(var i = 0; i<jsonobj.length;i++){
				var date = new Date();
				date.setTime(jsonobj[i].commentDate);
				if(date.getHours()<12){
					var ampm = "오전";
					if(date.getMinutes()<10){
						var minutes = '0'+date.getMinutes();
					}
					else{
						var minutes = date.getMinutes();
					}
					if(date.getSeconds()<10){
						var seconds = '0'+date.getSeconds();
					}
					else{
						var seconds = date.getSeconds();
					}
					var time = date.getHours()+':'+minutes+':'+seconds;
				}
				else{
					var ampm = "오후";
					
					if(date.getMinutes()<10){
						var minutes = '0'+date.getMinutes();
					}
					else{
						var minutes = date.getMinutes();
					}
					if(date.getSeconds()<10){
						var seconds = '0'+date.getSeconds();
					}
					else{
						var seconds = date.getSeconds();
					}
					var time = (date.getHours()-12)+':'+minutes+':'+seconds;
				}
				var showdate = date.getFullYear()+'. '+(date.getMonth()+1)+'. '+date.getDate()+' '+ampm+' '+time;
				output+='<tr><td>'+jsonobj[i].userId+'</td>'+
						'<td colspan="4">'+showdate+'</td></tr><tr>'+
					'<td colspan="5" align="left" height="25">'+
					'<div class="comment_modify_'+i+'">'+
						jsonobj[i].commentContent;
					if(jsonobj[i].userId=='<c:out value="${log.userId}"/>'){
						output+='<div class="pull-right">'+
								'<a onclick="javascript:commentLoad('+jsonobj[i].commentId+','+i+')" '+
								' class="comment_link">수정</a>&nbsp'+
								'<a onclick="javascript:commentDelete('+jsonobj[i].commentId+','+i+')" '+
								' class="comment_link">삭제</a>'+
								'</div>';
					}
					output+='</div></td></tr>';		
			  }
			output+='</table>';  
			$(".comment_wrap").html(output);
			$("#commentContent").val("");
		  }
	  }
	  	var url = "<%=request.getContextPath()%>/comment/write";
		xhr.open("post", url, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(param);
}

function commentDelete(id){
	var param = "commentId="+id;
	<c:url value="/comment/drop" var="url"/>
	alertify.confirm("댓글을 삭제하시겠습니까?", function(e){ 
		if(e){
			var xhr = new XMLHttpRequest();
			 xhr.onreadystatechange = function() {
		 	 if (xhr.readyState==4 && xhr.status==200){
				  var jsonobj = JSON.parse(xhr.responseText);
				  var output = '<table class="table table-bordered table-striped table-responsive">'+
				  '<tr><th colspan="5" id="comment_header">COMMENT</th></tr>';
			 
				  for(var i = 0; i<jsonobj.length;i++){
					
					var date = new Date();
					date.setTime(jsonobj[i].commentDate);
					if(date.getHours()<12){
						var ampm = "오전";
						if(date.getMinutes()<10){
							var minutes = '0'+date.getMinutes();
						}
						else{
							var minutes = date.getMinutes();
						}
						if(date.getSeconds()<10){
							var seconds = '0'+date.getSeconds();
						}
						else{
							var seconds = date.getSeconds();
						}
							var time = date.getHours()+':'+minutes+':'+seconds;
						}
						else{
							var ampm = "오후";
							if(date.getMinutes()<10){
								var minutes = '0'+date.getMinutes();
							}
							else{
								var minutes = date.getMinutes();
							}
							if(date.getSeconds()<10){
								var seconds = '0'+date.getSeconds();
							}
							else{
								var seconds = date.getSeconds();
							}
							var time = (date.getHours()-12)+':'+minutes+':'+seconds;
							}
					
							var showdate = date.getFullYear()+'. '+(date.getMonth()+1)+'. '+date.getDate()+' '+ampm+' '+time;
				
							output+='<tr><td>'+jsonobj[i].userId+'</td>'+
									'<td colspan="4">'+showdate+'</td></tr><tr>'+
									'<td colspan="5" align="left" height="25">'+
									'<div class="comment_modify_'+i+'">'+
									jsonobj[i].commentContent;
								
								if(jsonobj[i].userId=='<c:out value="${log.userId}"/>'){
									output+='<div class="pull-right">'+
										'<a onclick="javascript:commentLoad('+jsonobj[i].commentId+','+i+')" '+
										' class="comment_link">수정</a>&nbsp'+
										'<a onclick="javascript:commentDelete('+jsonobj[i].commentId+')" '+
										' class="comment_link">삭제</a>'+
										'</div>';
								}
								
								output+='</div></td></tr>';		
				  			}
					output+='</table>';  
					$(".comment_wrap").html(output);
		 	 }
	 }
	 var url= "${url}";
		xhr.open("post", url, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(param);
	}else{}
	});
	return false;
}

function commentModify(){
	var str = $("#modifyform").serialize();
	alertify.confirm("댓글을 수정하시겠습니까?", function(e){ 
	if(e){
	var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
		  if (xhr.readyState==4 && xhr.status==200){
			  var jsonobj = JSON.parse(xhr.responseText); 
			  var output = '<table class="table table-bordered table-striped table-responsive">'+
			  '<tr><th colspan="5" id="comment_header">COMMENT</th></tr>';
			  for(var i = 0; i<jsonobj.length;i++){
				
				var date = new Date();
				date.setTime(jsonobj[i].commentDate);
				if(date.getHours()<12){
					var ampm = "오전";
					if(date.getMinutes()<10){
						var minutes = '0'+date.getMinutes();
					}
					else{
						var minutes = date.getMinutes();
					}
					if(date.getSeconds()<10){
						var seconds = '0'+date.getSeconds();
					}
					else{
						var seconds = date.getSeconds();
					}
					var time = date.getHours()+':'+minutes+':'+seconds;
				}
				else{
					var ampm = "오후";
					
					if(date.getMinutes()<10){
						var minutes = '0'+date.getMinutes();
					}
					else{
						var minutes = date.getMinutes();
					}
					if(date.getSeconds()<10){
						var seconds = '0'+date.getSeconds();
					}
					else{
						var seconds = date.getSeconds();
					}
					var time = (date.getHours()-12)+':'+minutes+':'+seconds;
				}
				var showdate = date.getFullYear()+'. '+(date.getMonth()+1)+'. '+date.getDate()+' '+ampm+' '+time;
				
				output+='<tr><td>'+jsonobj[i].userId+'</td>'+
						'<td colspan="4">'+showdate+'</td></tr><tr>'+
					'<td colspan="5" align="left" height="25">'+
					'<div class="comment_modify_'+i+'">'+
						jsonobj[i].commentContent;
					if(jsonobj[i].userId=='<c:out value="${log.userId}"/>'){
						output+='<div class="pull-right">'+
								'<a onclick="javascript:commentLoad('+jsonobj[i].commentId+','+i+')" '+
								' class="comment_link">수정</a>&nbsp'+
								'<a onclick="javascript:commentDelete('+jsonobj[i].commentId+')" '+
								' class="comment_link">삭제</a>'+
								'</div>';
					}
					output+='</div></td></tr>';		
			  }
			output+='</table>';  
			$(".comment_wrap").html(output);
		  }
	  }
	var url= $("#modifyform").attr("action");
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(str);
	} else{}
	});
	return false;
}
</script>
</body>
</html>