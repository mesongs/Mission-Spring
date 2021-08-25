<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">

<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp" />

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
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



</style>


<script>

	/* $(function(){
		 
		 var subMenu = $(".container > ul > li"); // container 클래스 아래의 ul li태그
		 
		 // subMenu아래의 a태그를 클릭하면 호출되는 함수
		 subMenu.find("a").click(function() {   
	     
			 // 우선 a태그에 걸려있는 active 클래스 삭제 
			 $("a").removeClass("active");  
			 // 내가 선택한 태그에 a태그에 active 클래스 추가
			 $(this).addClass("active");
			 
	  })
	}) */
	
	
	<%--  replace하려고 썻지만, controller를 들려야하기 때문에 변경해줌  <a href= .do로 이동해서 controller로>
	// 영수증 등록 탭 section replace, 탭 이동 시 자신의 section도 호출해야함
	function doRegisterCall(){
		
		$.get("<%=request.getContextPath()%>/replaceTest3.jsp", function(data){
			
			$('#ajaxReplace').replaceWith(data)
			
		})
		
	}
	
	function doListCall(){
		
		// subMenu 이동 시 페이지 replace
		$.get("<%=request.getContextPath()%>/replaceTest.jsp", function(data){
			
			$('#ajaxReplace').replaceWith(data)
			
		})
		
	}
	
	function doProcessCall(){
		
		$.get("<%=request.getContextPath()%>/replaceTest2.jsp", function(data){
			
			$('#ajaxReplace').replaceWith(data)
		})
		
	} --%>
	
	
	
</script>

</head>


<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />
	<!--================Header Menu Area =================-->



	<!--================ Start Blog Post Area =================-->
	
	<div class="comment-form-receipt" id="comment-custom-receipt">
		<h4>현장 지원센터</h4>
		
		<div class="container">
			<ul class="nav nav-tabs" style="margin-left: 50px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">안내</a></li>
				<li class="nav-item"><a class="nav-link" href="centerReserve.jsp">상담예약</a></li>
			</ul>

			
				
					
					<div class="container"> 
						
						<div class="row box">
	
							
	
							<div class="col" style= "height: 500px;">
								<img src="resources/img/guide2.png" style="position: absolute; top:0; left: 0; width: 100%; height: 100%; margin-top: 30px;">
							</div>
	
	
						</div>
	
						<div class="row" style="margin-top: 20px">
							<div class="col"></div>
							
							<div class="col"></div>
						</div>
					</div>
				
		</div>

	</div>
	


	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<!--================ End Footer Area =================-->


</body>
</html>