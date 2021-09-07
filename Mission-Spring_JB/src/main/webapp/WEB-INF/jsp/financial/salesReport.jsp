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

.product-img3{
 	max-width: 20px;
    max-height: 20px;
 	margin-top: -5px;
    margin-right: 0px;
 }

</style>

</head>


<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />
	<!--================Header Menu Area =================-->



	<!--================ Start Blog Post Area =================-->

	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>사업보고서</h4>
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">매출내역</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">매입내역</a></li>
			</ul>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<!--================ End Footer Area =================-->


</body>
</html>