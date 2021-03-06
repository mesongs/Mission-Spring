<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/form.css?after">




<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp" />

<style>

tr:hover{
     background-color: #ffffff;
}

.product-img4{
 	max-width: 20px;
    max-height: 20px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 0px;
 }
.product-img3{
	max-width: 30px;
    max-height: 30px;
 	margin-top: -5px;
    margin-right: 0px;
 }

#comment-custom-receipt {
	/* max-width: 700px; */
	width: 1000px;
	margin: auto;
	margin-top: 70px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 30px;
	font-family: 'Noto Sans KR', sans-serif;
}

#comment-custom-receipt>h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: xx-large;
}

.container {
	margin-top: 30px;
}

#receiptResgisterBtn {
	width: 410.5px;
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

.receiptBtn {
	width: 90px;
	font-family: 'Noto Sans KR', sans-serif;
}

.row.box {
	margin-left: 34px;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link {
	color: #495057;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: #007BFF;
}

.nav.nav-tabs {
	font-family: 'Noto Sans KR', sans-serif;
}

.dragAndDropDiv {
	border: 4px dashed #999999;
	/* width: 610px; */
	width: 410px;
	top: 25px;
	height: 430px;
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

.statusbar {
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 150px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}


</style>


<script>

	$(document).ready(function() {
		
		var objDragAndDrop = $(".dragAndDropDiv");
        
        // ?????? ?????? ????????????, hidden???????????? file?????? ??????
        objDragAndDrop.on('click',function (e){
        	
            $('input[type=file]').trigger('click');
        });
		
        // ???????????? ??????
        $("input[name='fileUpload']").on('change', function(e) {
           
        	// ????????? ?????? (????????? pop)
        	 var ext = $("input[name='fileUpload']").val().split('.').pop().toLowerCase();
    		
        	// ???????????? ext??? ?????? ?????? ????????? ????????? ??????
        	 if($.inArray(ext, ['jpg','jpeg','png']) == -1) {
        		 
        		$('#myModal').modal('show');
        		$('#alert-modal-body-msg').html('???????????? ?????? ?????? ???????????????.<br/> (jpg, jpeg, png ?????? ????????? ????????? ????????????.)')
        	
        		return false;
    		}
        	
        	// ???????????? ????????? ????????? ??????
        	let preview = $('#thumb');
 
        	// ???????????? ?????? ??????
        	var file = e.originalEvent.target.files;
        	
        	// createObjectURL ??????????????? ?????? ????????? ???????????? ???????????? ?????? method (?????????????????? ????????? ????????? ?????????)
        	preview.attr("src", URL.createObjectURL(file[0]))
        	
        	// replaceImg??? replaceThumb??? replace, display none??? block??????
        	$('#replaceImg').replaceWith($('#replaceThumb'))
        	$('#replaceThumb').css('display', 'block');
        	
        	// ????????? ?????? ??? ????????? ??????????????? ??????
        	preview.onload = function(){
        		URL.revokeObjectURL(URL.createObjectURL(file[0]));
        	}
        	
        	// ????????? div????????? ????????? ??????, obj.after(this.statusbar)
            var status = new createStatusbar(objDragAndDrop);
            status.setFileNameSize(file[0].name, file[0].size);
        });
        
        
        function createStatusbar(obj){
            
         	this.statusbar = $("<div class='statusbar'></div>");
         	this.filename = $("<div class='filename'></div>").appendTo(this.statusbar); // statusbar ?????? ???????????? appendTo
        	this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            
         	// ????????? ???????????? div ????????? ?????? ??????
            obj.after(this.statusbar);
         	
            // ???????????? ?????????, ?????????
            this.setFileNameSize = function(name, size){
                
            	var sizeStr="";
                var sizeKB = size/1024;
                
                if(parseInt(sizeKB) > 1024){
                    var sizeMB = sizeKB/1024;
                    sizeStr = sizeMB.toFixed(2)+" MB";
                }else{
                    sizeStr = sizeKB.toFixed(2)+" KB";
                }
         
                this.filename.html(name);
                this.size.html(sizeStr);
            }
            
            
        }
        
    });
</script>


<script>
	function doHomeTaxConnect(){
		// ?????? ????????? ???????????? ???????, form????????? api????????? ??????????????????
		$('#confirmMyModal').modal('show');

	}
	
	function clickHomeTaxConnect(formName){
		// ????????? ?????? ?????????, ????????? ????????? ????????? homeTaxId homeTaxPassword businessNo??? ??????
		formName.action = "${pageContext.request.contextPath}/receipt/homeTaxConnect";
		formName.method = "post";
		formName.submit();
		
	}
	
	
		
		
		/* $.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/getPerReceiptList",
				data : { homeTaxId : homeTaxId, homeTaxPassword : homeTaxPassword, businessNo:businessNo},
				success : function(result){
					
					// ????????? api????????? ?????? ????????????
					
				},
				
				error:function(request, status, error){
				    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
				
			}) */
		
		// form????????? ????????? ??????????????????,
		//formName.action = "${ pageContext.request.contextPath }/receipt/homeTaxConnect";
		//formName.method = "post";
		//formName.submit();
		
		// post??? ????????? ?????? ???
				
//	}

</script>

</head>

<script>

	$(function(){
	
		$('#myModal').modal('show');
		$('#title').html('????????? ?????? ?????????')
		$('#alert-modal-body-msg').html('<img src="${ pageContext.request.contextPath }/resources/img/receiptGuide1.png" class="img-fluid rounded">')
		$('#alert-modal-body-msg').append('<img src="${ pageContext.request.contextPath }/resources/img/receiptGuide2.png" class="img-fluid rounded">')
		$('#alert-modal-body-msg').append('<img src="${ pageContext.request.contextPath }/resources/img/receiptGuide3.png" class="img-fluid rounded">')
		$('#alert-modal-body-msg').append('<img src="${ pageContext.request.contextPath }/resources/img/receiptGuide4.png" class="img-fluid rounded">')
		$('#alert-modal-body-msg').append('<img src="${ pageContext.request.contextPath }/resources/img/receiptGuide5.png" class="img-fluid rounded">')
	})
	

</script>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />
	<!--================Header Menu Area =================-->



	<!--================ Start Blog Post Area =================-->

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>????????????</h4>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px; width: 990px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/pictureReceipt.jpg">???????????? ?????? ??????</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList"><i style="color:#27b2a5;" class="fas fa-check-circle"></i><sapn style="margin-left: 5px;">?????? ?????? ??????</sapn></a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList"><i style="color:#27b2a5" class="fas fa-pause-circle"></i><span style="margin-left: 5px;">?????? ?????? ??????</span></a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/rejectReceiptList"><i style="color:#27b2a5" class="fas fa-times-circle"></i><span style="margin-left:5px;">?????? ??????</span></a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:doHomeTaxConnect()"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/autoCollect.png">?????? ???????????? ??????</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/allReceiptList"><i style="color:#27b2a5" class="fas fa-dot-circle"></i><span style="margin-left:5px;">?????? ??????/?????? ??????</span></a></li>
			</ul>
			
			<section id="ajaxReplace">
			<div style="margin-top: 30px;margin-left: 66px;margin-bottom: 30px; width:500px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; width:790px;">
									<span style="margin-left: 6px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="margin-left: 3px; margin-bottom: 6px;">????????? ????????? ?????? ????????????, ???????????? ????????? ???????????? ????????? ?????????, ????????? ????????? ?????????????????? ??????????????????. </span>
								</div>
				<form method="post" enctype="multipart/form-data">

					<div class="container">

						<div class="row box">
							
							<div class="col" style="margin-top: 25px;">
								<div id="fileUpload" class="dragAndDropDiv">
									<section id="replaceImg">
										<img src="${ pageContext.request.contextPath }/resources/img/upload.png" style="width: 300px;">
										<p>File Upload</p>
									</section>
								</div>
								<!-- preview?????? ????????? ????????? ??????????????? ???????????? accept, ????????? ??????x -->
								<input type="file" name="fileUpload" id="fileUpload" style="display: none;" accept="image/jpeg, image/jpg, image/png" multiple />
							</div>
							<div class="col">
								<span>?????? ??????</span> <select name="receiptKind" id="receiptKind"
									style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;">
									<option value="">???????????? ???????????? ???????????????.</option>
									<option value="1">???????????????</option>
									<option value="2">?????????</option>
									<option value="3">???????????????</option>
									<option value="4">???????????????</option>
								</select> <span>?????? ??????</span> <select name="purpose" id="purpose"
									style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;">
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

								<div class="form-group">
									<span>??????</span>
									<textarea class="form-control mb-10" name="memo" id="memo"
										rows="10" placeholder="???????????? ????????? ???????????????."
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '???????????? ????????? ???????????????.'"
										style="padding-left: 4px; color: #999999; margin-bottom: 20px;"></textarea>
								</div>
								<div class="col" align="center">
									<input type="submit" class="button submit_btn" value="??????" id="receiptResgisterBtn" /><br />
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
	
	<section id="replaceThumb" style="max-width: 100%; height: 100%;">
		<img src="" id="thumb" style="max-width: 100%; height: 100%;"/>
	</section>
	
	<!-- confirmModal -->
	<div class="modal fade" id="confirmMyModal" role="dialog" style="text-align: center;">
				
					<div class="modal-dialog">
						<div class="modal-content">
						
							<div class="modal-header">
								<h5 class="modal-title" style="font-family:'Noto Sans KR', sans-serif; "><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/homeTax.png">????????? ??????</h5>
								<button type="button" class="close" data-dismiss="modal" style="padding-top: 5px;margin-top: 0px;">??</button>
							</div>
							<div class="modal-body" id="modal-body">
								<form name="homeTaxInfo">
									<table style="margin: auto; border-collapse: separate; border-spacing: 0 10px;">
										<tr>
											<th style="padding-right: 10px;" >?????????ID</th>
											<td><input type="text" autocomplete="off" class="form-control" name="hometaxId" id="hometaxId" style="float: left; width: 200px;"></td>
										</tr>
										<tr>
											<th style="padding-right: 10px;">????????????</th>
											<td><input type="password" class="form-control" name="hometaxPassword" id="hometaxPassword" style="float: left; width: 200px;"></td>
										</tr>
										<tr style="margin-bottom: 50px;">
											<th style="padding-right: 10px;">???????????????</th>
											<td><input autocomplete="off" type="text" class="form-control" name="businessNo" id="businessNo" style="float: left; width: 200px;" value="${userVO.businessNo }"></td>
										</tr>
									</table>
									<div style="width:100%; margin-top: 20px;margin-bottom: 20px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
										<span style="margin-left: 6px; font-size:16px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="width:20px; margin-right: 3px;margin-top: 2px; margin-left: 3px; margin-bottom: 6px;">????????? ?????? ????????? ?????? ?????? ?????? ?????? / ?????? ????????? ?????? ?????? ?????? / ??????(???????????????) ?????? ???????????? ???????????? ??? ????????????.</span>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" onclick="clickHomeTaxConnect(homeTaxInfo)" style="background-color: #27b2a5; color: #fff">??????</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
							</div>
						</div>
					</div>  
	</div>
	<!-- Modal -->
	
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<!--================ End Footer Area =================-->


</body>
</html>