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
		
		$('#writeFile').click(function(){
			
			alert('pdf생성 테스트')
			// form 태그를 submit해야할 듯, 그전에 pdf 생성 테스트하기
			location.href='${ pageContext.request.contextPath }/taxAgent/writePDF'
		
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
										매입처별 세금계산서합계표
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
									<th colspan="2" class="centerCol">⑤ 거래기간</th>
									<td colspan="5" >2021-01-01 ~ 2021-06-31</td>
									<th colspan="3" class="centerCol">⑥ 작성일</th>
									<td colspan="2">2021-07-08</td>
								</tr>
								
								<tr>
									<th colspan="12" class="rowTitle">2. 매입세금계산서 총 합계</th>		
								</tr>
								<tr>
									<th colspan="2" class="centerCol">구분</th>
									<th colspan="4" class="centerCol">⑦ 매입처수</th>
									<th colspan="1" class="centerCol">⑧ 매수</th>
									<th colspan="3" class="centerCol">⑨ 공급가액</th>
									<th colspan="2" class="centerCol">⑩ 세 액</th>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">합계</th>
									<td colspan="4"></td>
									<td colspan="1"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th rowspan="3" class="centerCol">과세기간 종료일 다음 달 11일까지 전송된 전자세금계산서 발급받은 분</th>
									<th class="centerCol">사업자등록번호 발급받은 분</td>
									<td colspan="4"></td>
									<td colspan="1"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
									
									
								</tr>
								<tr>
									<th class="centerCol">주민등록번호 발급받은 분</td>
									
									<td colspan="4"></td>
									<td colspan="1"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th class="centerCol">소 계</td>
									
									<td colspan="4"></td>
									<td colspan="1"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								
								<tr>
									<th rowspan="3" class="centerCol">위 전자세금계산서 외의 발급받은 분</th>
									<th class="centerCol">사업자등록번호 발급받은 분</td>
									<td colspan="4"></td>
									<td colspan="1"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
									
									
								</tr>
								<tr>
									<th class="centerCol">주민등록번호 발급받은 분</td>
									
									<td colspan="4"></td>
									<td colspan="1"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th class="centerCol">소 계</td>
									
									<td colspan="4"></td>
									<td colspan="1"></td>
									<td colspan="3"></td>
									<td colspan="2"></td>
								</tr>
								
								<tr>
									<td colspan="12">* 주민등록번호로 발급받은 세금계산서는 사업자등록 전 매입세액 공제를 받을 수 있는 세금계산서만 적습니다.</td>
								</tr>
								
								
								
								
								<tr>
									<th colspan="12" class="rowTitle">3. 과세기간 종료일 다음 달 11일까지 전송된 전자세금계산서 외 발급받은 매입처별 명세 (합계금액으로 적음)</th>
								</tr>
								
								<tr>
									<th class="centerCol" style="width: 160px;">⑪ 번호</th>
									<th colspan="4" class="centerCol">⑫사업자등록번호</th>
									<th colspan="1" class="centerCol" style="width: 100px;">⑬ 상호(법인명)</th>
									<th colspan="3" class="centerCol">⑭ 매수</th>
									<th colspan="2" class="centerCol">⑮ 공급가액</th>
									<th colspan="2" class="centerCol" style="width: 100px;">⑯ 세액</th>
								</tr>
								
								<tr>
									
									<td class="centerCol">1</td>
									<td colspan="4" class="centerCol"><input type="text" style="border: none; background-color: transparent;"></td>
									<td colspan="1" class="centerCol"></td>
									<td colspan="3" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
								</tr>
								<tr>
									
									<td class="centerCol">2</td>
									<td colspan="4" class="centerCol"></td>
									<td colspan="1" class="centerCol"></td>
									<td colspan="3" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
								</tr>
								<tr>
									
									<td class="centerCol">3</td>
									<td colspan="4" class="centerCol"></td>
									<td colspan="1" class="centerCol"></td>
									<td colspan="3" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
								</tr>
								<tr>
									
									<td class="centerCol">4</td>
									<td colspan="4" class="centerCol"></td>
									<td colspan="1" class="centerCol"></td>
									<td colspan="3" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
								</tr>
								<tr>
									
									<td class="centerCol">5</td>
									<td colspan="4" class="centerCol"></td>
									<td colspan="1" class="centerCol"></td>
									<td colspan="3" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
									<td colspan="2" class="centerCol"></td>
								</tr>
								
							</table>
							<div style="margin: auto;">
								<!-- submit으로 form태그 넘겨야하는데 테스트를 위해 button 으로  -->
								<input type="button" class="button submit_btn" id="writeFile" style="border-radius:30px; color:#fff background-color: #27b2a5; margin-right:10px; margin-top: 20px; font-size: 21px;" value="작성">
								<input type="button" class="button submit_btn" id="goList" style="margin-left:10px; color:#999999;background-color: rgba(134, 139, 178, 0.25); margin-top: 20px; font-size: 21px ; border-radius : 30px; border: 0px;" value="목록">
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