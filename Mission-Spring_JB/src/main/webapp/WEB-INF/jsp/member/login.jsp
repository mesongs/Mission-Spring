<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?before">

<head>
	<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>
	
<!--카카오톡 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>

	$(document).ready(function(){
		
		if('${ msg }')
			$('#myModal').modal('show');
			$('#alert-modal-body-msg').text('${ msg }');
	})
	
</script>

<script>

window.Kakao.init("bbe9ec6b57b56d8ef60c464ef2214a90");
	
	function kakaoLogin() {
		//문서에 보면 다나와있음
		//로그인 버튼 누르면 실행됨
		window.Kakao.Auth.login({
			
			scope : 'account_email',
			
			//authObj 받아온 오브젝트 데이터, access 토큰 값 들어있음
			success: function(authObj){
				//console.log(authObj)
				
				//로그인된 상태에서 유저정보들 받아오기
				window.Kakao.API.request({
					//로그인한 사용자의 정보를 받아옴
					url:'/v2/user/me',
					success : res => {
						
						const kakao_account = res.kakao_account
						console.log(kakao_account); // 변수에 해당하는 값 출력
						console.log(res.id) // 사용자 구분 id
						location.href ="${ pageContext.request.contextPath }/member/kakaoLoginProcess/"+ res.id ;
					}
					
				});
				
				
			}
		});
		
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
	                    <form method="post">
	                    	<div class="form-group form-inline">
		                    	<div class="form-group col-lg-6 col-md-6 name">
		                          <input type="text" class="form-control" name="id" id="id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" style="background-color: rgba(130,139,178,0.25);">
		                        </div>
	                        </div>
	                        <div class="form-group col-lg-6 col-md-6 name" style="margin-bottom: 25px;">
		                          <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" style="background-color: rgba(130,139,178,0.25)">
		                    </div>
		                    <div class="container" style="padding-right: 0px;padding-left: 0px;">
		                       <!--  <a href="javascript:doLogin()" class="button submit_btn" id="loginBtn" style="float: left">로그인</a> -->
		                        <input type="submit" class="button submit_btn" id="loginBtn" style="float: left" value="로그인">
		                        <a href="javascript:kakaoLogin();"><img src="${ pageContext.request.contextPath }/resources/img/kakaoLogin.png" id="kakaoBtn" style="margin-left: 15px;"></a>
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