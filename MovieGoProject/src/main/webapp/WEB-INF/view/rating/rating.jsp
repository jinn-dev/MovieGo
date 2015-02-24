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
.back_to_top{
	position:fixed;
	bottom:0;
	left:50%;
	margin-left:700px;
	text-decoration:none;
	color:#000000;
	background-color:rgba(0, 0, 0, 0.80);
	font-size:12px;
	padding:1em;
	display:none;
}  
.back_to_top:hover{
	background-color:rgba(0, 0, 0, 0.50);
	color:#000;
}
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
											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                         } 
                                         output+='</tr><tr>';
                                          for(var i=6; i<12; i++){
                                        	  output+='<td><div class="grid">'+
  											'<figure class="effect-zoe">'+
  											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
  											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
  											'<p class="icon-links">'+
  											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
  											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
  											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
  										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
  										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
  										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
  										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                           } 
                                           output+='</tr><tr>';
                                         for(i=12; i<18; i++){
                                        	 var movieCode = (data[i].movieCode).toString();
                                        	 output+='<td><div class="grid">'+
 											'<figure class="effect-zoe">'+
 											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
 											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
 											'<p class="icon-links">'+
 											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
 											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
 											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                          } 
                                          output+='</tr><tr>';
                                         for(i=18; i<24; i++){
                                        	 output+='<td><div class="grid">'+
 											'<figure class="effect-zoe">'+
 											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
 											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
 											'<p class="icon-links">'+
 											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
 											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
 											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                          } 
                                          output+='</tr><tr>';
                                         for(i=24; i<30; i++){
                                        	 output+='<td><div class="grid">'+
 											'<figure class="effect-zoe">'+
 											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
 											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
 											'<p class="icon-links">'+
 											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
 											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
 											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                          } 
                                          output+='</tr><tr>';
                                         for(i=30; i<36; i++){
                                        	 var movieCode = (data[i].movieCode).toString();
                                        	 output+='<td><div class="grid">'+
 											'<figure class="effect-zoe">'+
 											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
 											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
 											'<p class="icon-links">'+
 											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
 											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
 											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                          } 
                                          output+='</tr><tr>';
                                         for(i=36; i<42; i++){
                                        	 output+='<td><div class="grid">'+
											'<figure class="effect-zoe">'+
											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
											'<p class="icon-links">'+
											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                         } 
                                      /*    output+='</tr><tr>';
                                          for(i=42; i<48; i++){
                                        	 output+='<td><div class="grid">'+
 											'<figure class="effect-zoe">'+
 											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
 											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
 											'<p class="icon-links">'+
 											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
 											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
 											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
 										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                           }    */
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
                
         var timer = setInterval(function () { scrollOK = true; }, 50); // 스크롤바 로딩 시간값
         var scrollOK = true;
         var requsetSet = true;
        
         $(window).bind('scroll', function scroll(requsetUrl, nextPage, viewType) {
             if (scrollOK) {
                 scrollOK = false;
                 if ($(this).scrollTop() + $(this).height() >= ($(document).height() - 100)) {
                     if(requsetSet) {
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
            											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
            											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
            											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                     } 
                                                     output+='</tr><tr>';
                                                      for(var i=6; i<12; i++){
                                                    	  output+='<td><div class="grid">'+
              											'<figure class="effect-zoe">'+
              											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
              											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
              											'<p class="icon-links">'+
              											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
              											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
              											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
              										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
              										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
              										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
              										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                       } 
                                                       output+='</tr><tr>';
                                                     for(i=12; i<18; i++){
                                                    	 var movieCode = (data[i].movieCode).toString();
                                                    	 output+='<td><div class="grid">'+
             											'<figure class="effect-zoe">'+
             											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
             											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
             											'<p class="icon-links">'+
             											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
             											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
             											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                      } 
                                                      output+='</tr><tr>';
                                                     for(i=18; i<24; i++){
                                                    	 output+='<td><div class="grid">'+
             											'<figure class="effect-zoe">'+
             											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
             											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
             											'<p class="icon-links">'+
             											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
             											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
             											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                      } 
                                                      output+='</tr><tr>';
                                                     for(i=24; i<30; i++){
                                                    	 output+='<td><div class="grid">'+
             											'<figure class="effect-zoe">'+
             											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
             											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
             											'<p class="icon-links">'+
             											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
             											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
             											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                      } 
                                                      output+='</tr><tr>';
                                                     for(i=30; i<36; i++){
                                                    	 var movieCode = (data[i].movieCode).toString();
                                                    	 output+='<td><div class="grid">'+
             											'<figure class="effect-zoe">'+
             											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
             											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
             											'<p class="icon-links">'+
             											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
             											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
             											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                      } 
                                                      output+='</tr><tr>';
                                                     for(i=36; i<42; i++){
                                                    	 output+='<td><div class="grid">'+
            											'<figure class="effect-zoe">'+
            											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
            											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
            											'<p class="icon-links">'+
            											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
            											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
            											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
            										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                     } 
                                                     output+='</tr><tr>';
                                                     for(i=42; i<48; i++){
                                                    	 output+='<td><div class="grid">'+
             											'<figure class="effect-zoe">'+
             											'<img width="180" height="253" src="'+data[i].movieImgUrl+'"/>'+
             											'<figcaption><h2>'+data[i].movieTitleKr+'</h2><hr><br>'+
             											'<p class="icon-links">'+
             											'<a href="javascript:wishlist('+data[i].movieCode+')" class="icon"><i class="fa fa-heart fa-2x"></i>위시리스트</a><br>'+
             											'<a href="javascript:evcomment('+data[i].movieCode+')" class="icon"><i class="fa fa-comment-o fa-2x"></i>코멘트쓰기</a><br>'+
             											'<a href="javascript:ratingInfo(1, '+data[i].movieCode+')" class="icon" id="one"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(2, '+data[i].movieCode+')" class="icon" id="two"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(3, '+data[i].movieCode+')" class="icon" id="three"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(4, '+data[i].movieCode+')" class="icon" id="four"><font size="6">★<font></a>'+
             										    '<a href="javascript:ratingInfo(5, '+data[i].movieCode+')" class="icon" id="five"><font size="6">★<font></a></p></figcaption></td>';
                                                       }  
                                                     output+='</tr><tr></table>';
                                                     $('#movies').append(output);
                                                     $("#page").val(48);
                                                 },
                                        error : function(request, status, error) {
                                                if(request.status != '0') {
                                                        alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error); 
                                                }       
                                        }
                                 }); 
                           
         				
                     }
                 }
             }
         });
         
 });
