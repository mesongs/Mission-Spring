<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list2.css?before">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>




<style>

 #writeFile{
 	border :0px;
 	font-size: large;
 	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	-ms-border-radius: 30px;
	border-radius: 30px;
	color : #fff;
 	background-color :#27b2a5;
 	
 }
 
 


.blog-pagination .page-item.active .page-link{
	
		color : rgb(2,2,2);
		background : transparent;
		border-color : #222;
		
	}

.rowTitle{
	background-color: #ffffff;
	text-align: left;

}

.centerCol{
text-align: center;

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

</style>

<script>

	$(document).ready(function(){
		
		$('#goList').click(function(){
			
			location.href='${ pageContext.request.contextPath }/taxAgent/taxWriteForm?bNo='+ '6052355236' + "&storeName=" + '종범상회'
			
		})
	
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
		<hr>
		<div class="container" align="center"; >			
			<section>
					<div class="container" style="margin-left: 36px;" align="center";>
						
						
						<div class="row">
							<table border="1px solid rgba(2, 2, 2, 0.5);" style="width:1250px; border-collapse:collapse">
								<tr>
									<td colspan="12" style="text-align:center ;color: rgb(39,45,45); font-weight: bold; font-size: 34px;">
										신용카드매출전표등 발행금액 집계표
									</td>
								</tr>
								<tr>
									<th colspan="12" class="rowTitle">1. 제출자 인적사항</th>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">① 상호(법인명)</th>
									<td colspan="5">종범상회</td>
									<th colspan="3" class="centerCol">② 성명(대표자)</th>
									<td colspan="2">박종범</td>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">③ 사업장 소재지</th>
									<td colspan="5" >부산진구 부암동</td>
									<th colspan="3" class="centerCol">④ 사업자등록번호</th>
									<td colspan="2">605-23-55236</td>
								</tr>
								
								<tr>
									<th colspan="12" class="rowTitle">2. 신용카드매출전표등 발행금액 현황</th>		
								</tr>
								<tr>
									<th colspan="2" class="centerCol">구분</th>
									<th colspan="4" class="centerCol" style="width:105px;">⑤ 합계</th>
									<th colspan="1" class="centerCol" style="width: 170px;">⑥ 신용ㆍ직불ㆍ기명식 선불카드</th>
									<th colspan="3" class="centerCol">⑦ 현금영수증</th>
									<th colspan="2" class="centerCol" style="width: 240px;">⑧ 직불전자지급수단 및 기명식선불전자지급수단 </th>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">합계</th>
									<td colspan="3"></td>
									<td colspan="2"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">과세 매출분</th>
									<td colspan="3"></td>
									<td colspan="2"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">면세 매출분</th>
									<td colspan="3"></td>
									<td colspan="2"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">봉사료</th>
									<td colspan="3"></td>
									<td colspan="2"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								
								<tr>
									<th colspan="12" class="rowTitle">3. 신용카드매출전표등 발행금액(⑤ 합계) 중 세금계산서(계산서) 발급명세</th>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">⑨ 세금계산서 발급금액</th>
									<td colspan="5"></td>
									<th colspan="3" class="centerCol">⑩ 계산서 발급금액</th>
									<td colspan="2"></td>
								</tr>
								
								
							</table>
							<div style="margin: auto;">
								<input type="submit" class="button submit_btn" id="writeFile" style="border-radius:30px; color:#fff background-color: #27b2a5; margin-right:10px; margin-top: 20px; font-size: 21px;" value="작성">
								<input type="submit" class="button submit_btn" id="goList" style="margin-left:10px; color:#999999;background-color: rgba(134, 139, 178, 0.25); margin-top: 20px; font-size: 21px ; border-radius : 30px; border: 0px;" value="목록">
							</div>
						</div>
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