<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?before">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

  <!--datePicker-->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 

<style>


 a:link { color: #797979; text-decoration: none;}
 a:hover { font-weight: bold; text-decoration: none;}


.blog-pagination .page-item.active .page-link{
	
		color : rgb(2,2,2);
		background : transparent;
		border-color : #222;
		
	}


table tbody th, table td {
    border-bottom: none;
    font-size : 20px;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

 .nav-tabs .nav-link.active {
	color: #007BFF;
}

	.product-img2 {
    max-width: 30px;
    max-height: 50px;
    margin-top: -5px;
    margin-right: -10px;
}

 .testbox2{
 	display: none;
 }
 
 .product-img3{
 	max-width: 30px;
    max-height: 30px;
 	margin-top: -5px;
    margin-right: 0px;
 
 }
 
  #collectBtn{
 
 	height : 35px;
 	margin-left: 6px;
 	border-top-left-radius: 5px;
 	border-top-right-radius: 5px;
 	border-bottom-left-radius: 5px;
 	border-bottom-right-radius: 5px;
 	background-color: rgb(2,2,2);
 	color : #fff;
 	border-color: rgb(2,2,2);
 	
 }
 
 #searchHometaxCash{
 	border-top-left-radius: 5px;
 	border-top-right-radius: 5px;
 	border-bottom-left-radius: 5px;
 	border-bottom-right-radius: 5px;
 
 }


 .product-img4{
 	max-width: 20px;
    max-height: 20px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 0px;
 }
 
.product-img5{
 	max-width: 35px;
    max-height: 30px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 6px;
    
 }
 
 .styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}
 
 
</style>



<script>

	$(document).ready(function(){
		
		// datepicker를 활용한 날짜 조회
		 $('#startDate').datepicker(
			{
			
				 dateFormat:'yy/mm/dd',
	             changeMonth: true,
	             changeYear: true,
	             dayNames: ['일요일','월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	     		 dayNamesMin : ['일','월','화','수','목','금','토'],
	     		 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			
				 // 시작일 선택 후 닫힐 때, 종료일의 최소 선택 가능 날짜는 시작일
				 // 시작일 이후로만 선택 가능한 종료일
				 onClose:function(selectedDate){
				
					// 종료일 태그에 mindate 속성 추가
					$('#endDate').datepicker("option","minDate", selectedDate)
			}
			
		});
		
		$('#endDate').datepicker({
			
				dateFormat:'yy/mm/dd',
	            changeMonth: true,
	            changeYear: true,
	            dayNames: ['일요일','월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    		dayNamesMin : ['일','월','화','수','목','금','토'],
	    		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				
				// 종료일 선택 후 닫힐 때, 시작일의 최대 선택 가능 날짜는 종료일
				onClose:function(selectedDate){
					
					$('#startDate').datepicker("option", "maxDate", selectedDate)
			}
			
		});
		
		
		
		
			
			
		
	
	})

</script>

</head>


<body>
	
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->

	<div class="comment-form-receipt" id="comment-custom-receipt" style="width: 1110px;">
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">세금신고서 작성</h4>
			</div>
			
		</div>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">부가가치세</a></li>
				<li class="nav-item"><a class="nav-link" href="#">종합소득세</a></li>
				<li class="nav-item"><a class="nav-link" href="#">과거 세무신고 내역 조회</a></li>
			</ul>
			
			<section>
					<div class="container" style="margin-left: 36px;">
					
					
						
					
					
						<div class="row" style="margin-top: 30px; margin-right: 0px; margin-left: 0px; margin-bottom: 30px;">
							 	<div style="width: 778px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
									<span style="margin-left: 6px; font-size: 17px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="margin-left: 3px; margin-bottom: 6px;">담당하시고 계신 '간편장부 대상자' 고객님의 부가가치세 신고에 필요한 증빙 자료를 조회하실 수 있습니다.</span>
								</div>
						</div>
						
						<div style="border: 3px solid; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
								<div class="row" style="height: 50px; width: 1050px; ;">
									<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;left: 15px;">사업자등록번호</div>
									<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${bNo}</div> <!--UserVO가 가지고 있는 값  -->
									<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">상호</div>
									<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${storeName}</div>
								</div>
						</div>
						
						
					
						<div class="row" style="margin-top: 30px;">
							 		<div class="col-7" style="float: left; width: 496px">
							 			<span style="float: left; font-weight: bold; color: rgb(2,2,2); margin-bottom: 10px; margin-top:3px; font-size: 17px; ">조회기간 설정</span>
							 			
							 			<select name="selectYear" id="selectYear" style="margin-left: 15px; float: left; width: 100px; margin-bottom: 20px; color:#495057; height: 35px;">
												<option value="2019">2019년</option>
												<option value="2020">2020년</option>
												<option value="2021" selected="selected">2021년</option>
										</select>
										<select name="selectOrder" id="selectOrder" style="margin-left: 15px; float: left; width: 100px; margin-bottom: 20px; color:#495057; height: 35px;">
												<option value="1" selected="selected">1기</option>
												<option value="2">2기</option>
										</select>
							 			<span style="float: left">
												<button id="searchWriteForm" name="searchWriteForm" type="button" style="height : 35px; margin-left: 15px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;border-top-right-radius: 5px;border-bottom-right-radius: 5px;">조회</button>
										</span>
							 		</div>
						</div>
						
						<table>
							<tr>
								<th>수입(매출)</th>
								<td>530,540원</td>
								
							</tr>
							<tr>
								<th>매입(비용)</th>
								<td>234,000원</td>
								
							</tr>
						</table>
						<hr>					
						<span style="font-weight: bold; font-size: 25px;"><img class="product-img5" src="${ pageContext.request.contextPath }/resources/img/ss3.png" style="margin-left: 3px; margin-bottom: 6px;">작성서류</span>
						<table class="styled-table" style="border: 1px solid; border-radius: 5px; width:706px;">
							<tr>
								<th style="border-top: 0px solid; background-color: rgba(73, 80, 87,0.14); font-size: 22px;">서식명</th>
							</tr>
							<tr>
								<td>부가가치세 신고서</td>
							</tr> 
							<tr>
								<td><a href="${ pageContext.request.contextPath }/taxAgent/cardSealesWriteForm">신용카드매출전표등 발행금액 집계표</a></td>
							</tr>
							<tr>
								<td>매입처별 계산서합계표</td>
							</tr>
							<tr>
								<td>매출처별 계산서합계표</td>
							</tr>
							<tr>
								<td>매입처별 세금계산서합계표</td>
							</tr>
							<tr>
								<td>매출처별 세금계산서합계표</td>
							</tr>
							<tr>
								<td>건물 등 감가상각자산 취득명세서</td>
							</tr>
							<tr>
								<td>공제받지 못할 매입세액 명세서</td>
							</tr>
							<tr>
								<td>현금매출명세서</td>
							</tr>
							<tr>
								<td>의제매입세액 공제신고서</td>
							</tr>
							
							
						</table>
						
						<table>
							<tr>
								
							</tr>
						</table>
					
					</div>
					
				
			</section>
		</div>

	</div>
	
	
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>