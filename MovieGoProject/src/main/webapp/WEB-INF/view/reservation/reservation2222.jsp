<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul {
list-style-type: none;
}
li {
display: inline;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js">



</script>
</head>
<body>
<jsp:include page="/WEB-INF/view/user/header.jsp" />
<h1>인원/좌석 선택</h1>

<table border=1 width="800px">
<tr>
<td><!-- 인원 -->
<div id="peopleNum">
<h2>인원</h2>
<ul>
<li><button>0</button></li>
<li><button>1</button></li>
<li><button>2</button></li>
<li><button>3</button></li>
<li><button>4</button></li>
</ul>
</div>
</td>
</tr>

<tr>
<td>
<div id="seat">
<button id="screen" disabled style="width: 700px; height: 50px;">screen</button>

</div>
</td>
</tr>
</table>

</body>
</html>