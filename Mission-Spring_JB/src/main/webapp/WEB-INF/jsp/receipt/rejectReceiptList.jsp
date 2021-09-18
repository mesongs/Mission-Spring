<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?before">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>


 





<style>

	table tbody th, table td {
    border-bottom: none;
}

	.product-img2 {
	    max-width: 30px;
	    max-height: 50px;
	    margin-top: 0px;
	    margin-right: -10px;
    }
   
    .product-img3{
 	max-width: 30px;
    max-height: 30px;
 	margin-top: -5px;
    margin-right: 0px;
 }
 
 .nav-tabs .nav-link.active {
    color: #007BFF;
}
 .nav-link .active{
 	font-size: 19px;
 
 }
  #boardtable{
 	height: 60px;
    font-size: 18px;
    font-weight: bold;
 }
 
 .styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
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
		
		if('${ msg }')
			$('#myModal').modal('show');
			$('#alert-modal-body-msg').text('${ msg }');
		$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[type=checkbox]").prop('checked',true)
				
			}else{
				
				$("input[type=checkbox]").prop('checked',false)
				
			}
			
		})
		
		
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
		
		
		
		rejectList();
		
		function rejectList(){
			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/getRejectList",
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 obj.forEach(function(processedList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str += "<td>" + YMDFormatter(processedList.receiptDate) + "</td>"
							     str += "<td>" + processedList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/rejectDetail/" + processedList.receiptNo + ">" + processedList.storeName +"</a></td>"; 
							     str += "<td>" + numberWithCommas(processedList.sum) +"원</td>";
							     
							     if(processedList.overlap == 'Y'){
				 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.png">' + "</td>"
							     }else{
				 					
							    	 str += "<td>" + "</td>"
				 				 }
							     
							     str += "<td>"+ '<img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/reject.png">' + processedList.rejectReason + "</td>";
							     str += "<td>" + processedList.purpose +"</td>";
							     
							     
				 				 
							     /* str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.jpg">' + "</td>" */
							     /* str +="<td>" + processedList.overlap + "</td>" */
							     
			 					 str += "<td>" + processedList.memo +"</td>";
			 					 str += "</tr>"
			 					 $('#test').append(str);
			 					 
			 					 
			 					 
			 					 
			 					 // 받아온 overlap값이 'Y'이면, 경고 이미지 띄우기
			 					 // 'N'이면, empty
			 					 
			 					 
			 					 
			 					
						 })
					 }
					
				},
				error:function(request, status, error){
				    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
				
			})
			
		}
		
		
		$('#searchDate').click(function(){
			
			let startDate = $('#startDate').val();
 			let endDate = $('#endDate').val(); 
			
			//조회 버튼 누르면, 기간에 해당하는 값만 조회함
			$.ajax({
				type : "get",
				data : {startDate : startDate, endDate : endDate },
				url : "${pageContext.request.contextPath}/receipt/selectDate",
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
						 obj.forEach(function(searchDateList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str +="<td>" + YMDFormatter(searchDateList.receiptDate) + "</td>"
							     str +="<td>" + searchDateList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchDateList.receiptNo + ">" + searchDateList.storeName +"</a></td>"; 
							     
							     str +="<td>" + numberWithCommas(searchDateList.sum) +"원</td>";
							     str +="<td>" + searchDateList.purpose +"</td>";
							     
							     if(searchDateList.overlap == 'Y'){
					 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.jpg">' + "</td>"
							     }else{
				 					
							    	 str += "<td>" + "</td>"
				 				 }
			 					 str +="<td>" + searchDateList.memo +"</td>";
			 					 str +="</tr>"
			 					 $('#test').append(str);
						 })
					 }
					
				},
				error:function(request, status, error){
				    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
				
			})
			
		})
			
		
		
	
	})

</script>

<script>
	
//	function getSearchList(){
	
