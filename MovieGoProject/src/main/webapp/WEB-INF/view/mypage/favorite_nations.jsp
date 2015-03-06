<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.3.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<title>MOVIE GO</title>
</head>
<script>
$(document).ready(function(){
	<c:url value="/nation.count.do" var="url"></c:url>
	$.ajax({
		url:'${url}',
		type:'POST',
		cache : false,
		async : false,
		contentType: "application/json; charset=utf-8",
		dataType : 'json',
    success : function(data) {
    	 $('#nationchart').highcharts({
    	        chart: {
    	            type: 'bar'
    	        },
    	        title: {
    	            text: 'Stacked bar chart'
    	        },
    	        xAxis: {
    	            categories: [data.nations[0].movieNation, data.nations[1].movieNation, data.nations[2].movieNation, data.nations[3].movieNation, data.nations[4].movieNation]
    	        },
    	        yAxis: {
    	            min: 0,
    	            title: {
    	                text: 'Total fruit consumption'
    	            }
    	        },
    	        legend: {
    	            reversed: true
    	        },
    	        plotOptions: {
    	            series: {
    	                stacking: 'normal'
    	            }
    	        },
    	        series: [{
    	            name: 'John',
    	            data: [data.nations[0].count, data.nations[1].count, data.nations[2].count, data.nations[3].count, data.nations[4].count]
    	        }]
    	    });
	},

	error : function(request, status, error) {
		if(request.status != '0') {
			alert("code :" +request.status + "\r\nmessage : " + request.responseText + "\r\nerror:" + error);	
		   }	
	   }
   });
});
</script>
<body>

<div id="nationchart" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto">

</div>

</body>
</html>