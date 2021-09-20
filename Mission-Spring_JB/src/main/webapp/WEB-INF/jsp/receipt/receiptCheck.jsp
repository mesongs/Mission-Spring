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
	width : 1000px;
    margin : auto;
	font-family: 'Noto Sans KR', sans-serif;
    margin-top: 70px;
	
}

.dragAndDropDiv {
	border: 4px dashed #999999;
	/* width: 610px; */
	width: 410px;
	top: 25px;
	height: 900px;
	/* height: 430px; */
	color: #999999;
	margin-top: 26px;
	text-align: center;
	vertical-align: middle;
	/*  padding: 10px 0px 10px 10px; */
	font-size: 200%;
	display: table-cell;
	background-color: rgba(130, 139, 178, 0.25);
	text-align: center;
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

</style>

<script>
	
$(function(){
	
	$("#receiptKind").val(${receiptFile.selectedReceiptNo}).prop("selected", true)
	$("#purpose").val(${receiptFile.selectedPurposeNo}).prop("selected", true)
	
	// js에서 숫자는 바로 인식가능, 문자열은 ''표시해야 문자열로 인식함, 숫자로 인식하려다 에러 생긴 것
	console.log('${receiptFile.inputMemo}')
	$("#memo").val('${receiptFile.inputMemo}')
	
})

	function cancel(){
		
		location.href = '${ pageContext.request.contextPath }/receipt/register'
		
	}
	
	$(document).on("click", "#receiptSaveBtn", function (){
		
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
			html += '사업자등록번호 : ' +$('#supplierBusinessNo').val() + '<br/>'
			html += '영수일시 : ' + $('#receiptDate').val() + '<br/>'
			html += '영수금액 : ' + $('#amount').val()
			
			$('#confirm-modal-body-msg').html(html)
			$('#myModal').modal('show') 
			
			
		
	})
	
	
</script>
<script>
	// 모달창에서 확인 버튼 누르면, form에 action과 method 삽입
	function clickSubmit(formName) {
		formName.action = "${ pageContext.request.contextPath }/receipt/finalRegister";
		formName.method = "post";
		formName.submit();
	}
</script>
</head>


<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>영수증 등록</h4>
		<div class="container">
			<section>
				<%-- <form method="post" action="${ pageContext.request.contextPath }/receipt/finalRegister"> --%>
				<!-- 모달창 실행 후 form에 있는 내용을 submit -->
				<form name="checkInfo">
					<input type="hidden" name="filePath" value="${ receiptFile.filePath }">
					<input type="hidden" name="fileSize" value="${ receiptFile.fileSize }">
					<input type="hidden" name="fileOriginalName" value="${ receiptFile.fileOriginalName }">
                    <input type="hidden" name="fileSaveName" value="${ receiptFile.fileSaveName }">
                    <input type="hidden" name="businessNo" value="${ userVO.businessNo }">
                    
					<div class="container">
						<div class="row box">
							<div id="fileUpload" class="dragAndDropDiv" style="height: 599px;">
								<section id="replaceThumb" style="max-width: 100%; height: 100%;">
									<%-- <img src="/testUpload/${ receiptFile.fileSaveName }" style="width: 400px; height: 100%;"> --%>
									<%-- <img src="/var/lib/tomcat9/webapps/Mission-Spring_JB/upload/${ receiptFile.thumbnailFileName }" style="width: 400px; height: 100%;">--%>
									<!-- 아래가 실제 서버 경로  -->
									<img src="${ pageContext.request.contextPath }/upload/${ receiptFile.fileSaveName }" style="width: 400px; height: 590px;">
								</section>
							</div>
							<div class="col">
								<span>증빙 구분</span>
								<select name="receiptKind" id="receiptKind" required style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;" required>
									<option value="">등록하실 영수증을 선택하세요.</option>
									<option value="1">세금계산서</option>
									<option value="2">계산서</option>
									<option value="3">카드영수증</option>
									<option value="4">간이영수증</option>
								</select>
									
								<c:choose>
									<c:when test="${ receiptFile.selectedReceiptNo eq 3 }">	
										<span>업체명</span>
	                          			<input type="text" class="form-control" name="storeName" id="storeName" placeholder="업체명" onfocus="this.placeholder = ''" onblur="this.placeholder = '업체명'">								
										<span>사업자등록번호</span>
	                          			<input type="text" class="form-control" name="supplierBusinessNo" id="supplierBusinessNo" placeholder="사업자등록번호 ('-'를 제외하고 입력하세요.)" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업자번호 (\'-\'를 제외하고 입력하세요.)'" maxlength='10'>
										<span>영수일시 (ex 20210902)</span>
	                          			<input type="text" class="form-control" name="receiptDate" id="receiptDate" placeholder="영수일시" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수일시'">
									</c:when>
									<c:otherwise>
										<span>업체명</span>
	                          			<input type="text" class="form-control" name="storeName" id="storeName" placeholder="업체명" onfocus="this.placeholder = ''" onblur="this.placeholder = '업체명'" value="${ receiptFile.storeName }">
										<span>사업자등록번호</span>
	                          			<input type="text" class="form-control" name="supplierBusinessNo" id="supplierBusinessNo" placeholder="사업자등록번호 ('-'를 제외하고 입력하세요.)" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업자번호 (\'-\'를 제외하고 입력하세요.)'" maxlength='10' value="${ receiptFile.supplierBusinessNo }">
										<span>영수일시(ex 20210902)</span>
	                          			<input type="text" class="form-control" name="receiptDate" id="receiptDate" placeholder="영수일시" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수일시'" value="${ receiptFile.receiptDate }">
									</c:otherwise>
								</c:choose>
	                        	
								<span>영수금액</span>
	                          	<input type="text" class="form-control" name="amount" id="amount" placeholder="영수금액" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수금액'" value="${ receiptFile.amount }">
								
								<span>부가세</span>
	                          	<input type="text" class="form-control" name="vat" id="vat" placeholder="부가세" onfocus="this.placeholder = ''" onblur="this.placeholder = '부가세'" value="${ receiptFile.vat }">
								
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
									<textarea class="form-control mb-10" name="memo" id="memo" rows="10" placeholder="기록하실 내용을 입력하세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '기록하실 내용을 입력하세요.'" style="padding-left: 4px; color: #999999; margin-bottom: 20px;" ></textarea>
								</div>
								<div class="col" align="center">
									<!-- <a href="javascript:doNext()" class="button submit_btn" id="receiptSaveBtn">저장</a> -->
									<input type="button" class="button submit_btn" id="receiptSaveBtn" value="저장">
									<!-- <input type="button" class="button submit_btn" id="receiptDelBtn" value="취소"> -->
									<!-- <a href="javascript:doNext()" class="button submit_btn" id="receiptSaveBtn">저장</a> -->
									<a href="javascript:cancel()" class="button submit_btn" id="receiptDelBtn">취소</a>
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
								<button type="button" class="btn btn-default" onclick="clickSubmit(checkInfo)" style="background-color: #27b2a5; color: #fff">확인</button>
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