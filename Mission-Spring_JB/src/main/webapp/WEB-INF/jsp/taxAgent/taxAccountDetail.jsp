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

.blog-pagination .page-item.active .page-link{
	
		color : rgb(2,2,2);
		background : transparent;
		border-color : #222;
		
	}


table tbody th, table td {
    border-bottom: none;
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

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 사업자등록번호 '-' 추가
function bizNoFormatter(num, type) {

    var formatNum = '';

    try{

         if (num.length == 10) {

              if (type == 0) {

                   formatNum = num.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-*****');

              } else {

                    formatNum = num.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');

              }

         }

    } catch(e) {

         formatNum = num;

         console.log(e);

    }

    return formatNum;

}

// 날짜 포맷 변경
function YMDFormatter(num){

    if(!num) return "";

    var formatNum = '';



    // 공백제거

    num=num.replace(/\s/gi, "");



    try{

         if(num.length == 8) {

              formatNum = num.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');

         }

    } catch(e) {

         formatNum = num;

         console.log(e);

    }

    return formatNum;

}

</script>
<script>

	$(document).ready(function(){
		
		
		
		$('#writeForm').click(function(){
			
			let bNo = ${taxCustomer.businessNo};
			let storeName = '${taxCustomer.storeName}';
			location.href = '${ pageContext.request.contextPath }/taxAgent/taxWriteForm?bNo='+ bNo + "&storeName=" + storeName ;
			
			//location.href="search.jsp?type="+type+"&type2=type"+type2;

			
			
		})
		
		
		
		$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[type=checkbox]").prop('checked',true)
				
			}else{
				
				$("input[type=checkbox]").prop('checked',false)
				
			}
			
		})
		
		$("input:radio[name=searchDateDay]").click(function(){
            
											
//			$("#linkA").attr({href : www.google.com , target : _blank });
//			.css({"display":"block", "width":"50px"});

											    if($("input:radio[name=searchDateDay]:checked").val()=='1'){
											    	$("#searchQuarter").attr('style', "display:none;");
											    	$("#searchMonth").attr('style', "display:none;");
											    //	$("#searchDay").attr('style', "display:block;");
											    	$("#searchDay").css({"display":"block", "width":"160px", "color": "rgb(73, 80, 87)", "margin-bottom": "20px", "height": "35px", "border-top-width": "0px", "padding-bottom" : "0px", "margin-left": "15px;"})
											        
											    } else if($("input:radio[name=searchDateDay]:checked").val()=='2'){
											    	 $("#searchDay").attr('style', "display:none;");
											    	 $("#searchQuarter").attr('style', "display:none;");
											    //	 $("#searchMonth").attr('style', "display:block;");
											    	 $("#searchMonth").css({"display":"block", "width":"160px", "color": "rgb(73, 80, 87)", "margin-bottom": "20px", "height": "35px", "border-top-width": "0px", "padding-bottom" : "0px;"})
											    }else{
											    	$("#searchDay").attr('style', "display:none;");
											   // 	 $("#searchQuarter").attr('style', "display:block;");
											   		 $("#searchQuarter").css({"display":"block", "width":"160px", "color": "rgb(73, 80, 87)", "margin-bottom": "20px", "height": "35px", "border-top-width": "0px", "padding-bottom" : "0px;"})
											    	 $("#searchMonth").attr('style', "display:none;");
											    }
											});
		
		
		// 체크 상태 변화될 때마다 수정사항 표시
		/*$("input[type=checkbox]").change(function(){*/
		
		$(document).on('change','.testBox', function(){
			   
			   if($("input[type=checkbox]").is(":checked")){
				   
				   $.get("${ pageContext.request.contextPath }/receipt/replaceCheck", function(data){
					   $('#categoryAjax').replaceWith(data)
				   })
				   
			   }else{
				   
				   $.get("${ pageContext.request.contextPath }/receipt/replaceUnCheck", function(data){
					   $('#categoryAjax').replaceWith(data)
				   })
				   
			   }
			
		})
		
		
		
		
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
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">고객 증빙자료 수집/조회</h4>
			</div>
			
		</div>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/homeTaxPage">수입(매출)</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">비용(매입/일반경비)</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/receipt/homeTaxConnect">목록</a></li>
			</ul> 
			
			<section>
					
					<div class="container" style="margin-left: 36px;"> 
					
							 	<div style="border: 3px solid; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
								 	<div class="row" style="height: 50px; width: 1050px; ;">
								 		<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;left: 15px;">사업자등록번호</div>
								 		<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">605-23-55236</div> <!--UserVO가 가지고 있는 값  -->
								 		<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">상호</div>
								 		<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${taxCustomer.storeName}</div>
								 	</div>
							 	</div>
								<div class="row" style="margin-top: 30px;">
									<div class="col-7" style="float: left;">
										<span style="float: left; font-weight: bold; color: rgb(2,2,2); margin-top:7px; font-size: 17px;">조회기간 설정</span>
										
										
											<span style="margin-left: 20px;">
												 <input type="text" class="calenderInput" id="startDate" autocomplete="off" style="color: transparent; text-shadow: 0 0 0 rgba(2,2,2, 0.7);">
												 <span style=" color: rgb(2,2,2); margin-left: 2px; margin-top: 5px;">~</span>
												 <input type="text" class="calenderInput" id="endDate" autocomplete="off" style="margin-left: 2px; color: transparent; text-shadow: 0 0 0 rgba(2,2,2, 0.7)" >								
												 <button type="submit" id="searchDate" style="margin-left: 7px;">조회</button>
											</span>
										
										
										
										
										
										
										<select name="searchMonth" id="searchMonth" style="margin-left: 15px; float: left; width: 100px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; display: none;">
												<option value="202106">2021년 06월</option>
												<option value="202105">2021년 05월</option>
												<option value="202104">2021년 04월</option>
												<option value="202103">2021년 03월</option>
												<option value="202102">2021년 02월</option>
												<option value="202101">2021년 01월</option>
										</select>
											<select name="searchQuarter" id="searchQuarter" style="margin-left: 15px; float: left; width: 50px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; display: none;">
												<option value="1">2021년 1분기</option>
												<option value="2">2021년 2분기</option>
												<option value="3">2021년 3분기</option>
												<option value="4">2021년 4분기</option>
											</select>
											
											
									</div>
									
									
									<div class="col" align="right">
											<!-- <select name="taxAccept" id="taxAccept" style="margin-right: 10px;margin-left: 15px; width: 120px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px;">
												<option value="">공제여부</option>
												<option value="1">공제대상</option>
												<option value="2">불공제대상</option>
											</select> -->
											<button type="submit" id="excelBtn" style="float : right;"><img class="product-img" src="${ pageContext.request.contextPath }/resources/img/excel.png">Excel 다운로드</button>
									</div>
									
									
								</div>
								
								
								
								
								
			
							
						
						<!-- <div class="table-scroll-wrapper" style="overflow:auto; overflow-y:hidden"> -->

						<div class="row" style="width: 1080px">
							<div class="col" style="margin-bottom: 50px;">
							<table style="margin-top: 30px;" class="styled-table">
								<tr id="boardtable">
									<th><input type="checkbox" class="testBox" id="allCheck" value="1"></th>
									<th width="140px">매입일시</th>
									<th width="190px">가맹점 사업자번호</th>
									<th width="120px">가맹점명</th>
									<th width="90px">업종명</th>
									<th width="110px">공급가액</th>
									<th width="100px">부가세</th>
									<th width="150px">매입금액</th>
									<th width="140px">유형</th>
									<th width="130px">승인번호</th>
									<th width="110px">공제여부</th>
								</tr>
								
								<tbody id="test">
								 	<tr>
								 		<td><input type="checkbox" class="testBox" id="allCheck" value="1"></td>
								 		<td>2021-03-23</td>
								 		<td>605-25-91876</td>
								 		<td>대양슈퍼</td>
								 		<td>소매</td>
								 		<td>80,910원</td>
								 		<td>8,090원</td>
								 		<td>89,000원</td>
								 		<td>일반과세자</td>
								 		<td>147369422</td>
								 		<td>불공제</td>
								 	</tr>
								 	
								</tbody>
							</table>
							</div>
						</div>
						<!-- </div> 스크롤 랩퍼  -->
						<div class="row">
              <div class="col-lg-12">
                  <nav class="blog-pagination justify-content-center d-flex">
                      <ul class="pagination">
                          <li class="page-item">
                              <a href="#" class="page-link" aria-label="Previous">
                                  <span aria-hidden="true">
                                      <i class="ti-angle-left"></i>
                                  </span>
                              </a>
                          </li>
                          <li class="page-item active"><a href="#" class="page-link">1</a></li>
                          <li class="page-item"><a href="#" class="page-link">2</a></li>
                          <li class="page-item"><a href="#" class="page-link">3</a></li>
                          <li class="page-item">
                              <a href="#" class="page-link" aria-label="Next">
                                  <span aria-hidden="true">
                                      <i class="ti-angle-right"></i>
                                  </span>
                              </a>
                          </li>
                      </ul>
                  </nav>
              </div>
              <div class="row">
              	<div class="col" align="right"></div>
					<input type="button" id="writeForm" value="신고서 작성">
              </div>
              <div class="row" style="width: 1080px">
							<div class="col" style="margin-bottom: 50px;">
							<table style="margin-top: 30px;" class="styled-table">
								<tr id="boardtable">
									<th><input type="checkbox" class="testBox" id="allCheck" value="1"></th>
									<th width="140px">매입일시</th>
									<th width="190px">가맹점 사업자번호</th>
									<th width="120px">가맹점명</th>
									<th width="90px">업종명</th>
									<th width="110px">공급가액</th>
									<th width="100px">부가세</th>
									<th width="150px">매입금액</th>
									<th width="140px">유형</th>
									<th width="130px">승인번호</th>
									<th width="110px">공제여부</th>
								</tr>
								
								<tbody id="test">
								 	<tr>
								 		<td><input type="checkbox" class="testBox" id="allCheck" value="1"></td>
								 		<td>2021-03-23</td>
								 		<td>605-25-91876</td>
								 		<td>대양슈퍼</td>
								 		<td>소매</td>
								 		<td>80,910원</td>
								 		<td>8,090원</td>
								 		<td>89,000원</td>
								 		<td>일반과세자</td>
								 		<td>147369422</td>
								 		<td>불공제</td>
								 	</tr>
								 	
								</tbody>
							</table>
							</div>
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