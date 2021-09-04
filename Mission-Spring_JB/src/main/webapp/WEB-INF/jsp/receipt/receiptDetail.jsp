<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?before">

<head>

<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>



<style>
#comment-custom-receipt {
	/* max-width: 700px; */
	width: 1000px;
    margin : auto; 
	font-family: 'Noto Sans KR', sans-serif;
    margin-top: 70px;
	
}

#comment-custom-receipt > h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: xx-large;
}

.container {
	margin-top: 30px;
}

#receiptSaveBtn {
	width : 180px;
	padding-right: 25px;
	padding-left: 25px;
	padding-top: 3px;
	padding-bottom: 3px;
	border: 0px;
    margin-right: 20px;
	font-size: x-large;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	-ms-border-radius: 30px;
	border-radius: 30px;
	color: #fff;
	background-color: #27b2a5;
}

#receiptDelBtn{
	
	width : 180px;
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
	color: #999999;
	background-color: rgba(134, 139, 178, 0.25);

}

#receiptDelBtn:hover{
	background-color :rgba(134, 139, 178, 0.70);
	color: rgb(2,2,2);
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

input[type=text] { 
 text-transform :none !important;
 background-color: rgba(130,139,178,0.25) !important;
 margin-bottom: 20px;
 padding-left: 4px;
 color : #999999 !important;
}


 .col.fileUpload {
	border: 4px dashed #999999;
	/* width: 610px; */
	width: 410px;
	height: 430px;
	color: #999999;
	margin-top: 26px;
	text-align: center;
	vertical-align: middle;
	display: table-cell;
	background-color: rgba(130, 139, 178, 0.25);
	text-align: center;
}

</style>


<script>

	// active 클래스 추가 제거, 탭 이동했을 때 사용했었음
	/* $(function(){
		 
		 var subMenu = $(".container > ul > li"); // container 클래스 아래의 ul li태그
		 
		 // subMenu아래의 a태그를 클릭하면 호출되는 함수
		 subMenu.find("a").click(function() {   
	     
			 // 우선 a태그에 걸려있는 active 클래스 삭제 
			 $("a").removeClass("active");  
			 // 내가 선택한 태그에 a태그에 active 클래스 추가
			 $(this).addClass("active");
			 
	  })
	}) */
	
	/* function doNext(){
		
		// 확인누르면 모달창 실행, 상세내역 창에는 일단 필요없음 (영수증 최종 등록할 때 필요하겠네)
		// 사용자가 영수증을 등록할 때 필요함
		var receiptKind =''
		var html =''
		
		switch($('#receiptKind').val()){
			case '1' : 
				receiptKind = '세금계산서'
				break;
			case '2' : 
				receiptKind = '계산서'
				break;
			case '3' : 
				receiptKind = '카드영수증'
				break;
			case '4' : 
				receiptKind = '간이영수증'
				break;
		}
		
		html += '입력하신 정보가 올바른지 확인해주세요.<br/>' 
		html += '증빙구분 : ' + receiptKind + '<br/>'
		html += '업체명 : ' + $('#storeName').val() + '<br/>'
		html += '사업자등록번호 : ' +$('#businessNo').val() + '<br/>'
		html += '영수일시 : ' + $('#receiptDate').val() + '<br/>'
		html += '영수금액 : ' + $('#receiptAmount').val() 
		
		$('#confirm-modal-body-msg').html(html)
		$('#myModal').modal('show') 
		
		// 
	} */
	
</script>

</head>

<script>

$(function(){
	
	$("#receiptKind").val('${receipt.receiptCode}').prop("selected", true)
	//$("#purpose").val(${receiptFile.selectedPurposeNo}).prop("selected", true)
	
	let purposeNo = '';
	
	switch('${receipt.purpose}') {
	
				  case '재료비':
					  purposeNo = '1'
					  break
			
				  case '자재비':
					  purposeNo = '2'
				      break								
				
				  case '식비':
					  purposeNo = '3'
				      break
				    
				  case '접대비':
					  purposeNo = '4'   
					  break 
					
				  case '세금':
					  purposeNo = '5'   
				   	  break
				   	  
				  case '인건비':
					  purposeNo = '6'   
				   	  break
				   
				  case '공과금':
					  purposeNo = '7'   
					  break
					   	
				  case '기타':
					  purposeNo = '8'   
					  break
				}
	
		$("#purpose").val(purposeNo).prop("selected", true)

	// js에서 숫자는 바로 인식가능, 문자열은 ''표시해야 문자열로 인식함, 숫자로 인식하려다 에러 생긴 것
	$("#memo").val('${receipt.memo}')
	
})

