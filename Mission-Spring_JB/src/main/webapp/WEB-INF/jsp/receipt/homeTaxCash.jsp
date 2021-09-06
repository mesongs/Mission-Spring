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
 

<!-- <style>

#comment-custom-receipt {
	/* max-width: 700px; */
	width: 1000px;
    margin-left: 350px;
	font-family: 'Noto Sans KR', sans-serif;
    margin-top: 30px;
	
}

#comment-custom-receipt > h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: xx-large;
}

.container {
	margin-top: 30px;
}

#receiptResgisterBtn {
	width : 410.5px;
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
 .receiptBtn{
 	width: 90px;
 	font-family: 'Noto Sans KR', sans-serif;
 }

.row.box{
	margin-left: 34px;
}


.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link{
	color : #495057;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active{
	color : #007BFF;
}
 
.nav.nav-tabs{

    font-family: 'Noto Sans KR', sans-serif;
}

.col-md-auto{
padding-right: 0px;
}

#searchWord{
	border-top-left-radius : 5px;
	border-bottom-left-radius : 5px;
	border-color: #999999;
	

}

input::placeholder{

	color : #495057;
}

.product-img {
    max-width:50px;
    max-height:50px;
	margin-top: -5px;
	margin-right: -10px;
}

 button{
 
 	color: #495057;
 }
 
  table {
    margin-top: 20px;
    border-top: 3px solid #495057;
    border-collapse: collapse;
    border-bottom: 4px solid #495057;
    
  }
  
  th, td {
    border-bottom: 1px solid #495057;
    padding: 10px;
  }
  
  
  th{
  	border-top: 3px solid #495057;
  }
  
 #excelBtn{
 	border-top-left-radius: 5px;
 	border-top-right-radius : 5px;
 	border-bottom-right-radius: 5px;
 	border-bottom-left-radius: 5px;
 }
 
 #searchBtn{
 	margin-left : -2px;
 	border-top-right-radius : 5px;
 	border-bottom-right-radius: 5px;
 }
 
 #perReceipt{
 	border-radius: 5px 5px 5px 5px; 
 }
 
 .calenderInput{
		background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 4px 9px; 
		background-size:15px; 
		padding:4px 2px 5px 25px;
		width: 120px;
		border-top-left-radius: 5px;
	 	border-top-right-radius : 5px;
	 	border-bottom-right-radius: 5px;
	 	border-bottom-left-radius: 5px;
	
	}
	
	#searchDate{
		height : 39px;
		border-top-left-radius: 5px;
	 	border-top-right-radius : 5px;
	 	border-bottom-right-radius: 5px;
	 	border-bottom-left-radius: 5px;
	
	}
 	
 tr:hover {
	background-color: #FEFDCF;
}
</style> -->

<style>
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
 	max-width: 20px;
    max-height: 20px;
 	margin-top: -5px;
    margin-right: 0px;
 }
 
}
</style>

