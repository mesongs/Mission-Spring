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

#webSocketBtn{
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
    // ????????? ?????? ????????? ?????? 192.168.217.51
//  ws=new WebSocket("ws://localhost:9999/Mission-Spring/echo");
    ws=new WebSocket("ws://34.64.137.151:8080/Mission-Spring_JB/echo");
    
    ws.onopen=function(event){
        if(event.data===undefined) return;
        
        console.log("onopen : " + event.data)
        //writeResponse(event.data);
    };
    // ???????????? ???????????? ??? ??????
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
 
//send ?????????, ???????????? ????????? ??????
 function send(){
    
	let check = $("input[name=confirm]:checked").val();
	
	switch(check) {
	
	  case '1':
		  sendMessage = "???????????? ???????????? ???????????? ?????????????????????."
		  break

	  case '2':
		  sendMessage = "???????????? ???????????? ???????????? ?????????????????????."
	      break								
	}
	
	let text=sendMessage + "," + 'admin';
//	let text="????????? ?????????123" + "," + 'admin';
    ws.send(text);
    text="";
    
    // form????????? submit????????????, ????????? send() ????????? ???, trigger??? ??????
    $("#formSubmit").trigger('click');
    
    }

 openSocket()
 
 // send()??? ?????? ??????????????? ???????????????..
/*  function clickWebSocketSend(formName){
		 
		// user?????? ?????? / ?????? ?????? ??????
		
	 	// ???????????? ???????????? ??????, ???????????? ???????????? ???????????? ?????? / ?????? ???????????????. 
	 	alert('clickWebSocketSend ???????????? ????????? ??????')
		
		send()
	 	
		formName.action = "${ pageContext.request.contextPath }/receipt/accept";
		formName.method = "post";
		formName.submit();
	 } */
 
 
 
$(function(){
	
	// ?????? ?????? ??????
	$('#receiptDelBtn').click(function(){
		
		location.href = '${ pageContext.request.contextPath }/receipt/receiptManager' 
		
	})
	
	$("#receiptKind").val('${receipt.receiptCode}').prop("selected", true)
	//$("#purpose").val(${receiptFile.selectedPurposeNo}).prop("selected", true)
	
	let purposeNo = '';
	
	switch('${receipt.purpose}') {
	
				  case '?????????':
					  purposeNo = '1'
					  break
			
				  case '?????????':
					  purposeNo = '2'
				      break								
				
				  case '??????':
					  purposeNo = '3'
				      break
				    
				  case '?????????':
					  purposeNo = '4'   
					  break 
					
				  case '??????':
					  purposeNo = '5'   
				   	  break
				   	  
				  case '?????????':
					  purposeNo = '6'   
				   	  break
				   
				  case '?????????':
					  purposeNo = '7'   
					  break
					   	
				  case '??????':
					  purposeNo = '8'   
					  break
				}
	
		$("#purpose").val(purposeNo).prop("selected", true)

	// js?????? ????????? ?????? ????????????, ???????????? ''???????????? ???????????? ?????????, ????????? ??????????????? ?????? ?????? ???
	$("#memo").val('${receipt.memo}')
	
	
	$("input:radio[name=confirm]").click(function(){
		 
        if($("input[name=confirm]:checked").val() == "2"){
        	
        	$('#rejectDiv').css('display', 'block');
 
        }else{
        	
        	$('#rejectDiv').css('display', 'none');
        	
        }
        
    });
		
	// ???????????? ?????? ?????? inputBox
	$("#rejectBoxDirect").hide();
		
	
	$("#rejectSelBox").change(function() {

			//??????????????? ?????? ??? ?????????

			if ($("#rejectSelBox").val() == "direct") {

				$("#rejectBoxDirect").show();

			} else {

				$("#rejectBoxDirect").hide();

			}

		})
		

	})
	
	$(document).on("click", "#receiptSaveBtn", function (){
		
		location.href = "${ pageContext.request.contextPath }/receipt/accept"
		
		// ?????? or ???????????? ??? ???????????? ??????????????? ?????????
		/* if($("input[name=confirm]:checked").val() == "1"){
			
			//form????????? value??? ???????????? ??????
			location.href = "${ pageContext.request.contextPath }/receipt/accept"
			
		}else{
			
			alert('??????????????? ?????????')
			
		} */
	})
	
	
	