</script>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>상세내역</h4>
		
		<div class="container">
			

			<section>
				<form>
					
					<div class="container"> 
						
						<div class="row box">
	
							<div class="col fileUpload" style="background-color: rgba(130, 139, 178, 0.25); height: 926px; top: 25px; bottom: 0px;margin-top: 0px; padding-right: 0px; padding-left: 0px;  ">
								<%-- <img src="${ receipt.filePath }" style="width: 300px;"> --%>
								<!-- filePath = C:\Lecture\spring-workspace\newUpload\kopo-92782264-3bb0-451d-9fa9-c7b9787cc86f.JPG -->
								
								<img src="/testUpload/${ receipt.fileSaveName }" style="max-width:100%; height: 100%">
								
								<!-- 아래가 실제 서버 경로( fileSaveName select)  -->
								<%-- <img src="${ pageContext.request.contextPath }/upload/${ receipt.fileSaveName }" style="width: 400px; height: 100%;"> --%>
							</div>
	
							<div class="col">
								<span>증빙 구분</span>
								<!--넘어온 값에 따라 동적으로 selected https://dorongdogfoot.tistory.com/136  -->
								<select name="receiptKind" id="receiptKind" required style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;" required>
									<option value="">영수증 구분</option>
									<option value="001">세금계산서</option>
									<option value="002">계산서</option>
									<option value="003">카드영수증</option>
									<option value="004">간이영수증</option>
								</select>
								
								<span>업체명</span>
	                          	<input type="text" class="form-control" name="storeName" id="storeName" placeholder="업체명" onfocus="this.placeholder = ''" onblur="this.placeholder = '업체명'" value="${ receipt.storeName }">
	                        	
	                        	<span>사업자등록번호</span>
	                          	<input type="text" class="form-control" name="businessNo" id="businessNo" placeholder="사업자등록번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업자번호'" value="${ receipt.supplierBusinessNo }">
	                        	
	                        	<span>영수일시</span>
	                          	<input type="text" class="form-control" name="receiptDate" id="receiptDate" placeholder="영수일시" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수일시'" value="${ receipt.receiptDate }">
								
								<span>영수금액</span>
	                          	<input type="text" class="form-control" name="receiptAmount" id="receiptAmount" placeholder="영수금액" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수금액'" value="${receipt.amount }원">
								
								<span>부가세</span>
	                          	<input type="text" class="form-control" name="receiptVat" id="receiptVat" placeholder="부가세" onfocus="this.placeholder = ''" onblur="this.placeholder = '부가세'" value="${receipt.vat }원">
								
								<span>중복 여부</span>
										<select name="overlap" id="overlap"  style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;">
											<c:choose>
												<c:when test="${ receipt.overlap eq 'N' }">
													<option value="1" selected>중복아님</option>
													<option value="2">중복의심</option>
												</c:when>
												<c:when test="${receipt.overlap eq 'Y'}">
													<option value="1" selected>중복아님</option>
													<option value="2" selected>중복의심</option>
												</c:when>
											</c:choose>
										</select>
								<span>사용 목적</span>
								<select name="purpose" id="purpose"  style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;" required>
									<option value="">사용목적을 선택하시거나 입력하세요.</option>
									<option value="1">재료비</option>
									<option value="2">자재비</option>
									<option value="3">식비</option>
									<option value="4">접대비</option>
									<option value="5">세금</option>
									<option value="6">인건비</option>
									<option value="7">공과금</option>
									<option value="8">기타</option>
								</select>
								
								
								
								<div class="form-group">
									<span>메모</span>
									<textarea class="form-control mb-10" name="memo" id="memo"rows="10" placeholder="기록하실 내용을 입력하세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '기록하실 내용을 입력하세요.'" style="padding-left: 4px; color: #999999; margin-bottom: 20px;" ></textarea>
								</div>
								<div class="col" align="center">
									<a href="javascript:doNext()" class="button submit_btn" id="receiptSaveBtn">저장</a>
									<a href="#" class="button submit_btn" id="receiptDelBtn">삭제</a>
								</div>
	
							</div>
	
	
						</div>
	
						<div class="row" style="margin-top: 20px">
							<div class="col"></div>
							
							<div class="col"></div>
						</div>
					</div>
				</form>
			</section>
		</div>

	</div>
	
	<!-- confirmModal -->
	<div class="modal fade" id="myModal" role="dialog" style="text-align: center;">
				
					<div class="modal-dialog">
						<div class="modal-content">
						
							<div class="modal-header">
								<h5 class="modal-title" style="font-family:'Noto Sans KR', sans-serif; ">알림</h5>
								<button type="button" class="close" data-dismiss="modal" style="padding-top: 5px;margin-top: 0px;">×</button>
							</div>
							<div class="modal-body" id="modal-body">
								<p id="confirm-modal-body-msg" style="margin-bottom: 0px"></p>
							</div>
							<div class="modal-footer">
								<a href="#" class="btn btn-default" style="background-color: #27b2a5; color: #fff">확인</a>
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>  
				</div>


	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>