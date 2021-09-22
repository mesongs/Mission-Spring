<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
			    doc.save('신용카드매출전표_발행금액_집계표.pdf');

				  
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
		<div class="container" align="center"; >			
			<section>
					<div id="pdfDiv">
					<div class="container" style="margin-left: 36px;" align="center";>
						
						
						<div class="row">
							<table border="1px solid rgba(2, 2, 2, 0.5);" style="width:1250px; border-collapse:collapse">
								<tr>
									<td colspan="10" style="border: 0px; font-size: 15px;">■ 부가가치세법 시행규칙 [별지 제23호서식] <br><개정 2019. 3. 20.></td>
									<td colspan="2" style="border: 0px; padding-left: 84px; font-size: 15px;">홈택스(www.hometax.go.kr)에서도 신청할 수 있습니다.</td>
								</tr>
								<tr>
									<td colspan="12" style="text-align:center ;color: rgb(39,45,45); font-weight: bold; font-size: 34px;">
										신용카드매출전표등 발행금액 집계표
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
									<td colspan="5">${taxUserInfo.storeName}</td>
									<th colspan="3" class="centerCol">② 대표자</th>
									<td colspan="2">${taxUserInfo.name}</td>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">③ 사업장 소재지</th>
									<td colspan="5" >${taxUserInfo.addrJibun}</td>
									<th colspan="3" class="centerCol">④ 사업자등록번호</th>
									<td colspan="2">${taxUserInfo.bNo }</td>
								</tr>
								
								<tr>
									<th colspan="12" class="rowTitle">2. 신용카드매출전표등 발행금액 현황</th>		
								</tr>
								<tr>
									<th colspan="2" class="centerCol">구분</th>
									<th colspan="4" class="centerCol" style="width:205px;">⑤ 합계</th>
									<th colspan="1" class="centerCol" style="width: 170px;">⑥ 신용ㆍ직불ㆍ기명식 선불카드</th>
									<th colspan="3" class="centerCol">⑦ 현금영수증</th>
									<th colspan="2" class="centerCol" style="width: 240px;">⑧ 직불전자지급수단 및<br> 기명식선불전자지급수단 </th>
								</tr>
								<tr>
									<th colspan="2" class="centerCol">합계</th>
									<td colspan="3"><fmt:formatNumber value="${writeInfoVO.salesSum }" pattern="#,###" />원</td>
									<td colspan="2"><fmt:formatNumber value="${writeInfoVO.salesSum }" pattern="#,###" />원</td>
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
									<td colspan="5">0원</td>
									<th colspan="3" class="centerCol">⑩ 계산서 발급금액</th>
									<td colspan="2">0원</td>
								</tr>
								<tr>
									<td colspan="12"></td>
								</tr>
								<tr align="center">
									<td colspan="12" style="font-weight: bold; color: rgb(2,2,2); background-color: rgb(238, 245, 243);">작 성 방 법</td>
								</tr>
								<tr>
									<td colspan="12">1. 신용카드매출전표등 발행금액 현황(⑤~⑧): 부가가치세 과세 매출분, 면세 매출분 및 봉사료로 각각 구분하여 적고, <br>
   										과세 매출분란에는 공급대가(부가가치세 포함)를 적습니다.<br>
										2. 신용카드매출전표등 발행금액(⑤ 합계) 중 세금계산서(계산서) 발급명세(⑨ㆍ⑩): ⑨ 세금계산서 발급금액란에는 ⑤ 합계란의 과세 매출분 합계금액 중 세금계산서를 발급한 금액을 적고, ⑩ 계산서 발급금액란에는 ⑤ 합계란의 면세 매출분<br>
										합계금액 중 계산서를 발급한 금액을 각각 적습니다.</td>
								</tr>
								
							</table>
							</div>
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