</script>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>??????/?????? ??????</h4>
		
		<div class="container">
			

			<section>
				<!-- <form name="acceptResultInfo"> -->
				<form method="post" action="${ pageContext.request.contextPath }/receipt/accept">
					<input type="hidden" name="receiptNo" value="${ receipt.receiptNo }">
					<div class="container"> 
						
						<div class="row box">
	
							<div class="col fileUpload" style="background-color: rgba(130, 139, 178, 0.25); height: 880px; top: 25px; bottom: 0px;margin-top: 0px; padding-right: 0px; padding-left: 0px;  ">
								<%-- <img src="${ receipt.filePath }" style="width: 300px;"> --%>
								<!-- filePath = C:\Lecture\spring-workspace\newUpload\kopo-92782264-3bb0-451d-9fa9-c7b9787cc86f.JPG -->
								
								<%-- <img src="/testUpload/${ receipt.fileSaveName }" style="max-width:100%; height: 100%"> --%>
								
								<!-- ????????? ?????? ?????? ??????( fileSaveName select)  -->
								<img src="${ pageContext.request.contextPath }/upload/${ receipt.fileSaveName }" style="width: 100%; height: 100%;">
							</div>
	
							<div class="col">
								<span>?????? ??????</span>
								<!--????????? ?????? ?????? ???????????? selected https://dorongdogfoot.tistory.com/136  -->
								<select name="receiptKind" id="receiptKind" style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;" required>
									<option value="">????????? ??????</option>
									<option value="001">???????????????</option>
									<option value="002">?????????</option>
									<option value="003">???????????????</option>
									<option value="004">???????????????</option>
								</select>
								
								<div>
									<span>?????????</span>
				                    <input type="text" class="form-control" name="userId" id="userId" placeholder="?????????" onfocus="this.placeholder = ''" onblur="this.placeholder = '?????????'" value="${receipt.userId }">
								</div>	
								
								
								
	                        	<div style="width: 440px;">
									<div style="float: left; width: 210px; margin-right: 10px;">
										<span>?????????</span>
	                          			<input type="text" class="form-control" name="storeName" id="storeName" placeholder="?????????" onfocus="this.placeholder = ''" onblur="this.placeholder = '?????????'" value="${ receipt.storeName }">
									</div>
									<div style="float: left; width: 210px; margin-left: 10px;">
										<span>?????????????????????</span>
	                          	<input type="text" class="form-control" name="businessNo" id="businessNo" placeholder="?????????????????????" onfocus="this.placeholder = ''" onblur="this.placeholder = '???????????????'" value="${ receipt.supplierBusinessNo }">
									</div>
								</div>
	                        	
								<div style="width: 440px;">
									<div style="float: left; width: 210px; margin-right: 10px;">
										<span>????????????</span>
			                          	<input type="text" class="form-control" name="receiptDate" id="receiptDate" placeholder="????????????" onfocus="this.placeholder = ''" onblur="this.placeholder = '????????????'" value="${ receipt.receiptDate }">
									</div>
									<div style="float: left; width: 210px; margin-left: 10px;">
										<span>????????????</span>
			                          	<input type="text" class="form-control" name="regDate" id="regDate" placeholder="????????????" onfocus="this.placeholder = ''" onblur="this.placeholder = '????????????'" value="${ receipt.regDate }">
									</div>
								</div>
								
								<div>
									<span>????????????</span>
				                    <input type="text" class="form-control" name="receiptAmount" id="receiptAmount" placeholder="????????????" onfocus="this.placeholder = ''" onblur="this.placeholder = '????????????'" value="${receipt.amount }???">
								</div>	
								
								<div>	
									<span>?????????</span>
				                  	<input type="text" class="form-control" name="receiptVat" id="receiptVat" placeholder="?????????" onfocus="this.placeholder = ''" onblur="this.placeholder = '?????????'" value="${receipt.vat }???">
								</div>
								
								
								<div style="width: 440px;">
									<div style="float: left; width: 210px; margin-right: 10px;">
										<span>?????? ??????</span>
										<select name="overlap" id="overlap"  style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;">
											<c:choose>
												<c:when test="${ receipt.overlap eq 'N' }">
													<option value="1" selected>????????????</option>
													<option value="2">????????????</option>
												</c:when>
												<c:when test="${receipt.overlap eq 'Y'}">
													<option value="1" selected>????????????</option>
													<option value="2" selected>????????????</option>
												</c:when>
											</c:choose>
										</select>
									</div>
									<div style="float: left; width: 210px; margin-left: 10px;">
										<span>?????? ??????</span>
								<select name="purpose" id="purpose"  style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;" required>
									<option value="">??????????????? ?????????????????? ???????????????.</option>
									<option value="1">?????????</option>
									<option value="2">?????????</option>
									<option value="3">??????</option>
									<option value="4">?????????</option>
									<option value="5">??????</option>
									<option value="6">?????????</option>
									<option value="7">?????????</option>
									<option value="8">??????</option>
								</select>
									</div>
								</div>
								
								<div class="form-group">
									<span>??????</span>
									<textarea class="form-control mb-10" name="memo" id="memo"rows="6" placeholder="???????????? ????????? ???????????????." onfocus="this.placeholder = ''" onblur="this.placeholder = '???????????? ????????? ???????????????.'" style="padding-left: 4px; color: #999999; margin-bottom: 20px;" ></textarea>
								</div>
								
								<div id="confirmDiv" style="width: 440px;">
									<span>??????</span>
									<div style=" margin-top: 6px;">
										<div style="float: left; width: 210px; margin-right: 10px;" >
											<label><input type="radio" name="confirm" value="1" checked="checked">??????</label>
										</div>
										<div style="float: left; width: 210px; margin-right: 10px;">
											<label><input type="radio" name="confirm" value="2">??????</label>
										</div>
									</div>
								</div>
								
								<div id=rejectDiv style="display: none;">
									<span>?????? ??????</span>
									<select name="rejectSelBox" id="rejectSelBox" style="background-color: rgba(130, 139, 178, 0.25);">
										<option value="">?????? ????????? ????????? ?????????.</option>
										<option value="1">??????????????? ???????????? ??????</option>
										<option value="2">???????????? ??????</option>
										<option value="3">????????? ??? ?????? ??????</option>
										<option value="4">???????????? ?????? ??????</option>
										<option value="direct">????????????</option>
									</select>
									<!-- ???????????? ???????????? ???????????? inputBox -->
									<!-- <input type="text" id="rejectBoxDirect" name="selboxDirect"/> -->
									 <input type="text" class="form-control" name="rejectBoxDirect" id="rejectBoxDirect" style="margin-top: 20px;">
								</div>
								
								
								<div align="center" style="margin-top: 50px;">
									
									<!-- <a href="javascript:doNext()" class="button submit_btn" id="receiptSaveBtn">??????</a> -->
									<!-- <input type="submit" class="button submit_btn" id="receiptSaveBtn" value="??????"> -->
									<input type="button" id="webSocketBtn" class="button submit_btn" onclick="send()" value="??????">
									<input type="button" class="button submit_btn" id="receiptDelBtn" value="??????">
									<input type="submit" id="formSubmit" class="button submit_btn" id="receiptSaveBtn" value="??????" style="display: none;">
									<!-- <button type="button" class="button submit_btn" onclick="clickWebSocketSend(acceptResultInfo)">????????????</button> -->
									<!-- <a href="#" class="button submit_btn" id="receiptDelBtn">??????</a> -->
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
								<h5 class="modal-title" style="font-family:'Noto Sans KR', sans-serif; ">??????</h5>
								<button type="button" class="close" data-dismiss="modal" style="padding-top: 5px;margin-top: 0px;">??</button>
							</div>
							<div class="modal-body" id="modal-body">
								<p id="confirm-modal-body-msg" style="margin-bottom: 0px"></p>
							</div>
							<div class="modal-footer">
								<a href="#" class="btn btn-default" style="background-color: #27b2a5; color: #fff">??????</a>
								<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
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