<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp" />

<style>
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
        
        // 해당 영역 클릭하면, hidden되어있는 file태그 실행
        objDragAndDrop.on('click',function (e){
        	
            $('input[type=file]').trigger('click');
        });
		
        // 업로드한 경우
        $("input[name='fileUpload']").on('change', function(e) {
           
        	// 확장자 체크 (확장자 pop)
        	 var ext = $("input[name='fileUpload']").val().split('.').pop().toLowerCase();
    		
        	// 배열내의 ext와 같은 값을 찾아서 인덱스 반환
        	 if($.inArray(ext, ['jpg','jpeg','png']) == -1) {
        		 
        		$('#myModal').modal('show');
        		$('#alert-modal-body-msg').html('지원되지 않는 파일 유형입니다.<br/> (jpg, jpeg, png 파일 유형을 사용해 주십시오.)')
        	
        		return false;
    		}
        	
        	// 썸네일을 표시할 이미지 태그
        	let preview = $('#thumb');
 
        	// 업로드한 파일 객체
        	var file = e.originalEvent.target.files;
        	
        	// createObjectURL 파라미터로 받은 파일의 바이너리 데이터를 읽는 method (파일객체에서 이미지 데이터 가져옴)
        	preview.attr("src", URL.createObjectURL(file[0]))
        	
        	// replaceImg를 replaceThumb로 replace, display none을 block으로
        	$('#replaceImg').replaceWith($('#replaceThumb'))
        	$('#replaceThumb').css('display', 'block');
        	
        	// 이미지 로딩 후 객체를 메모리에서 해제
        	preview.onload = function(){
        		URL.revokeObjectURL(URL.createObjectURL(file[0]));
        	}
        	
        	// 업로드 div아래에 상태창 생성, obj.after(this.statusbar)
            var status = new createStatusbar(objDragAndDrop);
            status.setFileNameSize(file[0].name, file[0].size);
        });
        
        
        function createStatusbar(obj){
            
         	this.statusbar = $("<div class='statusbar'></div>");
         	this.filename = $("<div class='filename'></div>").appendTo(this.statusbar); // statusbar 하위 항목으로 appendTo
        	this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            
         	// 썸네일 표시하는 div 아래에 넣기 위해
            obj.after(this.statusbar);
         	
            // 전달받은 파일명, 사이즈
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
		// 모달 다른거 불러오는 방법?, form태그로 api서버에 요청보내야함
		$('#confirmMyModal').modal('show');

	}
	
	function clickHomeTaxConnect(formName){
		// 모달창 확인 누르면, 회원이 입력한 정보를 homeTaxId homeTaxPassword businessNo로 전송
		formName.action = "${pageContext.request.contextPath}/receipt/homeTaxConnect";
		formName.method = "post";
		formName.submit();
		
	}
	
	
		
		
		/* $.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/getPerReceiptList",
				data : { homeTaxId : homeTaxId, homeTaxPassword : homeTaxPassword, businessNo:businessNo},
				success : function(result){
					
					// 홈택스 api서버로 바로 요청하기
					
				},
				
				error:function(request, status, error){
				    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
				
			}) */
		
		// form태그로 전송할 필요없겠는데,
		//formName.action = "${ pageContext.request.contextPath }/receipt/homeTaxConnect";
		//formName.method = "post";
		//formName.submit();
		
		// post로 모달에 있는 폼
				
//	}

</script>

</head>

<script>

	$(function(){
	
		$('#myModal').modal('show');
		$('#title').html('영수증 등록 가이드')
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
		<h4>증빙관리</h4>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/pictureReceipt.jpg">증빙자료 직접 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">처리 완료 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList">처리 대기 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/rejectReceiptList">반려 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:doHomeTaxConnect()"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/autoCollect.png">증빙자료 수집/조회</a></li>
			</ul>
			
			<section id="ajaxReplace">
			<div style="margin-top: 30px;margin-left: 66px;margin-bottom: 30px; width:500px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; width:790px;">
									<span style="margin-left: 6px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="margin-left: 3px; margin-bottom: 6px;">사업자 카드가 아닌 개인카드, 가족명의 카드를 사용하여 매입한 영수증, 수기로 작성한 세금계산서를 등록해주세요. </span>
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
								<!-- preview에서 이미지 파일만 필터링해서 보이도록 accept, 확장자 체크x -->
								<input type="file" name="fileUpload" id="fileUpload" style="display: none;" accept="image/jpeg, image/jpg, image/png" multiple />
							</div>
							<div class="col">
								<span>증빙 구분</span> <select name="receiptKind" id="receiptKind"
									style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;">
									<option value="">등록하실 영수증을 선택하세요.</option>
									<option value="1">세금계산서</option>
									<option value="2">계산서</option>
									<option value="3">카드영수증</option>
									<option value="4">간이영수증</option>
								</select> <span>사용 목적</span> <select name="purpose" id="purpose"
									style="background-color: rgba(130, 139, 178, 0.25); margin-bottom: 20px;">
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

								<div class="form-group">
									<span>메모</span>
									<textarea class="form-control mb-10" name="memo" id="memo"
										rows="10" placeholder="기록하실 내용을 입력하세요."
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '기록하실 내용을 입력하세요.'"
										style="padding-left: 4px; color: #999999; margin-bottom: 20px;"></textarea>
								</div>
								<div class="col" align="center">
									<input type="submit" class="button submit_btn" value="등록" id="receiptResgisterBtn" /><br />
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
								<h5 class="modal-title" style="font-family:'Noto Sans KR', sans-serif; "><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/homeTax.png">홈택스 연동</h5>
								<button type="button" class="close" data-dismiss="modal" style="padding-top: 5px;margin-top: 0px;">×</button>
							</div>
							<div class="modal-body" id="modal-body">
								<form name="homeTaxInfo">
									<table style="margin: auto; border-collapse: separate; border-spacing: 0 10px;">
										<tr>
											<th style="padding-right: 10px;">홈택스ID</th>
											<td><input type="text" class="form-control" name="hometaxId" id="hometaxId" style="float: left; width: 200px;"></td>
										</tr>
										<tr>
											<th style="padding-right: 10px;">비밀번호</th>
											<td><input type="password" class="form-control" name="hometaxPassword" id="hometaxPassword" style="float: left; width: 200px;"></td>
										</tr>
										<tr style="margin-bottom: 50px;">
											<th style="padding-right: 10px;">사업자번호</th>
											<td><input type="text" class="form-control" name="businessNo" id="businessNo" style="float: left; width: 200px;" value="${userVO.businessNo }"></td>
										</tr>
									</table>
									<div style="width:100%; margin-top: 20px;margin-bottom: 20px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
										<span style="margin-left: 6px; font-size:16px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="width:20px; margin-right: 3px;margin-top: 2px; margin-left: 3px; margin-bottom: 6px;">연동을 통해 사업자 카드 매입 내역 조회 / 현금 영수증 매입 내역 조회 / 전자(세금계산서) 조회 서비스를 이용하실 수 있습니다.</span>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" onclick="clickHomeTaxConnect(homeTaxInfo)" style="background-color: #27b2a5; color: #fff">확인</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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