//	$(document).on("click", "button[name='searchBtn']", function () {
	  
	  $(document).on("click", "#searchBtn", function (){

	   $.ajax({
		 type : "POST",
		 url : "${ pageContext.request.contextPath }/receipt/processedListSearch",
		 data : {
				"searchWord" : $('#searchWord').val() 
		 	},
		 success : function(result){
			 let obj = JSON.parse(result);
	 		 /* $('#boardtable > tbody').empty(); */
	 		 $('#test').empty();
	 		 
			 if(obj.length >= 1){
				 
				 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
				 obj.forEach(function(searchprocessedList){
					 	 
					 	 str="<tr>"
					 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
					     str +="<td>" + YMDFormatter(searchprocessedList.receiptDate + "</td>"
					     str +="<td>" + searchprocessedList.receiptName + "</td>"
					     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchprocessedList.receiptNo + ">" + searchprocessedList.storeName +"</a></td>"; 
					     
					     str +="<td>" + numberWithCommas(searchprocessedList.sum) +"원</td>";
					     str +="<td>" + searchprocessedList.purpose +"</td>";
					     
					     if(searchprocessedList.overlap == 'Y'){
			 					
					    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.jpg">' + "</td>"
					     }else{
		 					
					    	 str += "<td>" + "</td>"
		 				 }
					     
	 					 str +="<td>" + searchprocessedList.memo +"</td>";
	 					 str +="</tr>"
	 					 $('#test').append(str);
	 					 
				 })
			 }
			 
		 }	 
		 
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
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">증빙관리</h4>
			</div>
			<div class="col" align="right">
				<span>
					 <input type="text" class="calenderInput" id="startDate" autocomplete="off" style="color: transparent; text-shadow: 0 0 0 rgba(2,2,2, 0.7);">
					 <span style=" color: rgb(2,2,2); margin-left: 2px; margin-top: 5px;">~</span>
					 <input type="text" class="calenderInput" id="endDate" autocomplete="off" style="margin-left: 2px; color: transparent; text-shadow: 0 0 0 rgba(2,2,2, 0.7)" >								
					 <button type="submit" id="searchDate" style="margin-left: 7px;">조회</button>
				</span>
			</div>
		</div>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/register"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/pictureReceipt.jpg">증빙자료 직접 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">처리 완료 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList">처리 대기 목록</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#" style="padding-bottom: 10px";>반려 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:doHomeTaxConnect()"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/autoCollect.png">전자 증빙자료 조회</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/allReceiptList">통합 매입/매출 조회</a></li>
			</ul> 
			
			<section>
					<div class="container" style="margin-left: 36px;"> 
							 <section id="categoryAjax">
								<div class="row">
									<div class="col-2">
										<select name="receiptKind" id="receiptKind" style="width: 150px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; ">
											<option value="">영수증 구분</option>
											<option value="1">세금계산서</option>
											<option value="2">계산서</option>
											<option value="3">카드영수증</option>
											<option value="4">간이영수증</option>
										</select>
									</div>
									<div class="col-2">
										<select name="overlap" id="overlap" style="width: 150px; margin-bottom: 20px; color: #495057; height: 35px; border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; " >
											<option value="">중복여부</option>
											<option value="1">중복의심</option>
											<option value="2">중복아님</option>
										</select>
									</div>
									<div class="col" style="width: 200px">
										<div>
											<input type="search" placeholder="검색어 입력" name="searchWord" id="searchWord" value="" style="float: left; width: 150px; ">
											<span style="float: left">
											<!-- <button id="searchBtn" type="button" onclick="getSearchList()">검색</button> -->
											<button id="searchBtn" name="searchBtn" type="button">검색</button>
											</span>
										</div>
										
									</div>
									<div class="col" align="right">
											  	<button type="submit" id="excelBtn" style="padding-left: 0px;"><img class="product-img" src="${ pageContext.request.contextPath }/resources/img/excel.png">Excel 다운로드</button>
									</div>
								</div>
							</section>
							
						
						<div class="table-scroll-wrapper" style="overflow:auto; overflow-y:hidden">

						<div class="row" style="width: 1500px">
							<div class="col" style="margin-bottom: 50px;">
							<table class="styled-table">
								<thead>
								<tr id="boardtable">
									<th><input type="checkbox" class="testBox" id="allCheck" value="1"></th>
									<th width="120px">사용일시</th>
									<th width="150px">구분</th>
									<th width="150px">업체명</th>
									<th width="150px">사용금액</th>
									<th width="130px">중복여부</th>
									<th width="350px">반려사유</th>
									<th width="150px">사용목적</th>
									<th width="500px">메모</th>
								</tr>
								</thead>
								
								<tbody id="test">
								 
								</tbody>
							</table>
							</div>
						</div>
						</div> <!--스크롤 랩퍼  -->
						
						<div class="row">
							<div class="col" style="margin-top: 25px;">
								<select name="perReceipt" id="perReceipt" style="width: 110px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px;">
									<option value="15">15개 보기</option>
									<option value="30">30개 보기</option>
									<option value="50">50개 보기</option>
									<option value="100">100개 보기</option>
								</select>
							</div>
						</div>
	
						
					</div>
				
			</section>
		</div>
	</div>
	
	<!-- Modal -->
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>