<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

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

.container div{
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-right-radius: 5px;
	border-top

}
</style>


<script>
	

	$(function(){
		
		let lastWeekArr = []; // 지난 주 날짜
		let lastWeekSalesArr = []; //지난 주 매출액
		
		let weekBeforeArr = [];	// 지지난 주 날짜
		let weekBeforeSalesArr =[]; // 지지난 주 매출액
		
		let customerKindArr = [];
		let customerCountArr = [];
		let customerSaleArr = [];
		
		
		<c:forEach items="${ lastWeekSalesList }" var="lastWeekSalesList">
			lastWeekArr.push(${ lastWeekSalesList.lastWeek })
			lastWeekSalesArr.push(${ lastWeekSalesList.lastWeekSales})
		</c:forEach>
		
		<c:forEach items="${ weekBeforeSalesList }" var="weekBeforeSalesList">
			weekBeforeArr.push(${ weekBeforeSalesList.weekBeforeLast })
			weekBeforeSalesArr.push(${ weekBeforeSalesList.weekBeforeLastSales })
		</c:forEach>
			
			
		<c:forEach items="${ customerKindSaleList }" var="customerKindSaleList">
			customerKindArr.push("${ customerKindSaleList.customerKind }")
			customerCountArr.push(${ customerKindSaleList.customerCount })
			customerSaleArr.push(${ customerKindSaleList.customerSale })
		</c:forEach>
		
		
			
			let myChartOne3 = document.getElementById('myChartOne3').getContext('2d');
			let barChart3 = new Chart(myChartOne3, {
				
				type : 'bar',
				data: {
					
					labels : lastWeekArr,
					datasets : [{
						 
						label : '매출액', // 각 그래프에서 나타내는 값 ex) 매출액 : 10만원,
						data : lastWeekSalesArr
						
					}]
					
					
				},
				options : {
					title : {
						display : true,
						text : '일별 사업장 매출 현황',
						fontSize : 20
					},
					legend : {
						display : false,
					}
					
					
				}
				
				
			})
		
			let myChartOne4 = document.getElementById('myChartOne4').getContext('2d');
			let barChart4 = new Chart(myChartOne4, {
				
				type : 'line',
				data: {
					
					labels : lastWeekArr,
					datasets : [{
						 
						label : lastWeekArr,
						data : lastWeekSalesArr
						
					}, 
					{
						label : weekBeforeArr,
						data : weekBeforeSalesArr
					}
					
					]
					
					
				},
				options : {
					title : {
						display : true,
						text : '전 주 대비 최근 7일간 매출 추이',
						fontSize : 20
					},
					legend : {
						display : false,
					}
					
					
				}
				
				
			})
			
			
			
			let myChartOne5 = document.getElementById('myChartOne5').getContext('2d');
			let barChart5 = new Chart(myChartOne5, {
				
				type : 'doughnut',
				data: {
					
					labels : customerKindArr,
					datasets : [{
						
						
						data : customerCountArr
						
					}
					]
					
					
				},
				options : {
					title : {
						display : true,   
						text : '신규 고객 / 재방문 고객 비율',
						fontSize : 20,
					},
					legend : {
						position : 'bottom'
						
					}
					
					
				}
				
				
			})
			
			
			
			
			
			
			
			
		let myChartOne = document.getElementById('myChartOne').getContext('2d');
		let barChart = new Chart(myChartOne, {
			
			type : 'bar',
			data: {
				
				labels : ['새벽', '아침', '점심', '오후', '저녁'],
				datasets : [{
					
					label : '전 날',
					data : [
						
						${bytimeSale.morningSale},
						${bytimeSale.AFTERNOON1Sale},
						${bytimeSale.AFTERNOON2Sale},
						${bytimeSale.EVENINGSale}
						
					]
					
				}, 
				{
					label : '전 전날',
					data : [
						
						${bytimeSale2.morningSale},
						${bytimeSale2.AFTERNOON1Sale},
						${bytimeSale2.AFTERNOON2Sale},
						${bytimeSale2.EVENINGSale}
						
					]
					
				}
				
				]
				
				
			},
			options : {
				title : {
					display : true,
					text : '시간대별 매출 분석',
					fontSize : 20,
				},
				legend : {
					display : true,
					position : 'right'
				},
				tooltips : {
					enabled : false
				}
				
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
					<c:forEach items="${ customerKindSaleList }" var="customerKindSaleList">
						${ customerKindSaleList.customerKind }
						${ customerKindSaleList.customerCount }
						${ customerKindSaleList.customerSale }
					</c:forEach>
					
					${perCutomerSale}
					<c:forEach items="${ lastWeekSalesList }" var="lastWeekSalesList">
						${ lastWeekSalesList.lastWeek }
						${ lastWeekSalesList.lastWeekSales }
					</c:forEach>
					
					<c:forEach items="${ weekBeforeSalesList }" var="weekBeforeSalesList">
						${ weekBeforeSalesList.weekBeforeLast }
						${ weekBeforeSalesList.weekBeforeLastSales }
					</c:forEach>
					
			
					${ returnSalesVO.dayBefore }
					${ returnSalesVO.yesterday }
					${ returnSalesVO.dod }
					<br>
					<c:forEach items="${ cardApprovalTop5List }" var="cardApprovalTop">
						${ cardApprovalTop.cardName }
						${ cardApprovalTop.approvalAmount }
					</c:forEach>
					
					<div class="container" style="margin-left: 36px;"> 
							<div class="row">
								<div class="col-md-5">
									<table>
										<tr>
											<th id="salesComma">매출액</th>
											<td>${ returnSalesVO.yesterday }</td>
										</tr>
										<tr>
											<th>전 전날 매출액</th>
											<td>${ returnSalesVO.dayBefore }</td>
										</tr>
										<tr>
											<th>매출액 증감률</th>
											<td>${ returnSalesVO.dod }</td>
										</tr>
									</table>
								</div>
								<div class="col-md-7">
									<canvas id="myChartOne3"></canvas>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8">
									<canvas id="myChartOne4"></canvas>
								</div>
								<div class="col-4">
									<table>
										<tr>
											<th>최근 7일간 카드사별 결제금액 TOP5</th>
										</tr>
										<c:forEach items="${ cardApprovalTop5List }" var="cardApprovalTop">
											<tr>
												<td>${ cardApprovalTop.cardName }</td>
												<td>${ cardApprovalTop.approvalAmount }원</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								
							</div>
							<div class="row">
								<div class="col-md-6">
									<canvas id="myChartOne5"></canvas>
								</div>
								<div class="col-md-6">
									<table>
										<tr>
											<th>고객 분석</th>
										</tr>
										<tr>
											<th>평균 객단가</th>
											<td>${ perCutomerSale }원</td>
										</tr>
											
										<c:forEach items="${ customerKindSaleList }" var="customerKindSaleList">
											<tr>
												<th>${ customerKindSaleList.customerKind }</th>
												<td>${ customerKindSaleList.customerSale }원</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								
								
							</div>
							
							
							<div class="row">
								<div class="col-md-6">
									<canvas id="myChartOne"></canvas>
								</div>
								<div class="col-md-6">
									<table>
										<tr>
											<th>아침(06시 ~ 11시)</th>
											<td>${bytimeSale.morningSale}원</td>
										</tr>
										<tr>
											<th>점심(11시 ~ 14시)</th>
											<td>${bytimeSale.AFTERNOON1Sale}원</td>
										</tr>
										<tr>
											<th>오후(14시 ~ 17시)</th>
											<td>${bytimeSale.AFTERNOON2Sale}원</td>
										</tr>
										<tr>
											<th>저녁(17시 ~ 22시)</th>
											<td>${bytimeSale.EVENINGSale}원</td>
										</tr>
									</table>
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