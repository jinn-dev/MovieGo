<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

/* function chk_seledVal(){
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
        	    
} */
</script>
</head>


<body>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<form name="frm">
<input type="reset" value="새로" height="70">

<table align="center">
<tr><th>영화관</th><th>영화</th><th>날짜</th><th>시간</th></tr>
<tr>
<td height="400px">
 <input type="radio" name ="thChk" value="건대입구점">건대입구점<br>
  <input type="radio" name ="thChk" value="군자점">강변점<br>
  <input type="radio" name ="thChk" value="강남점">군자점<br>
</td>
<td>
 <input type="radio" name ="mvChk" value="쎼씨봉">쎼씨봉<br>
  <input type="radio" name ="mvChk" value="강남">강남<br>
  <input type="radio" name ="mvChk" value="군도">군도<br>
</td>
<td>
 <input type="radio" name ="dtChk" value="1일">1일<br>
  <input type="radio" name ="dtChk" value="2일">2일<br>
  <input type="radio" name ="dtChk" value="3일">3일<br>
</td>
<td>
 <input type="radio" name ="tmChk" value="오전">오전<br>
  <input type="radio" name ="tmChk" value="오후">오후<br>
<!-- <input type="button" onclick="tm_seledVal();" value="확인"></input> -->
</td>
</tr>
<tr>
<td colspan="4" height="100px">
아이디: ${log.userId }
<input type="submit" />

</td>

</table>

<!-- <input type="button" onclick="chk_seledVal();" value="좌석선택"></input> -->

 </form>

<body>


</body>
</html>