<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp" />

<style>
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
        
        // 해당 영역 클릭으로 파일 업로드 가능
        objDragAndDrop.on('click',function (e){
        	
        	// display none으로 둔 input[type=file]
            $('input[type=file]').trigger('click');
        });
		
        
        $("input[name='fileUpload']").on('change', function(e) {
           
        	// 확장자 체크 (확장자 pop)
        	 var ext = $("input[name='fileUpload']").val().split('.').pop().toLowerCase();
    		
        	// 배열내의 ext와 같은 값을 찾아서 인덱스 반환
        	 if($.inArray(ext, ['jpg','jpeg','png']) == -1) {
        		 
        		$('#myModal').modal('show');
        		$('#alert-modal-body-msg').html('지원되지 않는 파일 유형입니다.<br/> (jpg, jpeg, png 파일 유형을 사용해 주십시오.)')
        	
        		return false;
    		}
        	
        	// 업로드한 파일 객체
        	var file = e.originalEvent.target.files;
        	
        	// 썸네일을 표시할 이미지 태그
        	let preview = $('#thumb');
        	
        	// 파라미터로 받은 경로에 있는 파일의 바이너리 데이터를 읽는 method (파일객체에서 이미지 데이터 가져옴)
        	preview.attr("src", URL.createObjectURL(file[0]))
        	
        	preview.src = URL.createObjectURL(file[0])
  
        	// replaceImg를 replaceThumb로 replace, display none을 block으로
        	$('#replaceImg').replaceWith($('#replaceThumb'))
        	$('#replaceThumb').css('display', 'block');
        	
        	// 이미지 로딩 후 객체를 메모리에서 해제
        	preview.onload = function(){
        		URL.revokeObjectURL(preview.src);
        	}
        	
        	// 업로드 div아래에 상태창 생성, obj.after(this.statusbar)
            var status = new createStatusbar(objDragAndDrop);
            status.setFileNameSize(file[0].name, file[0].size);
        });
        
        
        function createStatusbar(obj){
            
         	this.statusbar = $("<div class='statusbar'></div>");
         	this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
        	this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            
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

</head>


<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />
	<!--================Header Menu Area =================-->



	<!--================ Start Blog Post Area =================-->

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>증빙관리</h4>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">영수증 등록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/receipt/processedList">영수증
						목록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/receipt/receiptWaitList">처리
						대기</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:"
					onclick="doReturnCall()">반려된 영수증</a></li>
			</ul>

			<section id="ajaxReplace">
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

	
	<!-- Modal -->
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<!--================ End Footer Area =================-->


</body>
</html>