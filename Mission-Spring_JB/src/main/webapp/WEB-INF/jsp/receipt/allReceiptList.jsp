<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?after">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

  <!--datePicker-->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 


<style>

	table tbody th, table td {
    border-bottom: none;
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
 
 .product-img4{
 	max-width: 20px;
    max-height: 20px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 0px;
 }
 
 #boardtable{
 	height: 60px;
    font-size: 18px;
    font-weight: bold;
 }
 
 .styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

 #test > th{
 	text-align: center;
 }

 
</style>

<script>
	
	$(document).ready(function(){
		
		$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[name=wantCheck]").prop('checked',true)
				
			}else{
				
				$("input[name=wantCheck]").prop('checked',false)
				
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
		
		// 영수증 구분에 따른 ajax
		//$('#receiptKind').change(function(){
		$(document).on('change','#receiptKind', function(){	
			
			let receiptKind = $('#receiptKind').val()
			
			switch(receiptKind) {
					  
				  case '0':
					receiptKind = '000'
					break
			
				  case '1':
					receiptKind = '001'
				    break								
				
				  case '2':
					receiptKind = '002'
				    break
				    
				  case '3':
					receiptKind = '003'   
					break 
					
				  case '4':
					receiptKind = '004'   
				   	break
				}
			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/getReceiptKindList",
				data : {receiptKind : receiptKind},
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
						 obj.forEach(function(receiptKindList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" name="wantCheck" class="testBox">' + "</td>" 
							     str +="<td>" + receiptKindList.receiptDate + "</td>"
							     str +="<td>" + receiptKindList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + receiptKindList.receiptNo + ">" + receiptKindList.storeName +"</a></td>"; 
							     
							     str +="<td>" + receiptKindList.sum +"원</td>";
							     str +="<td>" + receiptKindList.purpose +"</td>";
							     if(receiptKindList.overlap == 'Y'){
					 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.png">' + "</td>"
							     }else{
				 					
							    	 str += "<td>" + "</td>"
				 				 }
			 					 str +="<td>" + receiptKindList.memo +"</td>";
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
		
		
		
//		processedList();
		
		function processedList(){
			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/processedAllList",
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
						 obj.forEach(function(processedList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" name="wantCheck" class="testBox">' + "</td>" 
							     str += "<td>" + processedList.receiptDate + "</td>"
							     str += "<td>" + processedList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + processedList.receiptNo + ">" + processedList.storeName +"</a></td>"; 
							     str += "<td>" + processedList.sum +"원</td>";
							     str += "<td>" + processedList.purpose +"</td>";
							     
							     if(processedList.overlap == 'Y'){
				 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.png">' + "</td>"
							     }else{
				 					
							    	 str += "<td>" + "</td>"
				 				 }
				 				 
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
		
		
		
		
		
		//통합 매입내역 조회
		$('#searchAllPurchase').click(function(){
			
			let purchaseDate = $('#searchMonth').val();
			
			
			
			
			
			// purchaseDate는 사용자가 선택한 값임 hidden에 넣어서 넘기기
			// 색인
			
			var sendArray = [];
			
			$("input[name=tblChk]:checked").each(function(){
				sendArray.push($(this).val());
			});
			
			var cnt = sendArray.length
			
			
			
			
			
			//조회 버튼 누르면, 기간에 해당하는 값만 조회함
			$.ajax({
				type : "get",
				async : false,
				data : { purchaseDate : purchaseDate, sendArray : sendArray, cnt : cnt },
				url : "${pageContext.request.contextPath}/receipt/getAllReceiptSalese",
				
				success : function(result){
					
					console.log(result.IntegratedSalesList)
					
					let obj = JSON.parse(result);
					
					IntegratedList = obj.IntegratedSalesList;
					
					let allAmount = numberWithCommas(obj.amountSum);
					let allVat = numberWithCommas(obj.vatSum);
					
					document.getElementById("allAmount").innerHTML=allAmount + "원" ;
					document.getElementById("allVat").innerHTML=allVat + "원" ;
					
					
					$('#calculate').css("display", "block");   

					
					 
			 		 $('#test').empty();
			 		 
					 if(IntegratedList.length >= 1){
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
						 IntegratedList.forEach(function(IntegratedSalesList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" name="wantCheck" id="" class="testBox">' + "</td>" 
							     str +="<td>" + YMDFormatter(IntegratedSalesList.receiptDate) + "</td>"
							     str +="<td>" + IntegratedSalesList.receiptCode + "</td>"
							     str +="<td>" + bizNoFormatter(IntegratedSalesList.supplierBusinessNo,1) + "</td>"
							     str +="<td>" + IntegratedSalesList.supplierStoreName + "</td>"
							     str +="<td>" + numberWithCommas(IntegratedSalesList.amount) +"원</td>";
			 					 str +="<td>" + numberWithCommas(IntegratedSalesList.vat) +"원</td>";
							     str +="<td>" + numberWithCommas(IntegratedSalesList.calSum) +"원</td>";
							     str +="<td>" + IntegratedSalesList.division + "</td>";
			 					 str +="</tr>"
			 					 
			 					 $('#test').append(str);
						 })
					 }
					 
					 let amountValue = $('#allAmount').text();
					 let vatValue = $('#allVat').text();
						
						// 조회 버튼 클릭하면, 사용자가 선택한 날짜, 체크한 체크박스 값을 넘겨야함
						$('#purchaseDate').attr('value',purchaseDate);
						$('#sendArray').attr('value', sendArray);
						$('#amountValue').attr('value', amountValue);
						$('#vatValue').attr('value', vatValue);
					
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
					 	 str += "<td " + 'class="testbox2">' + searchprocessedList.receiptNo + "</td>"
					 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>"

					     str +="<td>" + searchprocessedList.receiptDate + "</td>"
					     str +="<td>" + searchprocessedList.receiptName + "</td>"
					     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchprocessedList.receiptNo + ">" + searchprocessedList.storeName +"</a></td>"; 
					     
					     str +="<td>" + searchprocessedList.sum +"원</td>";
					     str +="<td>" + searchprocessedList.purpose +"</td>";
					     
					     if(searchprocessedList.overlap == 'Y'){
			 					
					    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.png">' + "</td>"
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
		</div>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/register"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/pictureReceipt.jpg">증빙자료 직접 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="#" style="padding-bottom: 10px";>처리 완료 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList">처리 대기 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/rejectReceiptList">반려 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/receipt/homeTaxConnect"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/autoCollect.png">전자 증빙자료 조회</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#" style="border-bottom-width: 3px;">통합 매입/매출 조회</a></li>
			</ul> 
			
			<section>
					<div class="container" style="margin-left: 36px;"> 
							
							<div class="row" style="margin-top: 30px; margin-right: 0px; margin-left: 0px;">
							 	<div style="width: 706px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
									<span style="margin-left: 6px; font-size: 17px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="margin-left: 3px; margin-bottom: 6px;">고객님의 사업장에서 발생한 매출내역, 고객님 명의로 발행된 매입내역을 조회하실 수 있습니다.</span>
								</div>
							</div>
							
							 	
							 	<div class="row" style="margin-top: 30px;">
							 		<div class="col-7" style="float: left; width: 496px">
							 			<span style="float: left; font-weight: bold; color: rgb(2,2,2); margin-bottom: 10px; ">분류</span>
							 			<label style="float: left;"><input type="checkbox" name="tblChk" value="001" style="margin-left: 10px;">세금계산서</label> 
							 			<label style="float: left;"><input type="checkbox" name="tblChk" value="002" style="margin-left: 10px;">계산서</label> 
							 			<label style="float: left;"><input type="checkbox" name="tblChk" value="003" style="margin-left: 10px;">카드영수증</label> 
							 			<label style="float: left;"><input type="checkbox" name="tblChk" value="004" style="margin-left: 10px;">간이영수증</label>
							 			<label style="float: left;"><input type="checkbox" name="tblChk" value="005" style="margin-left: 10px;">현금영수증</label>
							 		</div>
							 		
							 		<div class="col" style="width: 200px; " align="right" >
										<div style="margin-left: 206px;">
											<input type="search" placeholder="사업자등록번호 검색" name="searchWord" id="searchWord" style="float: left; width: 170px; ">
											<span style="float: left">
											<button id="searchBtn" name="searchBtn" type="button">검색</button>
											</span>
										</div>
									</div>
									
									<div class="col-7" style="float: left; margin-top: 10px;">
							 			<span style="float: left; font-weight: bold; color: rgb(2,2,2); margin-bottom: 10px;">구분</span>
							 			<label style="float: left;"><input type="radio" name="purchaseRadio" value="1" style="margin-left: 10px;">매입</label> 
										<label style="float: left;"><input type="radio" name="purchaseRadio" value="2" style="margin-left: 10px;">매출</label>
							 		</div>
							 		
							 		
							 		
							 	</div>
							 	
								
								<div class="row" style="margin-top: 10px;">
									<div class="col-7" style="float: left;">
										<span style="float: left; font-weight: bold; color: rgb(2,2,2);">조회기간</span>
										<label style="float: left;"><input type="radio" name="searchDateDay" value="1" style="margin-left: 10px;" checked="checked"> 일별</label> 
										<label style="float: left;"><input type="radio" name="searchDateDay" value="2" style="margin-left: 10px;"> 월별</label>
										<label style="float: left;"><input type="radio" name="searchDateDay" value="3"style="margin-left: 10px;"> 분기별</label>
										<!-- <span style="float: left;"><input type="date" name="searchDay" id="searchDay" style="margin-left: 15px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; display: block;"></span> -->
										<span style="float: left;"><input type="date" class="searchDay" id="searchDay" autocomplete="off" style="margin-left: 10px;border-bottom-right-radius: 5px; border-top-left-radius: 5px;border-bottom-left-radius: 5px; border-top-right-radius : 5px; border-top-left-radius : 5px; width : 160px;color: transparent; text-shadow: 0 0 0 rgba(2,2,2, 0.7); height: 35px;"></span>
										
										<select name="searchMonth" id="searchMonth" style="margin-left: 15px; float: left; width: 100px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; display: none;">
												<option value="202109">2021년 09월</option>
												<option value="202108">2021년 08월</option>
												<option value="202107">2021년 07월</option>
												<option value="202106">2021년 06월</option>
												<option value="202105">2021년 05월</option>
												<option value="202104">2021년 04월</option>
												<option value="202103">2021년 03월</option>
												<option value="202102">2021년 02월</option>
												<option value="202101">2021년 01월</option>
											</select>
											<select name="searchQuarter" id="searchQuarter" style="margin-left: 15px; float: left; width: 50px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; display: none;">
												<option value="20210101">2021년 1분기</option>
												<option value="20210401">2021년 2분기</option>
												<option value="20210701">2021년 3분기</option>
												<option value="20211001">2021년 4분기</option>
											</select>
											<span style="float: left">
												<button id="searchAllPurchase" name="searchAllPurchase" type="button" style="height : 35px; margin-left: 6px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;border-top-right-radius: 5px;border-bottom-right-radius: 5px;">조회</button>
											</span>
											
									</div>
									
									<div class="col" align="right">
												<form action="${ pageContext.request.contextPath }/receipt/excelDown" method="get">
													<input type="hidden" id="purchaseDate" name="purchaseDate" value="">
													<input type="hidden" id="sendArray" name="sendArray" value="">
													<input type="hidden" id="amountValue" name="amountValue" value="">
													<input type="hidden" id="vatValue" name="vatValue" value="">
													<button type="submit" id="excelBtn" style="float : right;"><img class="product-img" src="${ pageContext.request.contextPath }/resources/img/excel.png">Excel 다운로드</button>
												</form>
									</div>
									
								</div>
								
								<div class="row" id="calculate" style="margin-top: 10px; margin-left: 0px; display: none;" >
							 		<span style="float: left; font-weight: bold; color: rgb(2,2,2);">합계</span>
							 		<span style="float: left; margin-left:10px;">공급가액 : </span>
									<span style="float: left; margin-left: 5px; font-weight: bold;" id="allAmount"></span>
									<span style="float: left; margin-left: 5px; ">부가세 : </span>
									<span style="float: left; margin-left: 5px; font-weight: bold;" id="allVat"></span>
							 	</div>
			
							
						
						<!-- <div class="table-scroll-wrapper" style="overflow:auto; overflow-y:hidden"> -->

						<div class="row" style="width: 1080px">
							<div class="col" style="margin-bottom: 50px;">
							<table style="margin-top: 30px" class="styled-table">
								<tr id="boardtable">
									<th><input type="checkbox" class="testBox" id="allCheck" value="1"></th>
									<th width="120px">매입일시</th>
									<th width="120px">발급유형</th>
									<th width="150px">사업자등록번호</th>
									<th width="160px">상호명</th>
									<th width="110px">공급가액</th>
									<th width="100px">부가세</th>
									<th width="120px">합계금액</th>
									<th width="138px">구분</th>
								</tr>
								
								<tbody id="test">
								 	<tr>
								 		<td><input type="checkbox" class="testBox" id="allCheck" value="1"></td>
								 		<td>20210630</td>
								 		<td>세금계산서</td>
								 		<td>6099192931</td>
								 		<td>사오수산</td>
								 		<td>80,910</td>
								 		<td>8,090</td>
								 		<td>89,000</td>
								 		<td>전자증빙</td>
								 	</tr>
								</tbody>
							</table>
							</div>
						</div>
						<!-- </div> 스크롤 랩퍼  -->
						
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
	
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>