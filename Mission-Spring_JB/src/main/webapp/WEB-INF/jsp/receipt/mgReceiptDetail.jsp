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


</head>


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
    // 메세지가 보내졌을 때 실행
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
 
// function writeResponse(text){
//     
// }
 
//send 메소드, 관리자가 보내는 부분
 function send(){
    //  let text="웹소켓 테스트" + "," + 'admin';
        ws.send(text);
    //  text="";
    }

 openSocket()

 function clickWebSocketSend(formName){
	 
	// user에게 승인 / 반려 결과 전송
	
 	// 전달하는 인자값에 따라, 회원님이 등록하신 영수증이 승인 / 반려 되었습니다. 
 	
 	var chk = // 반려 승인 체크된 값에 따라~
	
	send();
	
	formName.action = "${ pageContext.request.contextPath }/receipt/accept";
	formName.method = "post";
	formName.submit();
	 
 }
 
 
 
$(function(){
	
	// 목록 이동 버튼
	$('#receiptDelBtn').click(function(){
		
		location.href = '${ pageContext.request.contextPath }/receipt/receiptManager' 
		
	})
	
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
	
	
	$("input:radio[name=confirm]").click(function(){
		 
        if($("input[name=confirm]:checked").val() == "2"){
        	
        	$('#rejectDiv').css('display', 'block');
 
        }else{
        	
        	$('#rejectDiv').css('display', 'none');
        	
        }
        
    });
		
	// 반려사유 직접 입력 inputBox
	$("#rejectBoxDirect").hide();
		
	
	$("#rejectSelBox").change(function() {

			//직접입력을 누를 때 나타남

			if ($("#rejectSelBox").val() == "direct") {

				$("#rejectBoxDirect").show();

			} else {

				$("#rejectBoxDirect").hide();

			}

		})
		

	})
	
	$(document).on("click", "#receiptSaveBtn", function (){
		
		location.href = "${ pageContext.request.contextPath }/receipt/accept"
		
		// 승인 or 반려했을 때 요청하는 컨트롤러는 동일함
		/* if($("input[name=confirm]:checked").val() == "1"){
			
			//form태그의 value를 넘기는지 확인
			location.href = "${ pageContext.request.contextPath }/receipt/accept"
			
		}else{
			
			alert('반려누르고 클릭함')
			
		} */
	})
	
	
	

