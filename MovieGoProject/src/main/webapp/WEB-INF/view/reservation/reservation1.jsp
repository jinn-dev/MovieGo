<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style>
table, td, th {
	border: 1px solid black;
}
table {
	width: 75%;
}
th {
	height: 70px;
}

td, th {
	text-align: center;
}

</style>
<script type="text/javascript">

function selectedVal() {
	alert(" >???");
	var theater = $(":input:radio[name=thChk]:checked").val(); 
	var movie = $(":input:radio[name=mvChk]:checked").val();
	alert("극장선택값 : "+theater);
	alert("영화선택값 : "+movie);
}

function chk_seledVal(){
    var form = document.frm;

    var thval = "";
    var mvval = "";
    var dtval = "";
    var tmval = "";

	 if( frm.thChk.length == null ){
         if(frm.thChk.checked){
        	 thval = frm.thChk.value;
            }else{
            	thval ="";
         }

        }else{
         for(i =0 ;i < frm.thChk.length;i++){
             if(frm.thChk[i].checked == true){
            	 thval = frm.thChk[i].value;
             }
         }
        }

        if( frm.mvChk.length == null ){
         if(frm.mvChk.checked){
        	 mvval = frm.mvChk.value;
            }else{
            	mvval ="";
         }

        }else{
         for(i =0 ;i < frm.mvChk.length;i++){
             if(frm.mvChk[i].checked == true){
            	 mvval = frm.mvChk[i].value;
             }
         }
        }

        if( frm.dtChk.length == null ){
            if(frm.dtChk.checked){
           	 dtval = frm.dtChk.value;
               }else{
               	dtval ="";
            }

           }else{
            for(i =0 ;i < frm.dtChk.length;i++){
                if(frm.dtChk[i].checked == true){
               	 dtval = frm.dtChk[i].value;
                }
            }
           }

            if( frm.tmChk.length == null ){
        	     if(frm.tmChk.checked){
        	    	 tmval = frm.tmChk.value;
        	        }else{
        	        	tmval ="";
        	     }

        	    }else{
        	     for(i =0 ;i < frm.tmChk.length;i++){
        	         if(frm.tmChk[i].checked == true){
        	        	 tmval = frm.tmChk[i].value;
        	         }
        	     }
        	    }
  
           if(thval ==""){
               alert("영화관을 선택하세요");
               
           }
           else if(mvval ==""){
               alert("영화를 선택하세요");
               
           }
           else if(dtval ==""){
               
               alert("날짜를 선택하세요");
           }
           
           else if(tmval ==""){
      	     
   	        alert("시간을 선택하세요");
   	    }
           else {
        		location.href="reservation2.jsp"   
           }
        	    
}
</script>
</head>


<body>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<h1> '아이디: ${log.userId }' 영화 예매 </h1>
<form name="frm">
<%-- <c:url value="/reserve/seat" var="action"></c:url>
<form:form modelAttribute="rsv" method="post" action="${action }"> --%>
<input type="reset" value="새로" height="70">

<table align="center">
<tr><th>영화관</th><th>영화</th><th>날짜</th><th>시간</th></tr>
<tr>
<td height="400px">
  <c:forEach items="${theaters }" var="theater">`	
  <input type="radio" name="thChk" value="${theater.theaterId }"> 
  <c:out value="${theater.theaterName }"/><br>
  </c:forEach>
</td>
<td>
   <c:forEach items="${nowmovies }" var="nowmovie">
  <input type="radio" name="mvChk" value="${nowmovie.key }"> 
  <c:out value="${nowmovie.value }"/><br>
  </c:forEach>
</td>
<td>
  <input type="radio" name ="dtChk" value="1">+1(내일)<br>
  <input type="radio" name ="dtChk" value="2">+2<br>
  <input type="radio" name ="dtChk" value="3">+3<br>
  <input type="radio" name ="dtChk" value="4">+4<br>
  <input type="radio" name ="dtChk" value="5">+5<br>
  <input type="radio" name ="dtChk" value="6">+6<br>
</td>
<td>
<!-- 6은 오전6시/ 18은 오후6시로 가정 -->
 <input type="radio" name ="tmChk" value="6">오전<br>
  <input type="radio" name ="tmChk" value="18">오후<br>
</td>
</tr>
<tr>
<td colspan="4" height="100px">

<input type="button" value="좌석선택" name="seat" onclick="javascript:selectedVal();" />
</td>
</table>
<%-- </form:form> --%>
</form>

<body>


</body>
</html>