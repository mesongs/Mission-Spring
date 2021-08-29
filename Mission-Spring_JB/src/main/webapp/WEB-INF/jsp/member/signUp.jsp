<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<head>
	<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	

</style>


<script>
	// 참고사이트 : https://postcode.map.daum.net/guide
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /* if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

                var guideTextBox = document.getElementById("guide");
                
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</head>




<body>
  <!--================Header Menu Area =================-->
  	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
  <!--================Header Menu Area =================-->
  
  
  <!--================ Start Blog Post Area =================-->
                
                <div class="container" align="center">
                <div class="comment-form" id="comment-custom" style="margin-left: 250px;">
                    <h4>회원가입</h4>
                    <form>
                    	<div class="form-group form-inline" style="margin-bottom: 0px;">
	                    	<div class="form-group col-lg-6 col-md-6 name">
	                          <input type="text" class="form-control" name="id" id="id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
	                        </div>
	                        <div class="form-group col-lg-6 col-md-6 name" style="margin-top: 21px;">
	                            <a href="#" class="check" id="idCheck" style="margin-bottom:18px">중복확인</a>
	                        </div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 name">
	                          <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
	                    </div>
	                    <div class="form-group col-lg-6 col-md-6 name">
	                          <input type="text" class="form-control" name="name" id="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
	                    </div>
	                    <div class="form-group form-inline">
	                    	<div class="form-group col-lg-6 col-md-6 name">
	                          <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'">
	                        </div>
	                        <div class="form-group col-lg-6 col-md-6 name">
	                            <a class="check" href="#" id="smsCheck">문자인증</a>
	                        </div>
                        </div>
	                    <div class="form-group form-inline">
	                    	<div class="form-group col-lg-6 col-md-6 name">
	                          <span>
		                          <input type="text" class="form-control" name="email" id="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'" style="float: left; width: 50%" >
		                       	  <select name="myEmailDomain" id="" style="width: 50%">
									<option value="0">@naver.com</option>
									<option value="1">@daum.net</option>
									<option value="2">@google.com</option>
									<option value="3">@yahoo.co.kr</option>
								  </select>
	                          </span>
	                        </div>
	                        <div class="form-group col-lg-6 col-md-6 name">
	                            <a class="check email" href="#" id="emailCheck">이메일 인증</a>
	                        </div>
                        </div>
                        <div class="form-group form-inline">
		                    <div class="form-group col-lg-6 col-md-6 name">
		                        <input type="date" class="form-control" name="rrnf" id="rrnf" maxlength="16" placeholder="생년월일" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일'">
		                    </div>
		                    <div class="form-group col-lg-6 col-md-6 name">
                            	<input type="password" class="form-control" name="rrnb" id="rrnb" maxlength="7" placeholder="주민등록번호 뒷자리" onfocus="this.placeholder = ''" onblur="this.placeholder = '주민등록번호 뒷자리'">
                          	</div>
	                    </div>

                        <div class="form-group form-inline">
	                    	<div class="form-group col-lg-6 col-md-6 name">
	                          <span>
		                          <input type="text" class="form-control" name="taxAgentEmail" id="taxAgentemail" placeholder="세무대리인 이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '세무대리인 이메일'" style="float: left; width: 50%" >
		                       	  <select name="taxAgentEmailDomain" id="" style="width: 50%">
									<option value="0">@naver.com</option>
									<option value="1">@daum.net</option>
									<option value="2">@google.com</option>
									<option value="3">@yahoo.co.kr</option>
								</select>
	                          </span>
	                        </div>
                        </div>
                        
                        <div class="form-group col-lg-6 col-md-6 name">
	                          <input type="text" class="form-control" name="businessNo" id="businessNo" maxlength="10" placeholder="사업자번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업자번호'">
	                    </div>
	                    
	                    <div class="form-group form-inline">
	                    	<div class="form-group col-lg-6 col-md-6 name">
	                          <input type="text" class="form-control" name="zipcode" id="sample4_postcode" placeholder="사업장 우편번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업장 우편번호'">
	                        </div>
	                        <div class="form-group col-lg-6 col-md-6 name">
	                            <a href="javascript:sample4_execDaumPostcode();" class="search zipcode" id="zipcode ">우편번호 찾기</a>
	                        </div> 
                        </div>
                        
                        
                        
                        
                        <div class="form-group form-inline">
		                    <div class="form-group col-lg-6 col-md-6 name">
		                        <input type="text" class="form-control" name="addrRoad" id="sample4_roadAddress" placeholder="사업장 도로명주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업장 도로명주소'">
		                    </div>
		                    <div class="form-group col-lg-6 col-md-6 name">
                            	<input type="text" class="form-control" name="addrJibun" id="sample4_jibunAddress" placeholder="사업장 지번주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업장 지번주소'">
                          		<span id="guide" style="color:#999;display:none"></span>
                          	</div>
	                    </div>
	                    <div class="form-group col-lg-6 col-md-6 name">
	                          <input type="text" class="form-control" name="addrDetail" id="sample4_detailAddress" placeholder="사업장 상세주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업장 상세주소'">
	                    </div>
	                         <a href="#" class="button submit_btn" id="signUpBtn" style="margin-right: 280px; margin-top: 20px;">회원가입</a>	
                    </form>
                </div>
                </div>
  

      
  <!--================ End Blog Post Area =================-->

  <!--================ Start Footer Area =================-->
  	  <jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
  <!--================ End Footer Area =================-->

 
</body>
</html>