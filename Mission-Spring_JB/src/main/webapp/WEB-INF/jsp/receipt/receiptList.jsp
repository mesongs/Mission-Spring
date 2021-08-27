<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
 
</style> -->

<script>

	$(document).ready(function(){
		
		$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[type=checkbox]").prop('checked',true)
				
			}else{
				
				$("input[type=checkbox]").prop('checked',false)
				
			}
			
		})
		
		
		// 체크 상태 변화될 때마다 수정사항 표시
		$("input[type=checkbox]").change(function(){
			
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

	<div class="comment-form-receipt" id="comment-custom-receipt" >
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
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/register">영수증 등록</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">영수증 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList">처리 대기</a></li>
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
									<div class="col-2">
										<select name="receiptKind" id="receiptKind" style="width: 150px; margin-bottom: 20px; color: #495057; height: 35px; border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; " >
											<option value="">중복여부</option>
											<option value="1">중복의심</option>
											<option value="2">중복아님</option>
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
									<div class="col" align="right">
											  	<button type="submit" id="excelBtn" style="padding-left: 0px;"><img class="product-img" src="${ pageContext.request.contextPath }/resources/img/excel.png">Excel 다운로드</button>
									</div>
								</div>
							</section>
							
						
						<div class="table-scroll-wrapper" style="overflow:auto; overflow-y:hidden">

						<div class="row" style="width: 1500px">
							<div class="col" style="margin-bottom: 50px;">
							<table>
								<tr>
									<th><input type="checkbox" id="allCheck" value="1"></th>
									<th width="100px">사용일시</th>
									<th width="150px">구분</th>
									<th width="200px">업체명</th>
									<th width="200px">사용금액</th>
									<th width="150px">사용목적</th>
									<th width="150px">중복여부</th>
									<th width="600px">메모</th>
								</tr>
								
								 
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
										<td>재료 구매를 위한 지출</td>
									</tr>
									<tr> <!--회원이 보유한 영수증 리스트 출력  -->
										<td><input type="checkbox"></td>
										<td>07/08</td>
										<td>세금계산서</td>
										<td><a href="<%=request.getContextPath()%>/receiptDetail.jsp">종범상회</a></td>
										<td>500,000</td>
										<td>재료비</td>
										<td></td>
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
	
	<!-- 여기다 만들어놓고, display = none, -->
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>