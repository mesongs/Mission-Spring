<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">


<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://rawgit.com/beaver71/Chart.PieceLabel.js/master/build/Chart.PieceLabel.min.js"></script>

<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp" />


<style>
	
  body{
  
  color :rgb(2,2,2);
  
  }
	
 .addBold{
 
 	font-weight: bold;
 }	
 
  .rank {
 
    height: 39px;
    margin-bottom: 4px;
    margin-left: 3px;
    width: 40px;
 }	
 
 .upDownImg	{
 
    height: 12px;
    margin-bottom: 4px;
    margin-left: 3px;
    width: 15px;
 }				
	
 .panel{
 	margin-bottom : 20px;
 	border-radius : 4px;
 	box-shadow : 0px 1px 3px 2px rgb(0 0 0 / 11%);
 }
 
 .panel-body{
 	
 	padding-left: 15px;
    padding-bottom: 14px;
    font-size: 18px;
 	
 
 }
 
 
 

 .panel-default > .panel-heading{
	
	background-color : #E9EDF1;
	border-color : #ddd;
	
	
	}

 .panel-heading{
 	font-weight :bold;
 	color : #3a414e;
 	font-size: 23px;
    letter-spacing: 0.025em;
    height: 66px;
    line-height: 45px;
 	padding : 10px 15px;
 	border-top-left-radius:3px;
 	border-top-right-radius:3px;
 }

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

 .reportDayByTime{
	
    padding-right: 34px;

}
</style>

<script>

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>