<script>

	$(document).ready(function(){
		document.getElementById('searchDay').value = new Date().toISOString().substring(0, 10);
		
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
		
		
		// 목록 개수 ajax
		$(document).on('change','#perReceipt', function(){	
			
			let perReceipt = $('#perReceipt').val()
			
			switch(receiptKind) {
					  
				  case '15':
					receiptKind = 15
					break
			
				  case '30':
					receiptKind = 30
				    break								
				
				  case '50':
					receiptKind = 50
				    break
				    
				  case '100':
					receiptKind = 100   
					break 
				}
			
			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/getPerReceiptList",
				data : { perReceipt : perReceipt },
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 obj.forEach(function(perReceiptistList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str +="<td>" + perReceiptistList.receiptDate + "</td>"
							     str +="<td>" + perReceiptistList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + perReceiptistList.receiptNo + ">" + perReceiptistList.storeName +"</a></td>"; 
							     
							     str +="<td>" + perReceiptistList.sum +"원</td>";
							     str +="<td>" + perReceiptistList.purpose +"</td>";
							     
							     if(perReceiptistList.overlap == 'Y'){
					 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.jpg">' + "</td>"
							     }else{
				 					
							    	 str += "<td>" + "</td>"
				 				 }
			 					 str +="<td>" + perReceiptistList.memo +"</td>";
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
		
		//processedList();
		
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
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str += "<td>" + processedList.receiptDate + "</td>"
							     str += "<td>" + processedList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + processedList.receiptNo + ">" + processedList.storeName +"</a></td>"; 
							     str += "<td>" + processedList.sum +"원</td>";
							     str += "<td>" + processedList.purpose +"</td>";
							     
							     if(processedList.overlap == 'Y'){
				 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.jpg">' + "</td>"
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
							     str +="<td>" + searchDateList.receiptDate + "</td>"
							     str +="<td>" + searchDateList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchDateList.receiptNo + ">" + searchDateList.storeName +"</a></td>"; 
							     
							     str +="<td>" + searchDateList.sum +"원</td>";
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
		
		
		/* $('#searchDay').datepicker(
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
				
			}); */
		
	
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
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">홈택스 - 현금영수증 매입내역 조회</h4>
			</div>
			
		</div>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/register">영수증 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">영수증 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList">처리 대기</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/rejectReceiptList">반려된 영수증</a></li>
				<li class="nav-item"><a class="nav-link"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/homeTax.png">홈택스 연동</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/homeTax.png">현금영수증 부분 테스트</a></li>
			</ul> 
			
			<section>
					
					<div class="container" style="margin-left: 36px;"> 
					
							 	<div style="border: 3px solid; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
								 	<div class="row" style="height: 50px; width: 1050px; ;">
								 		<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;left: 15px;">사업자등록번호</div>
								 		<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${userVO.businessNo}</div> <!--UserVO가 가지고 있는 값  -->
								 		<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">상호</div>
								 		<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${userVO.storeName}</div>
								 	</div>
							 	</div>
								<div class="row" style="margin-top: 30px;">
									<div class="col-7" style="float: left;">
										<span style="float: left;">조회기간</span>
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
												<option value="202012">2020년 12월</option>
												<option value="202011">2020년 11월</option>
												<option value="202010">2020년 10월</option>
												<option value="202009">2020년 09월</option>
												<option value="202008">2020년 08월</option>
												<option value="202007">2020년 07월</option>
												<option value="202006">2020년 06월</option>
												<option value="202005">2020년 05월</option>
												<option value="202004">2020년 04월</option>
												<option value="202003">2020년 03월</option>
												<option value="202002">2020년 02월</option>
												<option value="202001">2020년 01월</option>
											</select>
											<select name="searchQuarter" id="searchQuarter" style="margin-left: 15px; float: left; width: 50px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; display: none;">
												<option value="1">2021년 1분기</option>
												<option value="2">2021년 2분기</option>
												<option value="3">2021년 3분기</option>
												<option value="4">2021년 4분기</option>
												<option value="5">2020년 1분기</option>
												<option value="6">2020년 2분기</option>
												<option value="7">2020년 3분기</option>
												<option value="8">2020년 4분기</option>
											</select>
											<span style="float: left">
												<button id="searchBtn" name="searchBtn" type="button" style="height : 35px;;margin-left: 6px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;">조회</button>
											</span>
									</div>
									<div class="col" style="width: 200px; " align="right" >
										<div >
											<input type="search" placeholder="검색어 입력" name="searchWord" id="searchWord" style="float: left; width: 150px; ">
											<span style="float: left">
											<button id="searchBtn" name="searchBtn" type="button">검색</button>
											</span>
										</div>
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
							<table style="margin-top: 30px;">
								<tr id="boardtable">
									<th><input type="checkbox" class="testBox" id="allCheck" value="1"></th>
									<th width="170px">매입일시</th>
									<th width="180px">가맹점 사업자번호</th>
									<th width="110px">가맹점명</th>
									<th width="100px">업종명</th>
									<th width="110px">공급가액</th>
									<th width="150px">부가세</th>
									<th width="150px">매입금액</th>
									<th width="130px">승인번호</th>
									<th width="100px">공제여부</th>
								</tr>
								
								<tbody id="test">
								 	<tr>
								 		<td><input type="checkbox" class="testBox" id="allCheck" value="1"></td>
								 		<td>2021-03-23 17:05:03</td>
								 		<td>605-25-91876</td>
								 		<td>대양슈퍼</td>
								 		<td>소매</td>
								 		<td>80,910</td>
								 		<td>8,090</td>
								 		<td>89,000</td>
								 		<td>147369422</td>
								 		<td>불공제</td>
								 	</tr>
								 	<tr>
								 		<td><input type="checkbox" class="testBox" id="allCheck" value="1"></td>
								 		<td>2021-03-23 17:05:03</td>
								 		<td>605-25-91876</td>
								 		<td>대양슈퍼</td>
								 		<td>소매</td>
								 		<td>80,910</td>
								 		<td>8,090</td>
								 		<td>89,000</td>
								 		<td>147369422</td>
								 		<td>불공제</td>
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