</script>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>승인/반려 관리</h4>
		
		<div class="container">
			

			<section>
				<%-- <form method="post" action="${ pageContext.request.contextPath }/receipt/accept"> --%>
					<form name="acceptResultInfo">
					<input type="hidden" name="receiptNo" value="${ receipt.receiptNo }">
					<div class="container"> 
						
						<div class="row box">
	
							<div class="col fileUpload" style="background-color: rgba(130, 139, 178, 0.25); height: 880px; top: 25px; bottom: 0px;margin-top: 0px; padding-right: 0px; padding-left: 0px;  ">
								<%-- <img src="${ receipt.filePath }" style="width: 300px;"> --%>
								<!-- filePath = C:\Lecture\spring-workspace\newUpload\kopo-92782264-3bb0-451d-9fa9-c7b9787cc86f.JPG -->
								
								<%-- <img src="/testUpload/${ receipt.fileSaveName }" style="max-width:100%; height: 100%"> --%>
								
								<!-- 아래가 실제 서버 경로( fileSaveName select)  -->
								<img src="${ pageContext.request.contextPath }/upload/${ receipt.fileSaveName }" style="width: 100%; height: 100%;">
							</div>
	
							<div class="col">
								<span>증빙 구분</span>
								<!--넘어온 값에 따라 동적으로 selected https://dorongdogfoot.tistory.com/136  -->
								<select name="receiptKind" id="receiptKind" style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;" required>
									<option value="">영수증 구분</option>
									<option value="001">세금계산서</option>
									<option value="002">계산서</option>
									<option value="003">카드영수증</option>
									<option value="004">간이영수증</option>
								</select>
								
								<div>
									<span>아이디</span>
				                    <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" value="${receipt.userId }">
								</div>	
								
								
								
	                        	<div style="width: 440px;">
									<div style="float: left; width: 210px; margin-right: 10px;">
										<span>업체명</span>
	                          			<input type="text" class="form-control" name="storeName" id="storeName" placeholder="업체명" onfocus="this.placeholder = ''" onblur="this.placeholder = '업체명'" value="${ receipt.storeName }">
									</div>
									<div style="float: left; width: 210px; margin-left: 10px;">
										<span>사업자등록번호</span>
	                          	<input type="text" class="form-control" name="businessNo" id="businessNo" placeholder="사업자등록번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업자번호'" value="${ receipt.supplierBusinessNo }">
									</div>
								</div>
	                        	
								<div style="width: 440px;">
									<div style="float: left; width: 210px; margin-right: 10px;">
										<span>영수일시</span>
			                          	<input type="text" class="form-control" name="receiptDate" id="receiptDate" placeholder="영수일시" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수일시'" value="${ receipt.receiptDate }">
									</div>
									<div style="float: left; width: 210px; margin-left: 10px;">
										<span>등록일시</span>
			                          	<input type="text" class="form-control" name="regDate" id="regDate" placeholder="영수일시" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수일시'" value="${ receipt.regDate }">
									</div>
								</div>
								
								<div>
									<span>영수금액</span>
				                    <input type="text" class="form-control" name="receiptAmount" id="receiptAmount" placeholder="영수금액" onfocus="this.placeholder = ''" onblur="this.placeholder = '영수금액'" value="${receipt.amount }원">
								</div>	
								
								<div>	
									<span>부가세</span>
				                  	<input type="text" class="form-control" name="receiptVat" id="receiptVat" placeholder="부가세" onfocus="this.placeholder = ''" onblur="this.placeholder = '부가세'" value="${receipt.vat }원">
								</div>
								
								
								<div style="width: 440px;">
									<div style="float: left; width: 210px; margin-right: 10px;">
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
									</div>
									<div style="float: left; width: 210px; margin-left: 10px;">
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
									</div>
								</div>
								
								<div class="form-group">
									<span>메모</span>
									<textarea class="form-control mb-10" name="memo" id="memo"rows="6" placeholder="기록하실 내용을 입력하세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '기록하실 내용을 입력하세요.'" style="padding-left: 4px; color: #999999; margin-bottom: 20px;" ></textarea>
								</div>
								
								<div id="confirmDiv" style="width: 440px;">
									<span>확인</span>
									<div style=" margin-top: 6px;">
										<div style="float: left; width: 210px; margin-right: 10px;" >
											<label><input type="radio" name="confirm" value="1" checked="checked">승인</label>
										</div>
										<div style="float: left; width: 210px; margin-right: 10px;">
											<label><input type="radio" name="confirm" value="2">반려</label>
										</div>
									</div>
								</div>
								
								<div id=rejectDiv style="display: none;">
									<span>반려 사유</span>
									<select name="rejectSelBox" id="rejectSelBox" style="background-color: rgba(130, 139, 178, 0.25);">
										<option value="">반려 사유를 입력해 주세요.</option>
										<option value="1">증빙자료와 관련없는 사진</option>
										<option value="2">필수정보 누락</option>
										<option value="3">인식할 수 없는 사진</option>
										<option value="4">일치하지 않는 정보</option>
										<option value="direct">직접입력</option>
									</select>
									<!-- 직접입력 선택하면 나타나는 inputBox -->
									<!-- <input type="text" id="rejectBoxDirect" name="selboxDirect"/> -->
									 <input type="text" class="form-control" name="rejectBoxDirect" id="rejectBoxDirect" style="margin-top: 20px;">
								</div>
								
								
								<div align="center" style="margin-top: 50px;">
									
									<!-- <a href="javascript:doNext()" class="button submit_btn" id="receiptSaveBtn">저장</a> -->
									<input type="submit" class="button submit_btn" id="receiptSaveBtn" value="저장">
									<input type="button" class="button submit_btn" id="receiptDelBtn" value="목록">
									<button type="button" class="button submit_btn" onclick="send()">웹소켓</button>
									<button type="button" class="button submit_btn" onclick="clickWebSocketSend(acceptResultInfo)">저장클릭</button>
									<!-- <a href="#" class="button submit_btn" id="receiptDelBtn">목록</a> -->
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
	<!-- <div class="modal fade" id="myModal" role="dialog" style="text-align: center;">
				
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
				</div> -->


	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>