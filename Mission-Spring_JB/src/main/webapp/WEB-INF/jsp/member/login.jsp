<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?before">

<head>
	<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>


	
<script>
	
	function doLogin(){
		// datepicker 사용하려고, head.jsp에 script들고왔는데 그 이후부터 여기 모달작동안함(script지우면 되긴함)
		$('#myModal').modal('show');
		$('#alert-modal-body-msg').text('로그인 버튼 누르면 모달')
	}
	
</script>



	
</head>

<body>
  <!--================Header Menu Area =================-->
  	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
  <!--================Header Menu Area =================-->
  
  <div id="modal-alert-section"></div>
  

  <!--================ Start Blog Post Area =================-->
                
               
               <div class="container" align="center">
                <div class="comment-form" id="comment-custom-login" style="margin-top: 50px; margin-left: 336px;">
                    <h4 style= "margin-bottom: 40px;">로그인</h4>
	                    <form>
	                    	<div class="form-group form-inline">
		                    	<div class="form-group col-lg-6 col-md-6 name">
		                          <input type="text" class="form-control" name="id" id="id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" style="background-color: rgba(130,139,178,0.25); ">
		                        </div>
	                        </div>
	                        <div class="form-group col-lg-6 col-md-6 name" style="margin-bottom: 25px;">
		                          <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" style="background-color: rgba(130,139,178,0.25)">
		                    </div>
		                    <div class="container" style="padding-right: 0px;padding-left: 0px;">
		                        <a href="javascript:doLogin()" class="button submit_btn" id="loginBtn" style="float: left">로그인</a>
		                        <a href="#"><img src="resources/img/kakaoLogin.png" id="kakaoBtn" style="margin-left: 15px;"></a>
	                    	</div>
	                    </form>
                </div>
               </div>
				
				<!-- login Modal -->
				<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
				
  <!--================ End Blog Post Area =================-->
	  
	  
  <!--================ Start Footer Area =================-->
  	  <jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
  <!--================ End Footer Area =================-->

 
</body>
</html>