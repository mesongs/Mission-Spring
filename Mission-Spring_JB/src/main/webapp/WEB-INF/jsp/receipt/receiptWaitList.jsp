<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

<style>
.nav-tabs .nav-link.active {
    color: #007BFF;
}

.product-img3{
 	max-width: 30px;
    max-height: 30px;
 	margin-top: -5px;
    margin-right: 0px;
 }

</style>
  <!--datePicker-->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	
	
	 $(document).ready(function(){
		
		// 페이지 호출 하자마자 전체 목록 보여줘야함
		waitList();
		
			function waitList(){
				
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/receipt/waitAllList",
					success : function(result){
						
						let obj = JSON.parse(result);
						
				 		 $('#test').empty();
				 		 
						 if(obj.length >= 1){
							 
							 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
							 obj.forEach(function(waitAllList){
								 	 
								 	 str="<tr>"
								 	 str += "<td>" + "<input type='checkbox'>" + "</td>" 
								     str +="<td>" + waitAllList.regDate + "</td>"
								     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + waitAllList.receiptNo + ">" + waitAllList.receiptName +"</a></td>"; 
								     str +="<td>" + waitAllList.purpose +"</td>";
				 					 str +="<td>" + waitAllList.memo +"</td>";
				 					 str +="</tr>"
				 					 $('#test').append(str);
							 })
						 }
						
					},
					error:function(request, status, error){
					    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					
					
				})
				
			}
			
			
		
		 
		 
		$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[type=checkbox]").prop('checked',true)
				
			}else{
				
				$("input[type=checkbox]").prop('checked',false)
				
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

	function getSearchList(){
		 
		$.ajax({
			 type : "POST",
			 url : "${ pageContext.request.contextPath }/receipt/waitListSearch",
			 data : {
					"searchWord" : $('#searchWord').val() 
			 	},
			 success : function(result){
				 let obj = JSON.parse(result);
		 		 /* $('#boardtable > tbody').empty(); */
		 		 $('#test').empty();
		 		 
				 if(obj.length >= 1){
					 
					 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
					 obj.forEach(function(searchWaitList){
						 	 
						 	 str="<tr>"
						 	 str += "<td>" + "<input type='checkbox'>" + "</td>" 
						     str +="<td>" + searchWaitList.regDate + "</td>"
						     //str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchWaitList.receiptNo + ">" + searchWaitList.receiptName +"</a></td>"; 
						     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + searchWaitList.receiptNo + ">" + searchWaitList.receiptName +"</a></td>"; 
						     
						     str +="<td>" + searchWaitList.purpose +"</td>";
		 					 str +="<td>" + searchWaitList.memo +"</td>";
		 					 str +="</tr>"
		 					 //$('#boardtable').parent().append(str);
		 					 $('#test').append(str); 
		 					
		 					 /* str+="<td><a href = '/board/detail?idx=" + item.idx + "'>" + item.title + "</a></td>"; */
		 					 
					 })
				 }
				 
				 
			 }	 
			 
		 })
		 
	 }
	 
		
	
</script>




</head>


<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->


	<div class="comment-form-receipt" id="comment-custom-receipt">
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large;">증빙관리</h4>
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
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#" style="padding-bottom: 10px";>처리 대기 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/rejectReceiptList">반려 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:doHomeTaxConnect()"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/autoCollect.png">증빙자료 수집/조회</a></li>
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
									
									<div class="col" style="width: 200px">
										<div>
											<form name="search-form" autocomplete="off">
												<input type="search" placeholder="검색어 입력" name="searchWord" id="searchWord" value="" style="float: left; width: 150px; ">
												<span style="float: left">
												<button id="searchBtn" type="button" onclick="getSearchList()">검색</button>
												</span>
											</form>
										</div>
										
									</div>
									
									<div class="col-2" align="right" style="margin-left: 109px;">
											<button id="delete" type="submit" style="border-radius: 5px 5px 5px 5px">영수증 삭제</button>
									</div>
									 
								</div>
							</section>
							
							
						
						<div class="table-scroll-wrapper" style="overflow:auto; overflow-y:hidden">

						<div class="row" style="width: 1000px">
							<div class="col" style="margin-bottom: 50px;">
							<table>
								<tr>
									<th><input type="checkbox" id="allCheck" value="1"></th>
									<th width="100px">등록일</th>
									<th width="150px">구분</th>
									<th width="150px">사용목적</th>
									<th width="600px">메모</th>
								</tr>
								
								<tbody id="test">
								 	
									<%-- <tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">세금계산서</a></td>
										<td>재료비</td>
										<td>재료 구매를 위한 지출</td>
									</tr> --%>
									
								</tbody>	
									
							</table>
							</div>
						</div>
						</div> <!--스크롤 랩퍼  -->
						
						<div class="row">
							<div class="col" style="margin-top: 25px;">
								<select name="perReceipt" id="perReceipt" style="width: 110px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px;">
									<option value="1">10개 보기</option>
									<option value="2">25개 보기</option>
									<option value="3">50개 보기</option>
									<option value="4">100개 보기</option>
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