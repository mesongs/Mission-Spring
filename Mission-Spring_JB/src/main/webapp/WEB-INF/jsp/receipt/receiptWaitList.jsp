<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>


<script>
	
	
	 $(document).ready(function(){
		
		$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[type=checkbox]").prop('checked',true)
				
			}else{
				
				$("input[type=checkbox]").prop('checked',false)
				
			}
			
		})
		
	 })
	 
		// 영수증 삭제 버튼을 누르면, 체크한 것만 삭제, 아무것도 체크 되어있지 않으면, 영수증을 선택해주세요. modal 출력
		// 굳이 replace하지 않고 처리
		<%-- $("input[type=checkbox]").change(function(){
			
			   if($("input[type=checkbox]").is(":checked")){
				   
				   $.get("<%=request.getContextPath()%>/replaceCheck.jsp", function(data){
					   $('#categoryAjax').replaceWith(data)
					   
				   })
				   
			   }else{
				   
				   $.get("<%=request.getContextPath()%>/replaceUnCheck.jsp", function(data){
					   $('#categoryAjax').replaceWith(data)
					   
				   })
				   
				   
			   }
			
		}) --%>
	
	

	
	

</script>



</head>


<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->


	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>증빙관리</h4>
		
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/register">영수증 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">영수증 목록</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">처리 대기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">반려된 영수증</a></li>
				
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
											<input type="search" placeholder="검색어 입력" name="searchWord" id="searchWord" value="" style="float: left; width: 150px; ">
											<span style="float: left">
											<button id="searchBtn" type="submit">검색</button>
											</span>
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
								
								 
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">세금계산서</a></td>
										<td>재료비</td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">세금계산서</a></td>
										<td>재료비</td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">세금계산서</a></td>
										<td>재료비</td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									
									
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