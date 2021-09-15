<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?after">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>
  
<style>

	.product-img4{
 	max-width: 20px;
    max-height: 20px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 0px;
 }


</style>

<script>

	$(document).ready(function(){
	
		// 체크박스 로딩된 뒤 실행되야함 (ready(function()) 안에)
		$('#agreeAllCheck').click(function(){
			
			if($('#agreeAllCheck').prop('checked')){
				
				$("input[type=checkbox]").prop('checked',true)
				
			}else{
				
				$("input[type=checkbox]").prop('checked',false)
				
			}
			
		})
		
		
		
		
	})
	

	function doCheck(){
			
			// 모든 체크박스를 체크하지 않았다면, 실행되지 않게함
			// 공유영역에 저장된 vo로 태그에 id를 부여했으니까
			let information = $('#information')[0]
			let personal = $('#personal')[0]
			let service = $('#service')[0]
			let transaction = $('#transaction')[0]
			
			if( !information.checked || !personal.checked || !service.checked || !transaction.checked){
				
				$('#myModal').modal('show');
        		$('#alert-modal-body-msg').html('이용약관에 동의하지 않으시면 서비스를 이용하실 수 없습니다. <br/> 이용약관에 동의해주세요. ')
				
			}else{
				// 간편 비밀번호 설정창으로 이동하기
				location.href = '${ pageContext.request.contextPath }/account/easyPassword';
				
			}
			
		}

	
	
	
	
	

</script>



</head>


<body>
	
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->

	<div class="comment-form-receipt" id="comment-custom-receipt" >
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large;">이용약관 동의</h4>
			</div>
			
		</div>
		<div class="container">
			
			
			<div class="row gtr-uniform" style="margin: auto;">
						<c:forEach items="${ policyList }" var="policy">
							
							<div class="col-12">
								<h4 style="font-family: 'Noto Sans KR', sans-serif;">${ policy.title }</h4>
								<!-- 사용자가 textarea 태그 박스크기, 사이즈를 임의로 수정을 못하게함 resize : none -->
								<textarea rows="10" readonly="readonly" style="resize: none; width: 100%;">
									${ policy.content }
       							</textarea>
							</div>
							<div class="col-12" style="text-align: right">
								<input type="checkbox" id="${ policy.name }" name="${ policy.name }" required> <label for="${ policy.name }">(필수) 동의합니다.</label>
							</div>
						</c:forEach>
						
						<div class="col-12" style="text-align: right;">
							<div>
								<input type="checkbox" id="agreeAllCheck" name="agreeAllCheck"> <label for="agreeAllCheck">전체 동의</label>
							</div>
							<a href="javascript:doCheck()" class="btn btn-default" style="background-color: #27b2a5; color: #fff; font-size: 20px;">동의</a>
						</div>

			</div>
		</div>

	</div>
	
	<!-- Modal -->
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>