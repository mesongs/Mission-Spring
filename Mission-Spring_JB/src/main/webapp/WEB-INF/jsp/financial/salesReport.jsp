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
		
		
		// ??? ??? ????????????
		var commaYesterDaySales = numberWithCommas(${ returnSalesVO.yesterday })
		var commaDayBeforeSales = numberWithCommas(${ returnSalesVO.dayBefore });
		
		
		document.getElementById("commaYesterDaySales").innerHTML=commaYesterDaySales + "???" ;
		
		
		var calDayBeforeYesterday = ${ returnSalesVO.dayBefore } - ${ returnSalesVO.yesterday }
		
		// ??? ??? ?????????
		var calLastLastSales =  ${ monthSalesVO.lastMonthSales } - ${ monthSalesVO.lastLastMonthSales }
		
		var commaSalesMom = numberWithCommas(calLastLastSales)
		
		
		if(commaSalesMom.indexOf("-")){
			
			commaSalesMom.replace("-", "")	
			
		}
			
		
		if(calLastLastSales < 0){
			document.getElementById("salesMom").innerHTML = '??? ??? ?????? '+ '<span class="addBold">' + commaSalesMom + '??? ??????</span>';
			
		}else{
			
			document.getElementById("salesMom").innerHTML = '??? ??? ?????? '+ '<span class="addBold">' + commaSalesMom + '??? ??????</span>';
		}
		
		
		// ????????? ?????? ??????????????? ???????????????
		var salesDod = numberWithCommas(Math.abs(calDayBeforeYesterday))
		
		
		
		if(salesDod.indexOf("-")){
			
			
			salesDod.replace("-", "")	
			
			
		}
		
		if( calDayBeforeYesterday > 0){
			document.getElementById("salesDod").innerHTML = '??? ??? ?????? '+ '<span class="addBold">' + salesDod + '??? ??????</span>';
			
		}else{
			
			document.getElementById("salesDod").innerHTML = '??? ??? ?????? '+ '<span class="addBold">' + salesDod + '??? ??????</span>';
		}
		
		
		
		var morningSale = numberWithCommas(${bytimeSale.morningSale})
		var AFTERNOON1Sale = numberWithCommas(${bytimeSale.AFTERNOON1Sale})
		var AFTERNOON2Sale = numberWithCommas(${bytimeSale.AFTERNOON2Sale})
		var EVENINGSale = numberWithCommas(${bytimeSale.EVENINGSale})
		
		document.getElementById("morningSale").innerHTML = morningSale + "???";
		document.getElementById("AFTERNOON1Sale").innerHTML = AFTERNOON1Sale + "???";
		document.getElementById("AFTERNOON2Sale").innerHTML = AFTERNOON2Sale + "???";
		document.getElementById("EVENINGSale").innerHTML = EVENINGSale + "???";
		

		var customerkindArrComma = [];
		
		var today = new Date();
		
		//var getYesterday = (today.getDay() - 1); // ???????????? ????????? ?????? (0~6)
		var getYesterday = '2';
		var yesterDayMonth = ('0' + (today.getMonth() - 2)).slice(-2);
		var yesterday = ('0' + (today.getDate() + 2)).slice(-2);
		
		//var getDayBefore = (today.getDay() - 2);
		var getDayBefore = '1';
	    var dayBeforeMonth = ('0' + (today.getMonth() -2)).slice(-2);
	    var dayBeforeDay = ('0' + (today.getDate() + 1)).slice(-2);
		
		var yesterdayString = yesterDayMonth  + '-' + yesterday;
	    var dayBeforeDayString = dayBeforeMonth + '-' + dayBeforeDay;
	    
	    var week = new Array('?????????', '?????????', '?????????', '?????????', '?????????', '?????????', '?????????');
		
	   	var yesterdayOfWeek = week[getYesterday]
	    var dayBeforeDayOfWeek = week[getDayBefore]
	   	
		let lastWeekArr = []; // ?????? ??? ??????
		let lastWeekSalesArr = []; //?????? ??? ?????????
		
		let cardNameArr = [];
		let cardSalesArr = [];
		
		let weekBeforeArr = [];	// ????????? ??? ??????
		let weekBeforeSalesArr =[]; // ????????? ??? ?????????
		
		let customerKindArr = [];
		let customerCountArr = [];
		let customerSaleArr = [];
		
		let weekCustomerKindArr = [];
		let weekCustomerCountArr = [];
		let weekCustomerSaleArr = [];
		
