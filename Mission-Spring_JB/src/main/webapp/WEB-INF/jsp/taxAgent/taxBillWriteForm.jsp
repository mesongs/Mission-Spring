<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list2.css?before">

<script src="${ pageContext.request.contextPath }/resources/js/html2canvas.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/jspdf.min.js"></script>

<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>




<style>


body{

	color: rgb(2,2,2);

}

tr:hover{
     background-color: #ffffff;
}

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
			html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
				
			    // 캔버스를 이미지로 변환
			    var imgData = canvas.toDataURL('image/png');
				
			    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
			    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			    var imgHeight = canvas.height * imgWidth / canvas.width;
			    var heightLeft = imgHeight;
			    var margin = 10; // 출력 페이지 여백설정
			    var doc = new jsPDF('p', 'mm');
			    var position = 0;
			       
			    // 첫 페이지 출력
			    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			    heightLeft -= pageHeight;
			         
			    // 한 페이지 이상일 경우 루프 돌면서 출력
			    while (heightLeft >= 20) {
			        position = heightLeft - imgHeight;
			        doc.addPage();
			        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			    }
			 
			    // 파일 저장
			    doc.save('매입처별_세금계산서_합계표.pdf');

				  
			});
			
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
		<div id="pdfDiv" class="container" align="center"; >			
			<section>
					<div class="container" style="margin-left: 36px;" align="center";>
						
						
						<div class="row">
							<table border="1px solid rgba(2, 2, 2, 0.5);" style="width:1250px; border-collapse:collapse">
								<tr>
									<td colspan="10" style="border: 0px; font-size: 15px;">■ 부가가치세법 시행규칙 [별지 제39호서식(1)] </td>
									<td colspan="2" style="border: 0px; padding-left: 84px; font-size: 15px;">홈택스(www.hometax.go.kr)에서도 신청할 수 있습니다.</td>
								</tr>
								
								<tr>
									<td colspan="12" style="text-align:center ;color: rgb(39,45,45); font-weight: bold; font-size: 34px;">
										매입처별 세금계산서합계표
									</td>
								</tr>
								<tr align="center">
									<td colspan="12">2021년 제 1기( 1월 1일 ~ 6월 31일 )</td>
								</tr>
								<tr align="left">
									<td colspan="12" style="font-size: 15px;">※ 아래의 작성방법을 읽고 작성하시기 바랍니다.</td>
								</tr>
								<tr>
									<th colspan="12" class="rowTitle">1. 제출자 인적사항</th>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">① 상호(법인명)</th>
									<td colspan="5">종범상회</td>
									<th colspan="3" class="centerCol">② 대표자</th>
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
									<th colspan="3" style="width:  3060px" class="centerCol">⑨ 공급가액</th>
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
									<th class="centerCol" style="width: 110px;">사업자등록번호 발급받은 분</td>
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
									<th colspan="3" class="centerCol" style="width: 90px;">⑭ 매수</th>
									<th colspan="2" class="centerCol" >⑮ 공급가액</th>
									<th colspan="2" class="centerCol" style="width: 1110px;">⑯ 세액</th>
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
								<tr align="center">
									<td colspan="12" style="font-weight: bold; color: rgb(2,2,2); background-color: rgb(238, 245, 243);">작 성 방 법</td>
								</tr>
								<tr>
									<td colspan="12">이 합계표는 아래의 작성방법에 따라 한글과 아라비아숫자로 정확하고 선명하게 적어야 하며, 공급가액과 세액은 원 단위까지 표시하여야 합니다.<br>
①~④: 제출자의 사업자등록증에 적힌 사업자등록번호(또는 고유번호), 상호(법인명), 성명(대표자), 사업장 소재지를 적습니다.<br>
⑤: 신고대상기간을 적습니다(예시: 2010년 1월 1일 ~ 2010년 6월 30일).<br>
⑥: 이 합계표를 작성하여 제출하는 연월일을 적습니다.<br>
⑦~⑩: 합계란에는 과세기간 종료일 다음 달 11일까지 전송된 전자세금계산서 발급받은 분 소계와 위 전자세금계산서 외의 발급받은 분 소계의 단순합계를 적습니다.
  과세기간 종료일 다음 달 11일까지 전송된 전자세금계산서 발급받은 분에는 전자세금계산서로 발급받고, 과세기간(예정신고대상자의 경우 예정신고기간) 종료일 다음 달 11일(토요일, 공휴일인 경우 그 다음 날)까지 국세청에 전송된 매입세금계산서에 대한 매입처 수, 총매수, 총공급가액 및 총세액을 적습니다.
  위 전자세금계산서 외의 발급받은 분에는 종이세금계산서, 전자세금계산서로 발급받았으나 그 개별명세가 과세기간(예정신고대상자의 경우 예정신고기간) 종료일 다음 달 11일(토요일, 공휴일인 경우 그 다음 날)까지 국세청에 전송되지 않은 전자세금계산서에 대한 매입처 수, 총매수, 총공급가액 및 총세액을 적습니다.</td>
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