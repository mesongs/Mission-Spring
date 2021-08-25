<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<head>
	<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--datePicker-->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<style>
	.calenderInput{
		background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 9px 7px; 
		background-size:20px; 
		padding:4px 2px 5px 25px;
		max-width : 335px;
		width : 100%;
	 	/* background: rgba(130,139,178,0.11); */
    	border: none;
    	border-radius: 0px;
		color: #999999;
		padding-left: 35px;
		font-size: 16px;
		
	}
	
	.calenderInput::placeholder{
		
		font-size: 16px;
		padding-left: 0px;
		color : #999999;
	

	}
	
	.form-control.font{
	
		font-size: 16px;
	
	}
	
	.form-control.font::placeholder{
	
		font-size: 16px;
	}
	
	.form-control.text{
		font-size: 16px;
		background-color: rgba(130,139,178,0.25);
	}
	
	.form-control.text::placeholder{
		font-size: 16px;
		padding-left: 1px;
		
	}
	
	
	#counselCancelBtn{
		width : 100px;
		padding-right: 30px;
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
	
	option:disabled {
	
	
	 	background: rgb(130,139,178,0.7);
	 
}

	#counselRegister{

    width : 100px;
	padding-right: 30px;
	padding-left: 25px;
	padding-top: 3px;
	padding-bottom: 3px;
	border: 0px;
	font-size: x-large;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	-ms-border-radius: 30px;
	border-radius: 30px;
    background-color: #27b2a5;
    color : #ffffff;
}
	
	
	}


</style>


<script>
	
	$(function(){
		
		$('#counselDate').datepicker({
			
			minDate : 0,
			maxDate : +14,
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesMin : ['일','월','화','수','목','금','토'],
			monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat : 'yy-mm-dd',
			
			beforeShowDay: function(date){
				var day = date.getDay();
				return [(day != 0 && day != 6)];
			}

			
			
		});
	
	
})
</script>

</head>




<body>
  <!--================Header Menu Area =================-->
  	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
  <!--================Header Menu Area =================-->
  
  
  <!--================ Start Blog Post Area =================-->
              <div class="container" align="center" style="margin-left: 85px";>
                <div class="comment-form" id="comment-custom" style="margin-top: 15px;">
                    <h4 style="margin-bottom: 30px;">상담신청</h4>
                    <form>
                    	 
	                   	 <div class="form-group col-lg-6 col-md-6 name">
	                   	 	  <span>지점명</span>
	                          <input type="text" class="form-control font" name="id" id="id" placeholder="방문하실 지점" onfocus="this.placeholder = ''" onblur="this.placeholder = '지점을 입력해주세요.'">
	                     </div>
                        <div class="form-group col-lg-6 col-md-6 name">
                        	  <span>지점 위치</span>
	                          <input type="text" class="form-control font" name="password" id="password" placeholder="방문하실 지점 위치" onfocus="this.placeholder = ''" onblur="this.placeholder = '방문하실 지점 주소'">
	                    </div>
	                   	<div class="form-group col-lg-6 col-md-6 name">
	                   		  <span>상담 주제</span>
		                      <select name="counselSubject" id="" style="font-size: 16px;padding-left: 16px;">
								<option value="">상담 주제를 선택해주세요.</option>
								<option value="1">대출서비스</option>
								<option value="2">정책자금</option>
								<option value="3">창업지원</option>
								<option value="4">경영상담</option>
								<option value="5">재기교육</option>
								<option value="6">경영컨설팅</option>
								<option value="7">기타</option>
							  </select>
	                    </div>
	                    
	                    <span>예약일자</span>
	                    <div class="form-group col-lg-6 col-md-6 name">
	                         <input type="text" class="calenderInput" id="counselDate" placeholder="예약일자" style="color: transparent; text-shadow: 0 0 0 #999999;">
	                    </div>
	                    
	                    
	                    <div class="form-group col-lg-6 col-md-6 name">
	                   	 	  <span>예약 가능시간</span>
	                          <select name="possibleTime" id="" style="font-size: 16px;padding-left: 16px;">
								<option value="">상담 가능 시간을 선택해주세요.</option>
								<option value="9">09:00~10:00</option>
								<option value="10" disabled="disabled">10:00~11:00</option>
								<option value="11">11:00~12:00</option>
								<option value="13">13:00~14:00</option>
								<option value="14">14:00~15:00</option>
								<option value="15">15:00~16:00</option>
								<option value="16">16:00~17:00</option>
								<option value="17">17:00~18:00</option>
							  </select>
	                     </div>
	                     
	                     <div class="form-group col-lg-6 col-md-6 name">
	                   	 	  <span>기타 문의사항</span>
	                   	 	  <textarea class="form-control text" name="memo" id="memo"rows="10" placeholder="상세한 문의사항을 남겨주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '상세한 문의사항을 남겨주세요.'" ></textarea>
	                     </div>
	                    
	                    
	                  	 <div class="form-group col-lg-6 col-md-6 name" align="center">
	                         <a href="#" class="button submit_btn" id="counselCancelBtn" style="padding-right: 20px;margin-right: 45px;">취소</a>
	                         <a href="#" class="button submit_btn" id="counselRegister" style="margin-right: 10px;">신청</a>	
	                     </div>
                    </form>
                 </div>
               </div>
  

      
  <!--================ End Blog Post Area =================-->

  <!--================ Start Footer Area =================-->
  	  <jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
  <!--================ End Footer Area =================-->

 
</body>
</html>