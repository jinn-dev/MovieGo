<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	#submenu {
		width : 30%;
		float : right;
	}
	#ratinglist {
		width : 70%;
		float : right;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
<div id="ratinglist">
영화평가목록
 <table id="ratingList">
      <tr>
         <th>
            <div>
               <b>영화제목</b>
            </div>
         </th>
         <th >
            <div>
               <b>감독</b>
            </div>
         </th>
         <th>
            <div>
               <b>개봉일자</b>
            </div>
         </th>
         <th>
            <div>
               <b>장르</b>
            </div>
         </th>
          <th>
            <div>
               <b>별점</b>
            </div>
         </th>
          <th>
            <div>
               <b>코멘트</b>
            </div>
         </th>
      </tr>
   </table>
</div>
<div id="submenu">
<jsp:include page="submenu.jsp"></jsp:include>
</div>
</body>
</html>