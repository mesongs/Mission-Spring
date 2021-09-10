<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?after">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>
  


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

// 인증완료한 경우에만 true 반환
let smsSuccess = false;
let checkEasyPassword = false;

	function doCheck(){
	
		if($('#name').val() ==''){
			
			$('#myModal').modal('show');
			$('#alert-modal-body-msg').html('이름을 입력하세요.')
			return false;
		}
		
		if($('#date').val() ==''){
			
			$('#myModal').modal('show');
			$('#alert-modal-body-msg').html('생년월일을 입력하세요.')
			return false;
		}
		
		if( !$('#personalAgree')[0].checked || !$('#unique')[0].checked ){
			
			$('#myModal').modal('show');
			$('#alert-modal-body-msg').html('이용약관에 동의하지 않으시면 서비스를 이용하실 수 없습니다. <br/> 이용약관에 동의해주세요. ')
			return false;
		}
		
		if(!smsSuccess){
			
			$('#myModal').modal('show');
    		$('#alert-modal-body-msg').html('SMS 인증을 진행해 주세요.')
    		return false;
		}
		
		if(!checkEasyPassword){
			
			$('#myModal').modal('show');
    		$('#alert-modal-body-msg').html('입력하신 비밀번호를 확인해 주세요.')
    		return false;
		}
		
		return true;
	}

</script>

<script>
	
	$(document).ready(function(){
		
		// 사용자가 입력한 번호와 생성한 인증번호가 동일한지 자바스크립트로 체크
		let authNo = ''

		$('#smsCheck').click(function(){
			 
			$('#sendSms').html('인증번호가 발송되었습니다.')
			
			$.ajax({
				
				url : "${ pageContext.request.contextPath }/account/smsAuth",
				data : { phoneNumber : $('#phoneNumber').val() },
				
				success : function(result){
					
					//ResponseBody로 넘겨주는 인증번호 
					//사용자가 올바르게 입력해야할 인증번호
					authNo = result.trim()
					
					$('#smsCheck').html('재전송')
					$('#smsCheck').attr('disabled',true)
					$('#smsCheck').css({'color' : 'black', 'background-color' : 'rgb(118, 118, 118)'})
					
				}, error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           }
				
			})
			
		})
		
		// key를 놓을 때마다 이벤트 발생
		$('#InputAuthNo').keyup(function(){
			
			//keyup을 했을 때, 인증번호를 받지 않은 경우 멘트 필요함
			//인증버튼을 누르지 않아, authNo에 값이 없는 경우
			if(authNo == ''){
				$('#authCheck').html('문자 인증을 진행해주세요.')
				//$('#authCheck').val('인증필요')
				
			}else if(authNo == $('#InputAuthNo').val()){
				
				$('#authCheck').html('인증완료')
				//$('#authCheck').val('인증완료')
				$('#authCheck').css({'color' : 'blue'})
				smsSuccess = true; //인증완료 했을 때만 true로, 나머지는 false로
				
			}else{
				$('#authCheck').html('인증 번호를 잘못 입력하셨습니다.')
				//$('#authCheck').val('인증실패')
				
			}
			
		})
		
		
		//easyPassword reEasyPassword easyPasswordChk
		$('#reEasyPassword').keyup(function(){
		
			if($('#easyPassword').val() != $('#reEasyPassword').val()){
				
				$('#easyPasswordChk').html('비밀번호가 일치하지 않습니다.');
				$('#easyPasswordChk').css({'color' : 'red'})
				
			}else{
				
				$('#easyPasswordChk').html('비밀번호 확인');
				$('#easyPasswordChk').css({'color' : 'blue'})
				checkEasyPassword = true;
				
			}	
			
	})
			
		
})
	
</script>


</head>