<script>
	
	$(function(){
		
		let lastWeekReceiptNameArr = [];
		let lastWeekSumArr = [];
		let lastWeekReceiptCountArr=[];
		
		let lastWeekTrendDayArr = [];
		let lastWeekTrendSumArr = [];
		
		// 지 지난주 매입 내역
		let lastTwoWeekPurchaseDateArr = [];
		let lastTwoWeekPurchaseSumArr = [];
		
		let weekDeductionNameArr = [];
		let weekDeductionsumArr = [];
		let weekDeductionCount = [];
		
		let weekTop3StoreNameArr = [];
		let weekTop3StoreSumArr = [];
		
		
		let lastMonthReceiptNameArr = [];
		let lastMonthSumArr = [];
		let lastMonthReceiptCountArr=[];
		
		
		<c:forEach items="${ recentWeekPurchaseList }" var="recentWeekPurchaseList">
			lastWeekReceiptNameArr.push("${recentWeekPurchaseList.receiptName}")
			lastWeekSumArr.push(${recentWeekPurchaseList.recentWeekSum})
			lastWeekReceiptCountArr.push(${recentWeekPurchaseList.count})
		</c:forEach>
		
		<c:forEach items="${ recentWeekPurchaseTrend }" var="recentWeekPurchaseTrend">
			lastWeekTrendDayArr.push("${recentWeekPurchaseTrend.receiptDate}")
			lastWeekTrendSumArr.push(${recentWeekPurchaseTrend.sum})
		</c:forEach>	
			
		// 불공제 / 공제, 매입순위 top3
		<c:forEach items="${ weekDeductionList }" var="weekDeductionList">
			weekDeductionNameArr.push("${weekDeductionList.deduction}") 
			weekDeductionsumArr.push(${weekDeductionList.sum}) 
			weekDeductionCount.push(${weekDeductionList.count})
		</c:forEach>
			
		<c:forEach items="${ weekTop3StoreList }" var="weekTop3StoreList">
			weekTop3StoreNameArr.push("${weekTop3StoreList.storeName}")
			weekTop3StoreSumArr.push(${weekTop3StoreList.sum})
		</c:forEach>
		
		// 월간 매입 현황
		<c:forEach items="${ recentMonthPurchaseList }" var="recentMonthPurchaseList">
			lastMonthReceiptNameArr.push("${recentMonthPurchaseList.receiptName}")
			lastMonthSumArr.push(${recentMonthPurchaseList.recentMonthSum})
			lastMonthReceiptCountArr.push(${recentMonthPurchaseList.count})
		</c:forEach>
			
		<c:forEach items="${ getLastTwoWeekPurchaseTrend }" var="getLastTwoWeekPurchaseTrend">
			lastTwoWeekPurchaseDateArr.push("${getLastTwoWeekPurchaseTrend.receiptDate}")
			lastTwoWeekPurchaseSumArr.push(${getLastTwoWeekPurchaseTrend.sum})
		</c:forEach>
			
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			let recentWeekPieChart = document.getElementById('recentWeekPurchase').getContext('2d');
			let recentPieChart = new Chart(recentWeekPieChart, {
				
				
				type : 'pie',
				data: {
					 
					labels : lastWeekReceiptNameArr,
					datasets : [{
						
						data : lastWeekSumArr,
						backgroundColor: [ "rgb(79,186,140)", "#27b2a5", "rgb(179,221,210)","rgb(43,63,60)", "rgb(152,175,173)"]
					} 
					]
					
					
				},
				options : {
					responsive : false,
					legend : {
						position : 'right',
						labels: {
	                         fontSize: 12,
	                         fontColor: 'rgb(2,2,2)'
	                         }
					},
					pieceLabel: { 
						mode:"percentage",
						position:"default",
						fontSize: 14,
						fontColor : 'rgb(2,2,2)',
						fontStyle: 'bold'
					}

				}
				
				
			})
			
			
			
			
			
			let compareChart = document.getElementById('comparePurchase').getContext('2d');
			let compareLineChart = new Chart(compareChart, {
				
				type : 'line',
				data: {

					labels : lastWeekTrendDayArr,
					datasets : [{
						 
						label : '지난주 매입액',
						data : lastWeekTrendSumArr,
						backgroundColor : 'rgba(39, 178, 165, 0.6)',
						pointRadius : 3
					}, 
					{
						label : '2주 전 매입액',
						data : lastTwoWeekPurchaseSumArr,
						pointRadius : 3
					}
					
					]
					
					
				},
				options : {
					legend : {
						display : false,
					}
					,scales : {
						 xAxes: [{
							 barPercentage: 0.8,
					            gridLines: {
					                color: "rgba(0, 0, 0, 0)"
					            },
					            ticks : {
									fontSize : 13
								}
					        }],
						yAxes : [{
							
							ticks : {
								stepSize: 400000,
								beginAtZero: true,
								fontSize : 14
							}
						}]
						
					}
					
					
				}
				
				
			})
			
			let deductionChart = document.getElementById('deductionCanvas').getContext('2d');
			let deductionDoughnut = new Chart(deductionChart, {
				
				type : 'bar',
				data: {
					
					
					labels : weekDeductionNameArr,
					datasets : [{
						
						data : weekDeductionsumArr,
						backgroundColor:
		                        ['#27b2a5',
		                        'rgb(59,132,116)']
					}
					]
					
					
				},
				options : { 
					responsive : false,

					legend : {
						display : false
						
					},
					animation: {
						duration: 1,
						onComplete: function () {
							var chartInstance = this.chart,
								ctx = chartInstance.ctx;
							ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
							ctx.fillStyle = 'black';
							ctx.textAlign = 'center';
							ctx.textBaseline = 'bottom';

							this.data.datasets.forEach(function (dataset, i) {
								var meta = chartInstance.controller.getDatasetMeta(i);
								meta.data.forEach(function (bar, index) {
									var data = dataset.data[index];							
									ctx.fillText(data, bar._model.x, bar._model.y - 5);
								});
							});
						}
					},
					scales : {
						 xAxes: [{
					            barPercentage: 0.4,
					            gridLines: {
					                color: "rgba(0, 0, 0, 0)"
					            },
					            ticks : {
									fontSize : 15
								}
					        }],
						yAxes : [{
							
							ticks : {
								stepSize: 1000000,
								beginAtZero: true,
								fontSize : 14
							}
						}]
						
					}
					
						
				}
				
				
			})
			
			// 도넛 차트   lastMonthReceiptCountArr
			let monthPurchaseDoughnut = document.getElementById('monthPurchase').getContext('2d');
			let doughnutChart = new Chart(monthPurchaseDoughnut, {
				
				type : 'doughnut',
				data: {
					
					labels : lastMonthReceiptNameArr,
					datasets : [{
						
						data : lastMonthSumArr,
						backgroundColor:
		                        ["rgb(152,175,173)","#27b2a5", "rgb(179,221,210)","rgb(79,186,140)","rgba(43, 63, 56, 0.2)"]
					}
					]
					
					
				},
				options : {
					responsive : false,
					legend : {
						position : 'right',
						labels: {
	                         fontSize: 12,
	                         fontColor: 'rgb(2,2,2)'
	                         }
						
					},pieceLabel: {
						mode:"percentage",
						position:"default",
						fontSize: 15,
						fontColor : 'rgb(2,2,2)',
						fontStyle: 'bold'
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
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/financial/slaesReport">매출내역</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">매입내역</a></li>
			</ul>
			
			<section>
					<div class="container" style="margin-left: 36px;"> 
							<div class="row" style="margin-bottom: 25px;">
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 280px;">
										<div class="panel-heading">주간 매입 현황</div>
										<div class="panel-body" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
											<div style="margin-left: 10px; margin-top: 20px;margin-bottom: 19px; margin-right: 0px;">
												
												<span style="line-height: 2;">
													<span>주간 매입 합계 : </span>
													<span class="addBold"><fmt:formatNumber value="${ recentWeekSumCountVO.recentWeekSum}" pattern="#,###" />원</span><br>
												</span>
												<span style="line-height: 2;">
														<span style="float: left;">전 주 대비 증감률 : </span>
														<span class="addBold" style="float: left; margin-left: 5px;"> 12%</span>
													<span style="float: left">
														<c:if test="${ twoWeekSumCountVO.twoWeekSum gt recentWeekSumCountVO.recentWeekSum}">
															<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/down.png">
														</c:if>
														<c:if test="${ twoWeekSumCountVO.twoWeekSum lt recentWeekSumCountVO.recentWeekSum}">
															<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/up.png">												
														</c:if>
													</span><br>
												</span>
													
												<c:if test="${ twoWeekSumCountVO.twoWeekSum gt recentWeekSumCountVO.recentWeekSum}">
												<span style="line-height: 2;">
												전 주 대비 <span class="addBold">
															<fmt:formatNumber value="${ twoWeekSumCountVO.twoWeekSum - recentWeekSumCountVO.recentWeekSum}" pattern="#,###" />
															원 감소</span>
												</span>
												</c:if>
												<c:if test="${ twoWeekSumCountVO.twoWeekSum lt recentWeekSumCountVO.recentWeekSum}">
												전 주 대비 <span class="addBold">
															<fmt:formatNumber value="${ twoWeekSumCountVO.twoWeekSum - recentWeekSumCountVO.recentWeekSum}" pattern="#,###" />
															원 증가</span>
												</c:if>
												<span style="float: left;">총 매입 건 수 : </span>
												<span class="addBold" style="float: left; margin-left: 5px;"> ${recentWeekSumCountVO.weekPurchaseCount}건</span>
												
												<span style="float: left"> 
													<c:if test="${ twoWeekSumCountVO.twoWeekPurchaseCount gt recentWeekSumCountVO.weekPurchaseCount}">
														<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/down.png">
													</c:if>
													<c:if test="${ twoWeekSumCountVO.twoWeekPurchaseCount lt recentWeekSumCountVO.weekPurchaseCount}">
														<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/up.png">												
													</c:if>
												</span><br>
											</div>
											
											
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 280px;">
										<div class="panel-heading">주간 매입 유형 비율</div>
										<div class="panel-body" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
											<canvas id="recentWeekPurchase" width="270" height="190"></canvas>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="panel panel-default" style="height: 280px;">
										<div class="panel-heading">주간 매입 유형별 합계</div>
										<div class="panel-body" align="center" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
											<table>
												<tr>
													<th></th>
													<td></td>
													
													<c:forEach items="${ recentWeekPurchaseList }" var="recentWeekPurchaseList">
																<tr>
																	<th style="padding-right: 35px;">${ recentWeekPurchaseList.receiptName}</th>
																	<td><fmt:formatNumber value="${ recentWeekPurchaseList.recentWeekSum}" pattern="#,###" />원</td>
																</tr>
													</c:forEach>
													
												</tr>
											</table>
										</div>
									</div>
								</div>

							</div>
							
							<div class="row">
								<div class="col-md-7">
									<div class="panel panel-default" style="width:536px; height: 340px;">
										<div class="panel-heading">전 주 대비 최근 7일간 매입 추이</div>
										<div class="panel-body" style="margin-top: 30px;">
											<canvas id="comparePurchase" width="500" height="200"></canvas>
										</div>
									</div>
								</div>
								<div class="col-md-5">
									<div class="panel panel-default" style="width:374px">
										<div class="panel-heading">주간 공제 / 불공제 금액</div>
										<div class="panel-body" style="margin-top: 30px; height: 244px;" >
											<canvas id="deductionCanvas" width="300" height="200"></canvas>
											
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 280px;">
										<div class="panel-heading">월간 매입 비율</div>
											<div class="panel-body" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
												<canvas id="monthPurchase" style="display: block;width: 270px;height: 190px;"></canvas>
											</div>
											
											
											
											
											
											
											
											
									</div>
								</div>
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 280px;">
										<div class="panel-heading">월간 매입 유형별 합계</div>
											<div class="panel-body" align="center" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
												<table>
												<tr>
													<th></th>
													<td></td>
													
													<c:forEach items="${ recentMonthPurchaseList }" var="recentMonthPurchaseList">
																<tr>
																	<th style="padding-right: 35px;">${ recentMonthPurchaseList.receiptName}</th>
																	<td><fmt:formatNumber value="${ recentMonthPurchaseList.recentMonthSum}" pattern="#,###" />원</td>
																</tr>
													</c:forEach>
													
												</tr>
											</table>
												
											</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 280px;">
										<div class="panel-heading">월간 매입 랭킹TOP3</div>
											<div class="panel-body" style="margin-top: 43px; ">
												<table>
													<tr>
														<th style="padding-right: 35px;"><img class="rank" src="${ pageContext.request.contextPath }/resources/img/first.png">대양수산</th>
														<td><fmt:formatNumber value="630000" pattern="#,###" />원</td>
													</tr>
													<tr>
														<th style="padding-right: 35px;"><img class="rank" src="${ pageContext.request.contextPath }/resources/img/second.png">하나로마트</th>
														<td><fmt:formatNumber value="485000" pattern="#,###" />원</td>
													</tr>
													<tr>
														<th style="padding-right: 35px;"><img class="rank" src="${ pageContext.request.contextPath }/resources/img/third.png">석촌호수상회</th>
														<td><fmt:formatNumber value="332000" pattern="#,###" />원</td>
													</tr>
												</table>
											</div>
									</div>
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