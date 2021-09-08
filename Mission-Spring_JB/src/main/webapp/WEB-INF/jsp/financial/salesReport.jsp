<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp" />


<style>
#comment-custom-receipt {
	/* max-width: 700px; */
	width: 1000px;
	margin: auto;
	margin-top: 70px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 30px;
	font-family: 'Noto Sans KR', sans-serif;
}

#comment-custom-receipt>h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: xx-large;
}

.container {
	margin-top: 30px;
}

#receiptResgisterBtn {
	width: 410.5px;
	padding-right: 25px;
	padding-left: 25px;
	padding-top: 3px;
	padding-bottom: 3px;
	border: 0px;
	font-size: x-large;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	-ms-border-radius: 30px;
	border-radius: 30px;
	color: #fff;
	background-color: #27b2a5;
}

#comment-custom-receipt>h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: xx-large;
}

#memo {
	padding: 8px 20px;
	background: rgba(130, 139, 178, 0.25);;
	border: none;
	border-radius: 0px;
	width: 100%;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
	border: 1px solid transparent;
	padding-left: 0px;
}

.receiptBtn {
	width: 90px;
	font-family: 'Noto Sans KR', sans-serif;
}

.row.box {
	margin-left: 34px;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link {
	color: #495057;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: #007BFF;
}

.nav.nav-tabs {
	font-family: 'Noto Sans KR', sans-serif;
}

.dragAndDropDiv {
	border: 4px dashed #999999;
	/* width: 610px; */
	width: 410px;
	top: 25px;
	height: 430px;
	color: #999999;
	margin-top: 26px;
	text-align: center;
	vertical-align: middle;
	/*  padding: 10px 0px 10px 10px; */
	font-size: 200%;
	display: table-cell;
	background-color: rgba(130, 139, 178, 0.25);
	text-align: center;
}

.statusbar {
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 150px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.product-img3{
 	max-width: 20px;
    max-height: 20px;
 	margin-top: -5px;
    margin-right: 0px;
 }

.chart div {
      font: 10px sans-serif;
      background-color: steelblue;
      text-align: right;
      padding: 3px;
      margin: 1px;
      color: white;
    }
    
svg {
	width: 100%;
	height: 400px;
}

path.slice{
	stroke-width:2px;
}

polyline{
	opacity: .3;
	stroke: black;
	stroke-width: 2px;
	fill: none;
}
</style>


<script>
	
$(document).ready(function(){
	
	let myChartOne = document.getElementById('myChartOne').getContext('2d');
	let barChart = new Chart(myChartOne, {
		
		type : 'bar',
		data: {
			
			labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
			datasets : [{
				
				label : '매출액',
				data : [
					
					10,
					100,
					100,
					200,
					1000
					
				]
				
			}]
			
			
		}
		
		
	})
	
	let myChartOne2 = document.getElementById('myChartOne2').getContext('2d');
	let barChart2 = new Chart(myChartOne2, {
		
		type : 'bar',
		data: {
			
			labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
			datasets : [{
				
				label : '매출액',
				data : [
					
					10,
					100,
					100,
					200,
					1000
					
				]
				
			}]
			
			
		}
		
		
	})
	
	let myChartOne3 = document.getElementById('myChartOne3').getContext('2d');
	let barChart3 = new Chart(myChartOne3, {
		
		type : 'bar',
		data: {
			
			labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
			datasets : [{
				
				label : '매출액',
				data : [
					
					10,
					100,
					100,
					200,
					1000
					
				]
				
			}]
			
			
		}
		
		
	})
	
	let myChartOne4 = document.getElementById('myChartOne4').getContext('2d');
	let barChart4 = new Chart(myChartOne4, {
		
		type : 'bar',
		data: {
			
			labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
			datasets : [{
				
				label : '매출액',
				data : [
					
					10,
					100,
					100,
					200,
					1000
					
				]
				
			}]
		}
		
		
	})
	
	let myChartOne5 = document.getElementById('myChartOne5').getContext('2d');
	let barChart5 = new Chart(myChartOne5, {
		
		type : 'doughnut',
		data: {
			
			labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
			datasets : [{
				
				label : '매출액',
				data : [
					
					10,
					100,
					100,
					200,
					1000
					
				]
				
			}]
			
			
		}
		
		
	})
	
	let myChartOne6 = document.getElementById('myChartOne6').getContext('2d');
	let barChart6 = new Chart(myChartOne6, {
		
		type : 'doughnut',
		data: {
			
			labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
			datasets : [{
				
				label : '매출액',
				data : [
					
					10,
					100,
					100,
					200,
					1000
					
				]
				
			}]
			
			
		}
		
		
	})
	
	let myChartOne7 = document.getElementById('myChartOne7').getContext('2d');
	let barChart7 = new Chart(myChartOne7, {
		
		type : 'doughnut',
		data: {
			
			labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
			datasets : [{
				
				label : '매출액',
				data : [
					
					10,
					100,
					100,
					200,
					1000
					
				]
				
			}]
			
			
		}
		
		
	})
		
		
})
	
	
	

</script>

</head>


<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />
	<!--================Header Menu Area =================-->
		  
	<!--================ Start Blog Post Area =================-->

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>사업보고서</h4>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">매출내역</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">매입내역</a></li>
			</ul>
			
			<section>
					
					<div class="container" style="margin-left: 36px;"> 
							<div class="row">
								<div class="col-md-6">
									<canvas id="myChartOne3"></canvas>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8">
									<canvas id="myChartOne4"></canvas>
								</div>
								<div class="col-md-4">
									<canvas id="myChartOne5"></canvas>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<canvas id="myChartOne"></canvas>
								</div>
								<div class="col-md-6">
									<canvas id="myChartOne2"></canvas>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<canvas id="myChartOne6"></canvas>
								</div>
								<div class="col-md-4">
									<canvas id="myChartOne7"></canvas>
								</div>
							</div>
							
							
					</div>
			</section>
			
			
			
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<!--================ End Footer Area =================-->


</body>
</html>