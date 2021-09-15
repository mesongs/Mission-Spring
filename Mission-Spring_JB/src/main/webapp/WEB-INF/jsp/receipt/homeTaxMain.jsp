<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?before">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

 

<!-- <style>

#comment-custom-receipt {
	/* max-width: 700px; */
	width: 1000px;
    margin-left: 350px;
	font-family: 'Noto Sans KR', sans-serif;
    margin-top: 30px;
	
}

#comment-custom-receipt > h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: xx-large;
}

.container {
	margin-top: 30px;
}

#receiptResgisterBtn {
	width : 410.5px;
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

.col-md-auto{
padding-right: 0px;
}

#searchWord{
	border-top-left-radius : 5px;
	border-bottom-left-radius : 5px;
	border-color: #999999;
	

}

input::placeholder{

	color : #495057;
}

.product-img {
    max-width:50px;
    max-height:50px;
	margin-top: -5px;
	margin-right: -10px;
}

 button{
 
 	color: #495057;
 }
 
  table {
    margin-top: 20px;
    border-top: 3px solid #495057;
    border-collapse: collapse;
    border-bottom: 4px solid #495057;
    
  }
  
  th, td {
    border-bottom: 1px solid #495057;
    padding: 10px;
  }
  
  
  th{
  	border-top: 3px solid #495057;
  }
  
 #excelBtn{
 	border-top-left-radius: 5px;
 	border-top-right-radius : 5px;
 	border-bottom-right-radius: 5px;
 	border-bottom-left-radius: 5px;
 }
 
 #searchBtn{
 	margin-left : -2px;
 	border-top-right-radius : 5px;
 	border-bottom-right-radius: 5px;
 }
 
 #perReceipt{
 	border-radius: 5px 5px 5px 5px; 
 }
 
 .calenderInput{
		background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 4px 9px; 
		background-size:15px; 
		padding:4px 2px 5px 25px;
		width: 120px;
		border-top-left-radius: 5px;
	 	border-top-right-radius : 5px;
	 	border-bottom-right-radius: 5px;
	 	border-bottom-left-radius: 5px;
	
	}
	
	#searchDate{
		height : 39px;
		border-top-left-radius: 5px;
	 	border-top-right-radius : 5px;
	 	border-bottom-right-radius: 5px;
	 	border-bottom-left-radius: 5px;
	
	}
 	
 tr:hover {
	background-color: #FEFDCF;
}
</style> -->

<style>
	.product-img2 {
    max-width: 30px;
    max-height: 50px;
    margin-top: -5px;
    margin-right: -10px;
}

 .testbox2{
 	display: none;
 }
 
 .product-img3{
 	max-width: 30px;
    max-height: 30px;
 	margin-top: -5px;
    margin-right: 0px;
 }
 
  .product-img4{
 	max-width: 20px;
    max-height: 20px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 0px;
 }
 
 .cardMenu {
 	border: 3px solid;
    border-color: rgba(130, 139, 178, 0.5);
    width: 250px;
    height: 241px;
 
}

 .addHover:hover {
    width:400px;
    transform:scale(1.1);
    transition: transform.5s;
    }
    

.nav-tabs .nav-link.active {
    color: #007BFF;
}
    

</style>

<script>



$(document).ready(function(){
		
	$('#myModal').modal('show');
	$('#title').html('과세기간 및 신고납부 안내');
	$('#alert-modal-body-msg').html('<img src="${ pageContext.request.contextPath }/resources/img/taxbilDateDetail.png" style="width:1001px; height:420px;" class="img-fluid rounded">')
	
})


</script>

</head>


<body>
	
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->
	
	<div class="comment-form-receipt" id="comment-custom-receipt" style="width: 1110px;">
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">증빙관리</h4>
			</div>
		</div>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/register"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/pictureReceipt.jpg">증빙자료 직접 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">처리 완료 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptWaitList">처리 대기 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/rejectReceiptList">반려 목록</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#"><img class="product-img3" src="${ pageContext.request.contextPath }/resources/img/autoCollect.png">증빙자료 수집/조회</a></li>
			</ul>
			
			 <section>
			<div class="container" align="center" class="cardMenuCon">
				<div class="row">
					<div class="col">
						<div align="right" class="single-recent-blog-post card-view">
							<div class="cardMenu" style="border: 0px;">
								<a href="${ pageContext.request.contextPath }/receipt/homeTaxPage"> <img class="addHover" src="${ pageContext.request.contextPath }/resources/img/bz1.png"style="margin-top: 0px; width: 250px; margin-top: 30px;">
								</a>
							</div>
						</div>
					</div>
					<div class="col">
						<div align="left" class="single-recent-blog-post card-view">
							<div class="cardMenu" style="border: 0px; ">
								<a href="${ pageContext.request.contextPath }/receipt/homeTaxCash"><img class="addHover" src="${ pageContext.request.contextPath }/resources/img/cash1.png" style="margin-top: 0px; width: 250px;margin-top: 30px;margin-left: 40px;margin-right: 30px;"></a>
							</div>
						</div>
					</div>
					<div class="col">
						<div align="left" class="single-recent-blog-post card-view">
							<div class="cardMenu" style="border: 0px; ">
								<a href="${pageContext.request.contextPath }/receipt/homeTaxDigitalInvoice"><img class="addHover" src="${ pageContext.request.contextPath }/resources/img/taxBil.png" style="margin-top: 0px; width: 250px;margin-top: 30px;margin-right: 30px;"></a>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</section>
		</div>

	</div>
	
	<%-- <jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/> --%>
	<!--================ End Blog Post Area =================-->

	<div class="modal fade" id="myModal" role="dialog" style="text-align: center;">
					
					<!-- <div class="modal-dialog"> -->
					<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
						<div class="modal-content">
						
							<div class="modal-header">
								<h5 id="title" class="modal-title" style="font-family:'Noto Sans KR', sans-serif; ">알림</h5>
								<button type="button" class="close" data-dismiss="modal" style="padding-top: 5px;margin-top: 0px;">×</button>
							</div>
							<div class="modal-body" id="modal-body">
								<p id="alert-modal-body-msg" style="margin-bottom: 0px"></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #27b2a5; color: #fff">확인</button>
							</div>
						</div>
					</div>
	</div>

	
	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>