//		yesterdayString + "(" + yesterdayOfWeek + ")" , dayBeforeDayString + "(" + dayBeforeDayOfWeek + ")", 
//		$('#salesComma').val(yesterdayString + "(" + yesterdayOfWeek + ")")
		document.getElementById("yesterdaySales").innerHTML=yesterdayString + "(" + yesterdayOfWeek + ")";
		
		var commaLastMonthSales = numberWithCommas(${monthSalesVO.lastMonthSales});
		
		document.getElementById("lastMonthSalesSum").innerHTML=commaLastMonthSales+"???";
		
		
		

		
		<c:forEach items="${ lastWeekSalesList }" var="lastWeekSalesList">
			lastWeekArr.push("${ lastWeekSalesList.lastWeek }")
			lastWeekSalesArr.push(${ lastWeekSalesList.lastWeekSales})
		</c:forEach>
		
		<c:forEach items="${ weekBeforeSalesList }" var="weekBeforeSalesList">
			weekBeforeArr.push(${ weekBeforeSalesList.weekBeforeLast })
			weekBeforeSalesArr.push(${ weekBeforeSalesList.weekBeforeLastSales })
		</c:forEach>
			
		// ???????????? ???????????? top5	cardApprovalTop5List => ??????????????? ?????? ???????????? ????????? ???????????? ????????? ?????????
		<c:forEach items="${ cardApprovalTop5List }" var="cardApprovalTop">
			cardNameArr.push("${ cardApprovalTop.cardName }")
			cardSalesArr.push(${ cardApprovalTop.approvalAmount })
		</c:forEach>
			
			
		<c:forEach items="${ customerKindSaleList }" var="customerKindSaleList">
			customerKindArr.push("${ customerKindSaleList.customerKind }")
			customerCountArr.push(${ customerKindSaleList.customerCount })
			customerSaleArr.push(${ customerKindSaleList.customerSale })
			customerkindArrComma.push(numberWithCommas(${ customerKindSaleList.customerSale }))
		</c:forEach>
			
		var perCutomerSale = numberWithCommas(${perCutomerSale});
		
		document.getElementById("perCutomerSale").innerHTML=perCutomerSale + "???" ;
		document.getElementById("???????????????").innerHTML=customerkindArrComma[0] + "???" ;
		document.getElementById("????????????").innerHTML=customerkindArrComma[1] + "???" ;
		
		
		/////////////////////////////////////////////
		/////////////////////////////////////////////
		/////////////////////////////////////////////
		
		<c:forEach items="${ weekCustomerKindSaleList }" var="weekCustomerKindSaleList">
			weekCustomerKindArr.push("${ weekCustomerKindSaleList.customerKind }")
			weekCustomerCountArr.push(${ weekCustomerKindSaleList.customerCount })
			weekCustomerSaleArr.push(${ weekCustomerKindSaleList.customerSale })
		</c:forEach>
			
			
			
			let myChartOne3 = document.getElementById('myChartOne3').getContext('2d');
			let barChart3 = new Chart(myChartOne3, {
				
				type : 'bar',
				data: {
					
					labels : lastWeekArr,
					datasets : [{
						 
						label : '?????????', // ??? ??????????????? ???????????? ??? ex) ????????? : 10??????,
						data : lastWeekSalesArr
						,
						backgroundColor : '#27b2a5'
						
					}]
					
					
				},
				options : {
					responsive: false,
					title : {
						display : false,
						text : '?????? ????????? ?????? ??????',
						fontSize : 20
					},
					legend : {
						display : false,
					},
					scales : {
						 xAxes: [{
					            barPercentage: 0.4,
					            gridLines: {
					                color: "rgba(0, 0, 0, 0)"
					            },
					            ticks : {
									fontSize : 12
								}
					        }],
						yAxes : [{
							
							ticks : {
								stepSize: 300000,
								beginAtZero: true,
								fontSize : 14,
								userCallback : function(value, index,
		                                 values) {
		                              value = value.toString();
		                              value = value.split(/(?=(?:...)*$)/);
		                              value = value.join(',');
		                              return value + "???";
		                           }
							}
						}]
						
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
									data=data.toString();
									data=data.split(/(?=(?:...)*$)/);
									data=data+"???"
									ctx.fillText(data, bar._model.x, bar._model.y - 5);
								});
							});
						}
					}

					
					
					
					
				}
				
				
			})
		
			let myChartOne4 = document.getElementById('myChartOne4').getContext('2d');
			let barChart4 = new Chart(myChartOne4, {
				
				type : 'line',
				data: {
					
					labels : lastWeekArr,
					datasets : [{
						 
						label : '?????? 7??? ?????????',
						data : lastWeekSalesArr,
						backgroundColor : 'rgba(39, 178, 165, 0.6)',
						pointRadius : 3
					}, 
					{
						label :'??? ??? ?????????',
						data : weekBeforeSalesArr,
						pointRadius : 3
					}
					
					]
					
					
				},
				options : {
					title : {
						display : false,
						text : '??? ??? ?????? ?????? 7?????? ?????? ??????',
						fontSize : 20
					},
					legend : {
						display : true,
						labels: {
	                         fontSize: 15,
	                         fontColor: 'rgb(2,2,2)'
	                         }
						
						
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
								fontSize : 14,
								userCallback : function(value, index,
		                                 values) {
		                              value = value.toString();
		                              value = value.split(/(?=(?:...)*$)/);
		                              value = value.join(',');
		                              return value + "???";
		                           }
							}
						}]
						
					}
					
					
				}
				
				
			})
			
			let cardSalesYop5Chart = document.getElementById('cardSalesYop5Chart').getContext('2d');
			let cardPieChart = new Chart(cardSalesYop5Chart, {
				
				type : 'pie',
				data: {
					 
					labels : cardNameArr,
					datasets : [{
						
						data : cardSalesArr,
						backgroundColor: [ "rgb(79,186,140)", "#27b2a5", "rgb(43,63,60)", "rgb(179,221,210)", "rgb(152,175,173)"]
					} 
					]
					
					
				},
				options : {
					responsive : false,
					title : {
						display : false,   
						text : '?????? 7?????? ???????????? ???????????? TOP5',
						fontSize : 20,
					},
					legend : {
						position : 'right',
						labels: {
	                         fontSize: 15,
	                         fontColor: 'rgb(2,2,2)'
	                         }
					},
					pieceLabel: { 
						mode:"percentage",
						position:"default",
						fontSize: 12,
						fontColor : 'rgb(2,2,2)',
						fontStyle: 'bold'
					}

				}
				
				
			})
			
			
			
			let myChartOne5 = document.getElementById('myChartOne5').getContext('2d');
			let barChart5 = new Chart(myChartOne5, {
				
				type : 'doughnut',
				data: {
					
					labels : customerKindArr,
					datasets : [{
						
						data : customerSaleArr,
						backgroundColor:
		                        ['#27b2a5',
		                        'rgb(59,132,116)']
					}
					]
					
					
				},
				options : {
					title : {
						display : false,   
						text : '??? ??? ?????? ?????? / ????????? ?????? ??????',
						fontSize : 20,
					},
					legend : {
						position : 'bottom',
						labels: {
	                         fontSize: 15,
	                         fontColor: 'rgb(2,2,2)'
	                         }
						
					},pieceLabel: {
						mode:"percentage",
						position:"default",
						fontSize: 17,
						fontColor : 'rgb(2,2,2)',
						fontStyle: 'bold'
					}


						
					
					
				}
				
				
			})
			