</script>
</head>
<body>
 <jsp:include page="/WEB-INF/view/user/header.jsp" />
 <a href="#" class="back_to_top">Back to Top</a>
 <input type="hidden" var="${page }" id="page" name="page"/>
 <div id="movies"></div>
 <script>
 var flag = "n"; 
 function ratingInfo(s, m){
 	var mov = m.toString();
 	var str = s + mov;
 	
 	alert(s + "점추가되었습니다.");
 	 flag = "y"; 
 	var code;
 	 var xhr = new XMLHttpRequest();
 		xhr.onreadystatechange = function() {
 			if (xhr.readyState==4&&xhr.status==200) {
 			}
 		}
 				
 	var url = "<%=request.getContextPath()%>/evrating";
 	xhr.open("post", url, true);
 	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
 	xhr.send("code=" + str);
 } 
 
 
$( ".star_rating a" ).click(function() {
	  $(this).parent().children("a").removeClass("on");
	  $(this).addClass("on").prevAll("a").addClass("on");
	     return false;
});

jQuery(document).ready(function() {  
    var offset = 220;  
    var duration = 500;  
    jQuery(window).scroll(function() {  
        if (jQuery(this).scrollTop() > offset) {  
            jQuery('.back_to_top').fadeIn(duration);  
        } else {  
            jQuery('.back_to_top').fadeOut(duration);  
        }  
    });  
      
    jQuery('.back_to_top').click(function(event) {  
        event.preventDefault();  
        jQuery('html, body').animate({scrollTop: 0}, duration);  
        return false;  
    })  
});  
function evcomment(m) {
	var param="movieCode" +"="+m;
	$.ajax({
			url:'http://localhost:9090/MovieGoProject/evcommentchk',
			type:'GET',
			data : param,
			cache : false,
			async : false,
			dataType : 'text',
	    	success : function(data) {
	    	if(data) {
	    		var param2="?movieCode" +"="+m;
	    		<c:url value="/evcomment" var="url"></c:url>
	 			window.open('${url}'+param2,'_blank', "width=800, height=300, toolbar=no, menubar=no, resizable=no");
			}				   
	    	else {
	    		 alert("별점을 먼저 선택하세요.");

	    	}
		},
		error : function(request, status, error) {
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
 });	
}
function wishlist(m) {
 var param="movieCode" +"="+m;
$.ajax({
			url:'http://localhost:9090/MovieGoProject/addwishlist',
			type:'GET',
			data : param,
			cache : false,
			async : false,
			dataType : 'text',
	    success : function(data) {
	    	if(data == 0) {
	    		 alert("위시리스트 추가되었습니다.");
			}				   
		    
	    	else {
	    		alert("위시리스트 이미 포함되어 있습니다.");
	    	}
		},
		error : function(request, status, error) {
			if(request.status != '0') {
				alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
			}	
		}
	});	 
}
</script>

</body>
</html>
