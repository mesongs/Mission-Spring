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


	table tbody th, table td {
    border-bottom: 1px solid rgba(2,2,2,0.1);
    
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

// ????????????????????? '-' ??????
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

// ?????? ?????? ??????
function YMDFormatter(num){

    if(!num) return "";

    var formatNum = '';



    // ????????????

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
		
		$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[type=checkbox]").prop('checked',true)
				
			}else{
				
				$("input[type=checkbox]").prop('checked',false)
				
			}
			
		})
		
		
		// ?????? ?????? ????????? ????????? ???????????? ??????
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
		
		// ????????? ????????? ?????? ajax
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
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5?????? for?????? ?????????
						 obj.forEach(function(receiptKindList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str +="<td>" + YMDFormatter(receiptKindList.receiptDate) + "</td>"
							     str +="<td>" + receiptKindList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + receiptKindList.receiptNo + ">" + receiptKindList.storeName +"</a></td>"; 
							     
							     str +="<td>" + numberWithCommas(receiptKindList.sum) +"???</td>";
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
		
		// ?????? ?????? ajax
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
							     str +="<td>" + YMDFormatter(perReceiptistList.receiptDate) + "</td>"
							     str +="<td>" + perReceiptistList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + perReceiptistList.receiptNo + ">" + perReceiptistList.storeName +"</a></td>"; 
							     
							     str +="<td>" + numberWithCommas(perReceiptistList.sum) +"???</td>";
							     str +="<td>" + perReceiptistList.purpose +"</td>";
							     
							     if(perReceiptistList.overlap == 'Y'){
					 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.png">' + "</td>"
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
		
		processedList();
		
		function processedList(){
			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/processedAllList",
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5?????? for?????? ?????????
						 obj.forEach(function(processedList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str += "<td>" + YMDFormatter(processedList.receiptDate) + "</td>"
							     str += "<td>" + processedList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + processedList.receiptNo + ">" + processedList.storeName +"</a></td>"; 
							     str += "<td>" + numberWithCommas(processedList.sum) +"???</td>";
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
			 					 
			 					 
			 					 
			 					 
			 					 // ????????? overlap?????? 'Y'??????, ?????? ????????? ?????????
			 					 // 'N'??????, empty
			 					 
			 					 
			 					 
			 					
						 })
					 }
					
				},
				error:function(request, status, error){
				    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
				
			})
			
		}
		
		
		// datepicker??? ????????? ?????? ??????
		 $('#startDate').datepicker(
			{
			
				 dateFormat:'yy/mm/dd',
	             changeMonth: true,
	             changeYear: true,
	             dayNames: ['?????????','?????????', '?????????', '?????????', '?????????', '?????????', '?????????'],
	     		 dayNamesMin : ['???','???','???','???','???','???','???'],
	     		 monthNamesShort: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'],
			
				 // ????????? ?????? ??? ?????? ???, ???????????? ?????? ?????? ?????? ????????? ?????????
				 // ????????? ???????????? ?????? ????????? ?????????
				 onClose:function(selectedDate){
				
					// ????????? ????????? mindate ?????? ??????
					$('#endDate').datepicker("option","minDate", selectedDate)
			}
			
		});
		
		$('#endDate').datepicker({
			
				dateFormat:'yy/mm/dd',
	            changeMonth: true,
	            changeYear: true,
	            dayNames: ['?????????','?????????', '?????????', '?????????', '?????????', '?????????', '?????????'],
	    		dayNamesMin : ['???','???','???','???','???','???','???'],
	    		monthNamesShort: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'],
				
				// ????????? ?????? ??? ?????? ???, ???????????? ?????? ?????? ?????? ????????? ?????????
				onClose:function(selectedDate){
					
					$('#startDate').datepicker("option", "maxDate", selectedDate)
			}
			
		});
		
		
		$('#excelBtn').click(function(){
			
			 // ?????? ???????????? ??????
			 location.href ="${ pageContext.request.contextPath }/receipt/getListExcelFile";
		
		})
		
		
		
		/////////////////////////////////// datePicker??? ????????? ?????? ??????********
		$('#searchDate').click(function(){
			
			let startDate = $('#startDate').val();
 			let endDate = $('#endDate').val(); 
			
			//?????? ?????? ?????????, ????????? ???????????? ?????? ?????????
			$.ajax({
				type : "get",
				data : {startDate : startDate, endDate : endDate },
				url : "${pageContext.request.contextPath}/receipt/selectDate",
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5?????? for?????? ?????????
						 obj.forEach(function(searchDateList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str +="<td>" + YMDFormatter(searchDateList.receiptDate) + "</td>"
							     str +="<td>" + searchDateList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchDateList.receiptNo + ">" + searchDateList.storeName +"</a></td>"; 
							     
							     str +="<td>" + numberWithCommas(searchDateList.sum) +"???</td>";
							     str +="<td>" + searchDateList.purpose +"</td>";
							     
							     if(searchDateList.overlap == 'Y'){
					 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.png">' + "</td>"
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
				 
				 // for(receipt vo(=searchWaitList) : receiptList) 1.5?????? for?????? ?????????
				 obj.forEach(function(searchprocessedList){
					 	 
					 	 str="<tr>"
					 	 str += "<td " + 'class="testbox2">' + searchprocessedList.receiptNo + "</td>"
					 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>"

					     str +="<td>" + YMDFormatter(searchprocessedList.receiptDate) + "</td>"
					     str +="<td>" + searchprocessedList.receiptName + "</td>"
					     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchprocessedList.receiptNo + ">" + searchprocessedList.storeName +"</a></td>"; 
					     
					     str +="<td>" + numberWithCommas(searchprocessedList.sum) +"???</td>";
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

</head>


<body>
	
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->
	
	<div class="comment-form-receipt" id="comment-custom-receipt" style="width: 1110px;">
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">????????????</h4>
			</div>
			<div class="col" align="right">
				<span>
					 <input type="text" class="calenderInput" id="startDate" autocomplete="off" style="color: transparent; text-shadow: 0 0 0 rgba(2,2,2, 0.7);">
					 <span style=" color: rgb(2,2,2); margin-left: 2px; margin-top: 5px;">~</span>
					 <input type="text" class="calenderInput" id="endDate" autocomplete="off" style="margin-left: 2px; color: transparent; text-shadow: 0 0 0 rgba(2,2,2, 0.7)" >								
					 <button type="submit" id="searchDate" style="margin-left: 7px;">??????</button>
				</span>
			</div>
		</div>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/register"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/pictureReceipt.jpg">???????????? ?????? ??????</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#" style="padding-bottom: 10px";><i style="color:#27b2a5;" class="fas fa-check-circle"></i><sapn style="margin-left: 5px;">?????? ?????? ??????</sapn></a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList"><i style="color:#27b2a5" class="fas fa-pause-circle"></i><span style="margin-left: 5px;">?????? ?????? ??????</span></a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/rejectReceiptList"><i style="color:#27b2a5" class="fas fa-times-circle"></i><span style="margin-left:5px;">?????? ??????</span></a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/receipt/homeTaxConnect"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/autoCollect.png">?????? ???????????? ??????</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/allReceiptList"><i style="color:#27b2a5" class="fas fa-dot-circle"></i><span style="margin-left:5px;">?????? ??????/?????? ??????</span></a></li>
			</ul>
			
			<section>
					<div class="container" style="margin-left: 36px;"> 
							 <section id="categoryAjax">
								<div class="row">
									<div class="col-2">
										<select name="receiptKind" id="receiptKind" style="width: 150px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; ">
											<option value="">????????? ??????</option>
											<option value="1">???????????????</option>
											<option value="2">?????????</option>
											<option value="3">???????????????</option>
											<option value="4">???????????????</option>
										</select>
									</div>
									<div class="col-2">
										<select name="overlap" id="overlap" style="width: 150px; margin-bottom: 20px; color: #495057; height: 35px; border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; " >
											<option value="">????????????</option>
											<option value="1">????????????</option>
											<option value="2">????????????</option>
										</select>
									</div>
									<div class="col" style="width: 200px">
										<div>
											<input type="search" placeholder="????????? ??????" name="searchWord" id="searchWord" value="" style="float: left; width: 150px; ">
											<span style="float: left">
											<!-- <button id="searchBtn" type="button" onclick="getSearchList()">??????</button> -->
											<button id="searchBtn" name="searchBtn" type="button">??????</button>
											</span>
										</div>
										
										
										
									</div>
									<div class="col" align="right">
										<span style="float: right;">
											 <button id="excelBtn" style="height : 35px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;border-top-right-radius: 5px;border-bottom-right-radius: 5px; font-size: 16px;"><i class="fas fa-file-excel"></i><span style="margin-left:5px;">Excel ????????????</span></button>
										</span>	
									</div>
									
									
									
								</div>
							</section>
							
						
						<div class="table-scroll-wrapper" style="overflow:auto; overflow-y:hidden;">

						<div class="row" style="width: 1500px">
							<div class="col" style="margin-bottom: 50px;">
							<table class="styled-table">
								<thead>
								<tr id="boardtable">
									<th><input type="checkbox" class="testBox" id="allCheck" value="1"></th>
									<th width="140px">????????????</th>
									<th width="130px">??????</th>
									<th width="180px">?????????</th>
									<th width="130px">????????????</th>
									<th width="110px">????????????</th>
									<th width="130px">????????????</th>
									<th width="600px">??????</th>
								</tr>
								</thead>
								<tbody id="test">
								 
								</tbody>
							</table>
							</div>
						</div>
						</div> <!--????????? ??????  -->
						
						<div class="row">
							<div class="col" style="margin-top: 25px;">
								<select name="perReceipt" id="perReceipt" style="width: 110px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px;">
									<option value="15">15??? ??????</option>
									<option value="30">30??? ??????</option>
									<option value="50">50??? ??????</option>
									<option value="100">100??? ??????</option>
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