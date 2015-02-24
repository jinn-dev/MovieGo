<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component2.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rating.css" />
<title>Insert title here</title>
<style>
.back_to_top{
	position:fixed;
	bottom:0;
	left:45%;
	margin-left:700px;
	text-decoration:none;
	color:#f2f2f2;
	background-color:rgba(79, 93, 115, 0.50);
	font-size:15px;
	padding:1em;
	display:none;
}  
.back_to_top:hover{
	background-color:rgba(199, 92, 92, 0.50);
	color:#f2f2f2;
}
</style>
</head>
<script src="<%=request.getContextPath ()%>/main/js/modernizr.custom.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

 $(document).ready(function() {

	/* 스크롤 위로 이동 */
 	var offset = 220;  
     var duration = 500;  
     $(window).scroll(function() {  
         if ($(this).scrollTop() > offset) {  
             $('.back_to_top').fadeIn(duration);  
         } else {  
             $('.back_to_top').fadeOut(duration);  
         }  
     });  
       
     $('.back_to_top').click(function(event) {  
         event.preventDefault();  
         $('html, body').animate({scrollTop: 0}, duration);  
         return false;  
     })  
     
   <c:url value="/ratinglist.ajax" var="url"/>
   $.ajax({
      url:'${url}',
         type:'GET',       
            cache : false,
            async : false,
            dataType : 'json',
       success : function(data) {
       var output = '<div class="list-table"><table><tr><th>포스터</th><th>영화제목</th><th>감독</th><th>개봉일자<th>장르</th><th>별점</th><th>코멘트</th><th>예매하기</th><th>삭제하기</th></tr>';
       for(var i = 0; i < data.evaluation.length; i++) {   
      
          output += '<tr><td class ="thumbnail">'+
      '<img width="180" height="253" src="'+data.evaluation[i].movies[0].movieImgUrl+'"/></div></td>'+
      '<td width="300" height="50">'+
      '<c:url value="/movieinfo?movieCode='+data.evaluation[i].movies[0].movieCode +'" var="url"></c:url>'+
      '<a href="${url }">'+data.evaluation[i].movies[0].movieTitleKr+'</a></td>'+
      '<td width="120">'+data.evaluation[i].movies[0].movieDirector +'</td>'+
      '<td width="100">'+data.evaluation[i].movies[0].movieOpenDate +'</td>'+
      '<td width="100">'+data.evaluation[i].movies[0].movieGenre +'</td>'+
      '<td width="100">'+data.evaluation[i].evRating +'</td>';
      if(data.evaluation[i].evComment== null) {
         var param2="?movieCode=" + data.evaluation[i].movies[0].movieCode;
         output += '<td width="100">';
         /*    '<a href="javascript:evc('+data.evaluation[i].movies[0].movieCode+')" class="icon-search"></a>'+ */
            
         }
      else {
         output += '<td width="100">'+data.evaluation[i].evComment +'</td>';
      }
      
      output += '<td width="100">';
      for(var j = 0; j < data.nowlist.length; j++) {
         if(data.nowlist[j] == data.evaluation[i].movies[0].movieCode) {
            output += '<c:url value="/reserve" var="url"></c:url>'+
            '<a href="${url }" class="icon-search">예매하기</a></td>';
            break;
         }
         else if(data.nowlist[j] != data.evaluation[i].movies[0].movieCode) {
            if(j == data.nowlist.length - 1) {
               output += '-</td>';
               break;
            }
            else {
               
            }
         }
      }
   
      output += '<td width="80"><button onclick="deleteCheck('+data.evaluation[i].evId+')"class="div-button">삭제</button>'+
      '</td></tr>';
      }
      '</table>';

     

         $('#evlist').html(output);
      },
      error : function(request, status, error) {
         alert("노노");
         if(request.status != '0') {
            alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);   
         }   
      }
   });
});  

 function evc(m) {
    var param2="?movieCode" +"="+m;
      <c:url value="/evcomment" var="url"></c:url>
      window.open('${url}'+param2,'_blank', "width=800, height=300, toolbar=no, menubar=no, resizable=no");
}
 
function deleteCheck(id) {
    if(confirm("영화평가를 삭제하시겠습니까??")) {
       location.href="<%=request.getContextPath()%>/deleteevaluation?evId="+id;
       
    }
}
</script>
<body>
 <jsp:include page="/WEB-INF/view/user/header.jsp" />
<div class="list-table">
<div class="mockup-content">
					<span></span><span></span><span></span><span></span>
					<div class="morph-button morph-button-modal morph-button-modal-1 morph-button-fixed">
						<button type="button">Terms &amp; Conditions</button>
						<div class="morph-content">
							<div>
								<div class="content-style-text">
									<span class="icon icon-close">Close the dialog</span>
									<h2>Terms &amp; Conditions</h2>
									<p>Pea horseradish azuki bean lettuce avocado asparagus okra. Kohlrabi radish okra azuki bean corn fava bean mustard tigernut juccama green bean celtuce collard greens avocado quandong <strong>fennel gumbo</strong> black-eyed pea. Grape silver beet watercress potato tigernut corn groundnut. Chickweed okra pea winter purslane coriander yarrow sweet pepper radish garlic brussels sprout groundnut summer purslane earthnut pea <strong>tomato spring onion</strong> azuki bean gourd.</p>
									<p><input id="terms" type="checkbox" /><label for="terms">I accept the terms &amp; conditions.</label></p>
								</div>
							</div>
						</div>
					</div><!-- morph-button -->


<div id="evlist"></div></div>
  <a href="#" class="back_to_top">Back to Top</a>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>

<script src="<%=request.getContextPath() %>/js/main/classie.js"></script>
<script src="<%=request.getContextPath() %>/js/main/uiMorphingButton_fixed.js"></script>
<script>
/* 코멘트 팝업 스크립트 */
(function() {	
	var docElem = window.document.documentElement, didScroll, scrollPosition;

	// trick to prevent scrolling when opening/closing button
	function noScrollFn() {
		window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
	}

	function noScroll() {
		window.removeEventListener( 'scroll', scrollHandler );
		window.addEventListener( 'scroll', noScrollFn );
	}

	function scrollFn() {
		window.addEventListener( 'scroll', scrollHandler );
	}

	function canScroll() {
		window.removeEventListener( 'scroll', noScrollFn );
		scrollFn();
	}

	function scrollHandler() {
		if( !didScroll ) {
			didScroll = true;
			setTimeout( function() { scrollPage(); }, 60 );
		}
	};

	function scrollPage() {
		scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
		didScroll = false;
	};

	scrollFn();

	var UIBtnn = new UIMorphingButton( document.querySelector( '.morph-button' ), {
		closeEl : '.icon-close',
		onBeforeOpen : function() {
			// don't allow to scroll
			noScroll();
		},
		onAfterOpen : function() {
			// can scroll again
			canScroll();
		},
		onBeforeClose : function() {
			// don't allow to scroll
			noScroll();
		},
		onAfterClose : function() {
			// can scroll again
			canScroll();
		}
	} );
	document.getElementById( 'terms' ).addEventListener( 'change', function() {
		UIBtnn.toggle();
	} );
})();
</script>
</body>
</html>