<body>
	
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->
	
	<div class="container" style="margin: auto; margin-top: 60px;">
	<div class="comment-form-receipt" id="comment-custom-receipt" style="margin-top: 0px; margin-top: 70px; margin-left: 0px; margin: auto;">
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large;">간편 비밀번호 설정</h4>
			</div>
			
		</div>
			<div class="container" align="center" style="margin-top: 0px;">
				<div class="comment-form" id="comment-custom-login"
					style="margin-top: 0px; margin-left: 0px; margin: auto;">

					<form onsubmit="return doCheck()">
						<span style="margin-left: 19px;">* <span
							style="color: rgb(2, 2, 2); font-weight: bold;"> 간편 비밀번호</span>
							등록을 위해 휴대폰 본인 인증을 진행해주세요.
						</span>
						<div class="container" style="margin: auto;">
							<div style="margin-top: 20px; margin-bottom: 25px;">
								<div class="form-group form-inline">
									<div class="form-group col-lg-6 col-md-6 name">
										<input type="text" class="form-control" name="name" id="name"
											placeholder="성명" onfocus="this.placeholder = ''"
											onblur="this.placeholder = '성명'">
									</div>
								</div>
								<div class="form-group form-inline">
									<div class="form-group col-lg-6 col-md-6 name">
										<!-- <input type="date" class="form-control" name="birth" id="birth" maxlength="16" placeholder="생년월일" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일'"> -->
										<input class="form-control" placeholder="생년월일" type="text"
											onfocus="(this.type = 'date')" id="date"
											style="color: transparent; text-shadow: 0 0 0 rgba(2, 2, 2, 0.7)">
									</div>
								</div>
							</div>

							<div class="row gtr-uniform" style="margin: auto;">
								<c:forEach items="${ policyList }" var="policy">

									<div class="col-8" style="padding-left: 0px;">
										<h4 style="font-family: 'Noto Sans KR', sans-serif; margin-bottom: 10px;">${ policy.title }</h4>
										<!-- 사용자가 textarea 태그 박스크기, 사이즈를 임의로 수정을 못하게함 resize : none -->
									
										<textarea rows="10" readonly="readonly" style="resize: none; width: 100%; text-align: left;">
											${ policy.content }
       									</textarea>
									</div>
									<div class="col-8" style="text-align: right">
										<input type="checkbox" id="${ policy.name }"
											name="${ policy.name }" required> <label
											for="${ policy.name }">(필수) 동의합니다.</label>
									</div>
								</c:forEach>



							</div>

							<div style="margin-top: 21px;">
								<div class="form-group form-inline">
									<div class="form-group col-lg-6 col-md-6 name">
										<input type="text" maxlength="11" class="form-control" name="phoneNumber" id="phoneNumber" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'">
										<span id=sendSms style="color: blue; font-size: 15px;"></span>
									</div>
									<div class="form-group col-lg-6 col-md-6 name">
										<a class="check" href="#" id="smsCheck">문자인증</a>

									</div>
								</div>
								<div class="form-group form-inline">
									<div class="form-group col-lg-6 col-md-6 name">
										<input type="text" class="form-control" name="InputAuthNo"
											id="InputAuthNo" placeholder="인증번호" autocomplete="off"
											onfocus="this.placeholder = ''" maxlength="6"
											onblur="this.placeholder = '인증번호'"> <span
											id=authCheck style="color: red; font-size: 15px;"></span>
									</div>
								</div>
								<div class="form-group form-inline">
									<div class="form-group col-lg-6 col-md-6 name">
										<input type="password" class="form-control"
											name="easyPassword" id="easyPassword"
											placeholder="간편 비밀번호 (6자리)" onfocus="this.placeholder = ''"
											onblur="this.placeholder = '간편 비밀번호 (6자리)'"
											style="background-color: rgba(130, 139, 178, 0.25);"
											maxlength="6">
									</div>
								</div>
								<div class="form-group col-lg-6 col-md-6 name"
									style="margin-bottom: 25px;">
									<input type="password" class="form-control"
										name="reEasyPassword" id="reEasyPassword"
										placeholder="간편 비밀번호 재입력" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '간편 비밀번호 재입력'"
										style="background-color: rgba(130, 139, 178, 0.25)"
										maxlength="6"> <span id=easyPasswordChk
										style="color: red; font-size: 15px;"></span>
								</div>
								<div align="center" class="container"
									style="padding-right: 0px; padding-left: 0px; max-width: 287px; padding-right: 0px; padding-left: 0px; max-width: 287px; margin-right: 324px; margin-top: -10px;">
									<a href="javascript:doCheck()" class="btn btn-default"
										style="background-color: #27b2a5; color: #fff; font-size: 20px; width: 70px;">등록</a>
								</div>
							</div>
						</div>
					</form>
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