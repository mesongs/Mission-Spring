<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- toastr css 라이브러리 -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


<style>

 #footer-area{
 	background-color: #27b2a5;
 	color: rgb(2,2,2);
 	margin-top: 100px;
 }
 
 div.single-footer-widget > h6{
 	color : rgb(2,2,2)
 }
 
 .footer-area.section-padding{
  padding-bottom: 20px;
  padding-top: 20px;
 }
 
 .footer-text {
    padding-top: 20px;
 }
 
</style>    



<script>


let ws;

function openSocket(){
	
    if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
        writeResponse("WebSocket is already opened.");
        return;
    }
    // 웹소켓 객체 만드는 코드
    ws=new WebSocket("ws://localhost:9999/Mission-Spring/echo");
    
    ws.onopen=function(event){
        if(event.data===undefined) return;
        
        console.log("onopen : " + event.data)
        //writeResponse(event.data);
    };
    // 메세지 받으면 실행되는 함수
    ws.onmessage=function(event){
       console.log("onmessage : " + event.data)
        writeResponse(event.data);
    };
    ws.onclose=function(event){
       console.log("onclose : " + event.data)
        //writeResponse("Connection closed");
    }
}

 function closeSocket(){
     ws.close();
     
 }
 
 // 클라이언트가 받은 메세지를 쓰는 부분
 function writeResponse(text){
	 
	 toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "newestOnTop": true,
			  "progressBar": false,
			  "positionClass": "toast-bottom-right",
			  "preventDuplicates": false,
			  "onclick" : function (){ location.href ="${ pageContext.request.contextPath }/receipt/rejectReceiptList" },
			  "showDuration": "600",
			  "hideDuration": "1000",
			  "timeOut": "10000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
	}
	 
	
	 
	 var findString = "승인";
	 
	 // 반려된거 클릭

	 if(text.indexOf(findString) != -1) {

		toastr["info"](text, "알림")
		 
	 	}else { // 반려된 경우
		 
		 toastr["warning"](text, "알림")
	 }

	 
	 
	
	 
	 
	 
 }
 
//send 메소드, 유저쪽에서는 send하는게 아니고 받기만 하니까
// function send(){
//        let text="웹소켓 테스트" + "," + 'admin';
//        ws.send(text);
//        text="";
//    }

 openSocket()
 
</script>

<footer class="footer-area section-padding" id="footer-area" style="margin-top: 120px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-3  col-md-6 col-sm-6">
          <div class="single-footer-widget">
            <h6 style="margin-bottom:15px;">About Us</h6>
            <p style="font-family: 'Noto Sans KR', sans-serif; color: rgba(2,2,2,0.7) ">
             하나WITH는,<br>
             <i class="far fa-laugh-squint"></i><span style="margin-left: 5px;">소상공인을 위한 통합 매입/매출 조회 서비스</span><br>
             <i class="far fa-laugh-squint"></i><span style="margin-left: 5px;">소상공인의 사업장 경영을 위한 사업보고서 서비스</span><br>
            <i class="far fa-laugh-squint"></i><span style="margin-left: 5px;">세무사의 간편한 업무를 위한 세무신고서 자동 생성 서비스</span><br>
            </p>
            <p id="webSocketTest"></p>
          </div>
        </div>
        <div class="col-lg-4  col-md-6 col-sm-6">
          <div class="single-footer-widget">
            <h6 style="margin-bottom:15px;">Newsletter</h6>
            <p style="font-family: 'Noto Sans KR', sans-serif; color: rgba(2,2,2,0.7)">
            	<i class="fas fa-envelope-square"></i><span style="margin-left: 5px;">SMS 수신에 동의하시면, <br>하나WITH에서 제공하는 사업보고서를 정기적으로 받아보실 수 있습니다.</span>
            </p>
            <div class="" id="mc_embed_signup">

              <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                method="get" class="form-inline">

                <div class="d-flex flex-row">
                  <div style="position: absolute; left: -5000px;">
                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                  </div>
                </div>
                <div class="info"></div>
              </form>
            </div>
          </div>
        </div>
        <div class="col-lg-3  col-md-6 col-sm-6">
          <div class="single-footer-widget mail-chimp">
            <h6 class="mb-20" style="margin-bottom:15px;">Quick Links</h6>
            <p style="font-family: 'Noto Sans KR', sans-serif; color: rgba(2,2,2,0.7)">
            <i class="fas fa-external-link-alt"></i><a href="#" style="color: rgba(2,2,2,0.7)"><span style="margin-left: 5px;">하나금융티아이</span></a><br>
            <i class="fas fa-external-link-alt"></i><a href="#" style="color: rgba(2,2,2,0.7)"><span style="margin-left: 5px;">하나은행</span></a><br>
            <i class="fas fa-external-link-alt"></i><a href="#" style="color: rgba(2,2,2,0.7)"><span style="margin-left: 5px;">하나금융투자</span></a><br>
            <i class="fas fa-external-link-alt"></i><a href="#" style="color: rgba(2,2,2,0.7)"><span style="margin-left: 5px;">하나카드</span></a><br>
            <i class="fas fa-external-link-alt"></i><a href="#" style="color: rgba(2,2,2,0.7)"><span style="margin-left: 5px;">하나캐피탈</span></a><br>
            <i class="fas fa-external-link-alt"></i><a href="#" style="color: rgba(2,2,2,0.7)"><span style="margin-left: 5px;">하나생명</span></a><br>
            </p>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-sm-6">
          <div class="single-footer-widget">
            <h6 style="margin-bottom:15px;">Follow Us</h6>
            <div class="footer-social d-flex align-items-center">
              <a href="#">
                <i class="fab fa-facebook-f" style="color: rgba(2,2,2,0.7)"></i>
              </a>
              <a href="#">
                <i class="fab fa-twitter" style="color: rgba(2,2,2,0.7)"></i>
              </a>
              <a href="#">
                <i class="fab fa-dribbble" style="color: rgba(2,2,2,0.7)"></i>
              </a>
              <a href="#">
                <i class="fab fa-behance" style="color: rgba(2,2,2,0.7)"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by Colorlib
</p>
      </div>
    </div>
  </footer>