//	 	weekCustomerCountArr 
		
		let weekCustomerKind = document.getElementById('weekCustomerKind').getContext('2d');
			let weekCustomerKindChart = new Chart(weekCustomerKind, {
				
				type : 'bar',
				data: {
					
					labels : weekCustomerKindArr,
					datasets : [{
						
						data : weekCustomerSaleArr,
						backgroundColor:
		                        ['#27b2a5',
		                        'rgb(59,132,116)']
					}
					]
					
					
				},
				options : { 
					responsive : false,
					title : {
						display : false,   
						text : '?????? 7?????? ?????? ?????? / ????????? ?????? ????????????',
						fontSize : 20,
					},
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
									data=data.toString();
									data=data.split(/(?=(?:...)*$)/);
									data=data+"???"
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
								fontSize : 14,
								userCallback : function(value, index,
		                                 values) {
		                              value = value.toString();
		                              value = value.split(/(?=(?:...)*$)/);
		                              value = value.join(',');
		                              return value + "???";
		                           }
							}
						}]
						
					}
					
						
				}
				
				
			})
		
		
		let myChartOne = document.getElementById('myChartOne').getContext('2d');
		let barChart = new Chart(myChartOne, {
			
			type : 'bar',
			data: {
				
				labels : ['??????', '??????', '??????', '??????'],
				datasets : [{
					
					label : dayBeforeDayString + "(" + dayBeforeDayOfWeek + ")",
					data : [
						
						${bytimeSale2.morningSale},
						${bytimeSale2.AFTERNOON1Sale},
						${bytimeSale2.AFTERNOON2Sale},
						${bytimeSale2.EVENINGSale}
						
					],
					backgroundColor : '#27b2a5'
					
				},
				{
					
					
						label : yesterdayString + "(" + yesterdayOfWeek + ")" ,
						data : [
							
							${bytimeSale.morningSale},
			                ${bytimeSale.AFTERNOON1Sale},
			                ${bytimeSale.AFTERNOON2Sale},
			                ${bytimeSale.EVENINGSale}
							
						],
						backgroundColor : 'rgb(43,63,60)'
				
					
				}
				
				]
				
				
			}, 
			options : {
				title : {
					display : false,
					text : '???????????? ?????? ??????',
					fontSize : 20,
				},
				legend : {
					display : true,
					position : 'bottom',
					 labels: {
                         fontSize: 15,
                         fontColor: 'rgb(2,2,2)'
                         }
				},scales : {
					 xAxes: [{
						 barPercentage: 0.8,
				            gridLines: {
				                color: "rgba(0, 0, 0, 0)"
				            },
				            ticks : {
								fontSize : 12
							}
				        }],
					yAxes : [{
						
						ticks : {
							max : 800000,
							stepSize: 200000,
							beginAtZero: true,
							fontSize : 14,
							userCallback : function(value, index,
	                                 values) {
	                              value = value.toString();
	                              value = value.split(/(?=(?:...)*$)/);
	                              value = value.join(',');
	                              return value + "???";
	                           }
						}
					}]
					
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
								data=data.toString();
								data=data.split(/(?=(?:...)*$)/);
								data=data+"???"
								ctx.fillText(data, bar._model.x, bar._model.y - 5);
							});
						});
					}
				}

				
				
			}
			
			
		})
		

		let customerAnaly = document.getElementById('customerAnalysis').getContext('2d');
		let customerAnalyChart = new Chart(customerAnaly, {
			
			type : 'polarArea',
			data: {
				
				labels : ['??????', '??????', '??????', '??????'],
				datasets : [{
					
					data : [
						
						${bytimeSale.morningSale},
				        ${bytimeSale.AFTERNOON1Sale},
				        ${bytimeSale.AFTERNOON2Sale},
				        ${bytimeSale.EVENINGSale}
						
					],
					backgroundColor: [ "rgb(79,186,140)", "#27b2a5", "rgb(43,63,60)", "rgb(179,221,210)"]
					
				}
				]
				
				
			},

			options : {
				legend : {
					display : false
				},
				scale: {
				      ticks: {
				          display: false
				        }
				},
				pieceLabel: {
					mode:"label",
					position:"outside",
					fontSize: 12,
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
		<h4>???????????????</h4>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">????????????</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/financial/purchaseResport">????????????</a></li>
			</ul>
			
			
			<section>
			
					<div class="container" style="margin-left: 36px;"> 
							<div class="row" style="margin-bottom: 25px;">
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 200px">
										<div class="panel-heading">??? ??? ?????? ??????</div>
										<div class="panel-body" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
											<span id="yesterdaySales" ></span>
											<sapn> : </sapn>
											<span class="addBold" id="commaYesterDaySales"></span><br>
											<span style="float: left;">??? ??? ?????? ????????? : </span>
											<span style="float: left; margin-left: 5px;" class="addBold">${ returnSalesVO.dod }</span>
											<span style="float: left">
												<c:if test="${ returnSalesVO.dayBefore gt returnSalesVO.yesterday}">
													<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/down.png">
												</c:if>
												<c:if test="${ returnSalesVO.dayBefore lt returnSalesVO.yesterday}">
													<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/up.png">												
												</c:if>
											</span><br>
											<span id="salesDod"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 200px">
										<div class="panel-heading">?????? ?????? ??????</div>
										<div class="panel-body" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
											<span>?????? ?????? ?????? : </span>
											<span class="addBold"><fmt:formatNumber value="4953000" pattern="#,###" />???</span><br>
											<span style="float: left;">??? ??? ?????? ????????? : </span>
											<span class="addBold" style="float: left; margin-left: 5px;">10%</span><span style="float: left"><img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/down.png"></span><br>
											<span>??? ??? ?????? <span class="addBold"><fmt:formatNumber value="520000" pattern="#,###" />??? ??????</span></span>
									</div>		
									</div>
								</div>
								<div class="col-md-4">
									<div class="panel panel-default" style="height: 200px">
										<div class="panel-heading">?????? ?????? ??????</div>
										<div class="panel-body" style="font-size: 20px; font-size: 20px;margin-top: 15px; padding-right: 15px;">
											<span>?????? ?????? ?????? : </span>
											<span class="addBold" id="lastMonthSalesSum"></span><br>
											<span style="float: left">??? ??? ?????? ????????? : </span>
											<span style="float: left;" class="addBold">${monthSalesVO.mom}</span>
											<span style="float: left">
												<c:if test="${ monthSalesVO.lastLastMonthSales gt monthSalesVO.lastMonthSales}">
													<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/down.png">
												</c:if>
												<c:if test="${ monthSalesVO.lastLastMonthSales lt monthSalesVO.lastMonthSales}">
													<img class="upDownImg" src="${ pageContext.request.contextPath }/resources/img/up.png">												
												</c:if>
											</span><br>
											
											<span id="salesMom"></span>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-7">
									<div class="panel panel-default" style="width:536px; height: 340px;">
										<div class="panel-heading">?????? ????????? ?????? ??????</div>
										<div class="panel-body" style="margin-top: 30px;">
											<canvas id="myChartOne3" width="500" height="200"></canvas>
										</div>
									</div>
								</div>
								<div class="col-md-5">
									<div class="panel panel-default" style="width:374px">
										<div class="panel-heading">?????? ???????????? ???????????? TOP5</div>
										<div class="panel-body" style="margin-top: 30px;">
											<canvas id="cardSalesYop5Chart" width="300" height="200"></canvas>
											<span style="font-size: 9px;">
												*???????????? ???????????? ????????? ??????(2????????? : ??????,??????,?????? 3????????? : ??????,BC,??????,KB)
												 
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">??? ??? ?????? ?????? 7?????? ?????? ??????</div>
											<div class="panel-body" style="margin-top: 30px;">
												<canvas id="myChartOne4" style="display: block;width: 763px;height: 291px;"></canvas>
											</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="panel panel-default">
										<div class="panel-heading">??? ??? ?????? ?????? / ????????? ?????? ??????</div>
											<div class="panel-body" style="margin-top: 30px;">
												<canvas id="myChartOne5"></canvas>
												<div align="center">
													<table>
														<tr>
															<th style="padding-right: 41px;">?????? ?????????</th>
															<td id="perCutomerSale"></td>
														</tr>
															<c:forEach items="${ customerKindSaleList }" var="customerKindSaleList">
																<tr>
																	<th style="padding-right: 41px;">${ customerKindSaleList.customerKind }</th>
																	<td id="${ customerKindSaleList.customerKind }"></td>
																</tr>
															</c:forEach>
													</table>
												</div>
											</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="panel panel-default" style="height: 421px;">
										
										<div class="panel-heading">?????? ?????? ?????? / ????????? ?????? ????????????</div>
											<div>
											<div class="panel-body" style="margin-top: 30px;">
												<canvas id="weekCustomerKind" style="width: 393px; height: 259px; margin-top: 60px; " ></canvas>
											</div>
											</div>
									</div>
								</div>
								
							</div>
							
							
							<div class="row">
								<div class="col-md-8">
									<div class="panel panel-default">
										<div class="panel-heading">??? ??? ???????????? ?????? ??????</div>
											<div class="panel-body" style="margin-top: 30px;">
												<canvas id="myChartOne"></canvas>
											</div>
									</div>
								</div>
								<div class="col-md-4">
								
								<div class="panel panel-default" style="height: 412px;">
										<div class="panel-heading">??? ??? ???????????? ?????? ??????</div>
											<div class="panel-body" style="margin-top: 30px;">
										<table>
										<tr>
											<th id="reportDayByTime"></th>
										</tr>
										<tr>
											<th class="reportDayByTime">??????(06??? ~ 11???)</th>
											<td id="morningSale" align="right"></td>
										</tr>
										<tr>
											<th class="reportDayByTime">??????(11??? ~ 14???)</th>
											<td id="AFTERNOON1Sale" align="right"></td>
										</tr>
										<tr>
											<th class="reportDayByTime">??????(14??? ~ 17???)</th>
											<td id="AFTERNOON2Sale" align="right"></td>
										</tr>
										<tr>
											<th class="reportDayByTime">??????(17??? ~ 22???)</th>
											<td id="EVENINGSale" align="right"></td>
										</tr>
									</table>
												
										<canvas id="customerAnalysis" style="margin-top: 30px;"></canvas>		
												
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