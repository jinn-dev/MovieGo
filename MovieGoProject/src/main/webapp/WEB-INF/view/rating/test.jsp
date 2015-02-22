<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rating.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style>
</style>
<script type="text/javascript">
        $(document).ready(function() {
                <c:url value="/rating.ajax" var="url"/>
                var param="page"+"="+0;
                $.ajax({
                        url:'${url}',
                                type:'GET',     
                                cache : false,
                                async : false,
                                data : param,
                                dataType : 'json',
                                 success : function(data) {
									var output = '<table class="movie-table"><tr><th>영화 평가하기</th></tr><tr>';
                                         for(var i=0; i<6; i++){
											output+='<td><div class="grid">'+
											'<figure class="effect-zoe">'+
											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
											'<p class="icon-links">'+
											'<a href="#"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
											'<a href="#"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a></p></figcaption></td>';
                                         } 
                                         output+='</tr><tr>';
                                         for(var i=6; i<12; i++){
 											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                          }
                                         output+='</tr><tr>';
                                         for(i=12; i<18; i++){
 											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                          } 
                                         output+='</tr><tr>';
                                         for(i=18; i<24; i++){
 											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                          } 
                                         output+='</tr><tr>';
                                         for(i=24; i<30; i++){
 											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                          } 
                                         output+='</tr><tr>';
                                         for(i=30; i<36; i++){
 											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                          } 
                                         output+='</tr><tr>';
                                         for(i=36; i<42; i++){
  											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                           } 
                                         output+='</tr><tr>';
                                         for(i=42; i<48; i++){
  											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                           } 
                                         output+='</tr><tr></table>';
                                         $('#movies').html(output);
                                         $("#page").val(48);
                                 },
                        error : function(request, status, error) {
                                if(request.status != '0') {
                                        alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error); 
                                }       
                        }
                 }); 
                
         $(window).scroll(function () {
             var scrollHeight = $(window).scrollTop() + $(window).height();
             var documentHeight = $(document).height();
             if (scrollHeight + 200 >= documentHeight) {
            	  <c:url value="/rating.ajax" var="url"/>
                  var page = $('#page').val();
                  var param = "page"+"="+page;
                  $.ajax({
                                 url:'${url}',
                                         type:'GET',     
                                         cache : false,
                                         async : false,
                                         data : param,
                                         dataType : 'json',
                                          success : function(data) {
                                        	  var output = '<table class="movie-table"><tr>';
                                              for(var i=0; i<6; i++){
     											output+='<td><div class="grid">'+
     											'<figure class="effect-zoe">'+
     											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
     											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
     											'<p class="icon-links">'+
     											'<a href="#"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
     											'<a href="#"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a></p></figcaption></td>';
                                              } 
                                              output+='</tr><tr>';
                                              for(var i=6; i<12; i++){
      											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                               }
                                              output+='</tr><tr>';
                                              for(i=12; i<18; i++){
      											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                               } 
                                              output+='</tr><tr>';
                                              for(i=18; i<24; i++){
      											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                               } 
                                              output+='</tr><tr>';
                                              for(i=24; i<30; i++){
      											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                               } 
                                              output+='</tr><tr>';
                                              for(i=30; i<36; i++){
      											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                               } 
                                              output+='</tr><tr>';
                                              for(i=36; i<42; i++){
       											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                                } 
                                              output+='</tr><tr>';
                                              for(i=42; i<48; i++){
       											output+='<td><img src="'+data[i].movieImgUrl+'"/></td>';			
                                                } 
                                              output+='</tr><tr></table>';
                                              $('#movies').html(output);
                                              $("#page").val(48);
                                          },
                                 error : function(request, status, error) {
                                         if(request.status != '0') {
                                                 alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error); 
                                         }       
                                 }
                          }); 
           		  }
         });
         
         $( window ).scroll( function() {
        	  if ( $( this ).scrollTop() > 200 ) {
        	    $( '.top' ).fadeIn();
        	  } else {
        	    $( '.top' ).fadeOut();
        	  }
        });
         
        $( '.top' ).click( function() {
        	 $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        	 return false;
        	} );
         
 });
</script>
</head>
<body>
 <jsp:include page="/WEB-INF/view/user/header.jsp" />
 <a href="#" class="top">Top</a>
 <input type="hidden" var="${page }" id="page" name="page"/>
 <div id="movies"></div>
</body>
</html>