<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reserve.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
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
<form name="frm" id="frm">
<%-- <c:url value="/reserve/seat" var="action"></c:url>
<form:form modelAttribute="rsv" method="post" action="${action }"> --%>
<table class="reserve-first">
<tr><td colspan="4" align="right" id="first-td">
<!-- 추가: form reset image button  -->
<a href="#" onclick="frm.reset();"><img src="<%=request.getContextPath() %>/img/reserveReset.png"/></a> 
</td></tr>
<tr><th>영화관</th><th>영화</th><th>날짜</th><th>시간</th></tr>
<tr>
<td>
  <c:forEach items="${theaters }" var="theater">	
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
<td colspan="4" align="right">
<!-- 추가: 좌석선택 image button  -->
<input type="image" name="seat" src="<%=request.getContextPath() %>/img/seatSelect.png" onclick="javascript:selectedVal();" />
</td>
</table>
<%-- </form:form> --%>
</form>

<body>


</body>
</html>