<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form.css?after">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?before">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/reset2.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/main2.css" rel="stylesheet">

<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

 

<style>

tr:hover{
	
	text-decoration: none;
}
td:hover{
	text-decoration: none;
}

 a:hover { 
 
 font-weight:bold; 
}

.StFont1{

	font-size: 17px;
}

.fontSize{
	font-size: 19px;
}


 td > a {
 font-size : 23px;
 color: #797979;
 padding: 0.4rem 0;
 padding-left : 20px;
 }

 a:hover { font-weight: bold; text-decoration: none;}



.blog-pagination .page-item.active .page-link{
	
		color : rgb(2,2,2);
		background : transparent;
		border-color : #222;
		
	}


table tbody th, table td {
    border-bottom: none;
    font-size : 20px;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

 .nav-tabs .nav-link.active {
	color: #007BFF;
}

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
 
  #collectBtn{
 
 	height : 35px;
 	margin-left: 6px;
 	border-top-left-radius: 5px;
 	border-top-right-radius: 5px;
 	border-bottom-left-radius: 5px;
 	border-bottom-right-radius: 5px;
 	background-color: rgb(2,2,2);
 	color : #fff;
 	border-color: rgb(2,2,2);
 	
 }
 
 #searchHometaxCash{
 	border-top-left-radius: 5px;
 	border-top-right-radius: 5px;
 	border-bottom-left-radius: 5px;
 	border-bottom-right-radius: 5px;
 
 }


 .product-img4{
 	max-width: 20px;
    max-height: 20px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 0px;
 }
 
.product-img5{
 	max-width: 35px;
    max-height: 30px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 6px;
    
 }
 
 .styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}
 
</style>



<script>

	$(document).ready(function(){
		
		
		 
		
		
		
		
	
	})

</script>

<script>

// ???????????? ??????????????? ?????????
function goToTaxBill(formName){
	
	formName.action = "${pageContext.request.contextPath}/taxAgent/taxBill";
	formName.method = "post";
	formName.submit();
	
}

function goToCardForm(formName){
	
	formName.action = "${pageContext.request.contextPath}/taxAgent/cardSealesWriteForm"
	formName.method = "post";
	formName.submit(); 
}

</script>

</head>


<body>
	
	<!--================Header Menu Area =================-->
	<%-- <jsp:include page="/WEB-INF/jsp/include/header.jsp"/> --%>
	<!--================Header Menu Area =================-->




	<div class="header">
            <div class="logo">
                <a href="javascript:void(0)"><img src="${ pageContext.request.contextPath }/resources/img/logo.png" alt="logo" style="width: 214px; height: 80px;"></a>
            </div>
    </div>

	 <div class="wrapper" style="background-color: #ffffff;">
	 
	 	 <div class="nav" style="margin-bottom: 70px; height: 1300px;">

               
                <!--????????????-->
                <div class="memberInfo" style="height: 0px; background-color: #474A5B;">
                    <p class="memberId">
                        <strong>${userVO.name } ????????????,</strong>
                        <br><span style="font-size: 20px;">???????????????!</span>
                    </p>
                    <a class="applyBtn" href="javascript:void(0)" style="width: 170px; height: 39px;"><strong>????????????<i class="fas fa-chevron-right"></i></strong></a>
                </div>

                <!--??????-->
                <ul class="menu" style="margin-bottom: 630px;">
                    <li class="mainMenu" style="margin-top:5px;">
                        <a href="javascript:void(0)"><strong><i class="fas fa-file-signature"></i>?????? ????????????</strong></a>
                        <ul class="subMenu">
                            <li><a href="${ pageContext.request.contextPath }/taxAgent/taxAgentCustomer">-???????????? ??????/??????</a></li>
                        </ul>
                    </li>
                    <li class="mainMenu" style="margin-top: 10px;">
                        <a href="javascript:void(0)"><i class="fas fa-poll"></i><strong> ????????????</strong></a>
                        <ul class="subMenu">
                            <li><a href="javascript:void(0)">-???????????????</a></li>
                            <li><a href="javascript:void(0)">-?????? ???????????? ??????</a></li>
                            <li><a href="javascript:void(0)">-HomeTax ????????????</a></li>
                        </ul>
                    </li>
                    <li class="mainMenu" style="margin-top: 10px;">
                        <a href="javascript:void(0)"><i class="fas fa-clipboard"></i><strong> ????????????</strong></a>
                        <ul class="subMenu">
                            <li><a href="javascript:void(0)">-????????????</a></li>
                            <li><a href="javascript:void(0)">-SMS??????</a></li>
                        </ul>
                    </li>
                    
                    
                    
                </ul>

                

            </div>
	 
	 	 <div class="comment-form-receipt" id="comment-custom-receipt" style="width: 1110px; margin-left: 0px;">
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">??????????????? ??????</h4>
			</div>
			
		</div>
		<div class="container">
			
			
			<section>
					<div class="container" style="margin-left: 36px;">
					
					
						
					
					
						<div class="row" style="margin-top: 30px; margin-right: 0px; margin-left: 0px; margin-bottom: 30px;">
							 	<div style="width: 778px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
									<span style="margin-left: 6px; font-size: 17px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="margin-left: 3px; margin-bottom: 6px;">??????????????? ?????? '???????????? ?????????' ???????????? ??????????????? ????????? ????????? ?????? ????????? ???????????? ??? ????????????.</span>
								</div>
						</div>
						
						<div style="border: 3px solid; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
								<div class="row" style="height: 50px; width: 1050px; ;">
									<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;left: 15px;">?????????????????????</div>
									<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">605-23-55236</div> <!--UserVO??? ????????? ?????? ???  -->
									<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">??????</div>
									<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${summaryVO.storeName}</div>
								</div>
						</div>
						
						
						
						
						<hr>
					
						
						
						
						<div style="margin-top: 20px;">
						<span class="tit"><i class="fas fa-chevron-circle-right" style="font-size: 20px;"></i> <strong style="font-size: 20px;">?????? (????????? ??????)</strong></span>
						<form name="linkSubmit">
						<!-- jstl??????????????? ????????? ??????????????? hidden?????? ????????? --> 
						<input type="hidden" name="storeName" value="${summaryVO.storeName}">
                        <input type="hidden" name="bNo" value="${summaryVO.bNo}">
                        <input type="hidden" name="salesSum" value="${ summaryVO.salesSum}">
                        <input type="hidden" name="purchaseSum" value="${ summaryVO.purchaseSum}">
                        <input type="hidden" name="cashPurchase" value="${ summaryVO.cardPurchase }">
                        <input type="hidden" name="simplePurchase" value="${ summaryVO.simplePurchase}">
                        <input type="hidden" name="taxPurchase" value=" ${ summaryVO.taxPurchase }">
                        <input type="hidden" name="taxBillPurchase" value="${ summaryVO.taxBillPurchase }">
                        <input type="hidden" name="cardPurchase" value=" ${ summaryVO.cashPurchase }">
						
						<table class="table" style="margin-top: 20px; border-top: 3px solid #495057; border-collapse: collapse; border-bottom: 4px solid #495057;">
							
							<colgroup>
                                <col width="14%">
                                <col width="14%">
                                <col width="14%">
                                <col width="14%">
                                <col width="14%">
                                <col width="14%">
                                <col width="14%">
                            </colgroup>
                            <tbody>
                            	
                                <tr>
                                    <td class="alignCenter color" rowspan="2" style="line-height: 4; padding-left:55px; "><strong class="fontSize">??????</strong></td>
                                    <td class="alignCenter" rowspan="2" style="line-height: 4;"><strong class="fontSize"><fmt:formatNumber value="${ summaryVO.salesSum}" pattern="#,###" />???</strong></td>
                                    <td><strong class="StFont1">???????????????</strong></td>
                                    <td><strong class="StFont1">???????????????</strong></td>
                                    <td><strong class="StFont1">???????????????</strong></td>
                                    <td><strong class="StFont1">?????????</strong></td>
                                    <td><strong class="StFont1">???????????????</strong></td>
                                    
                                </tr>
                                <tr>
                                	<!-- ?????? ?????? ????????? -->
                                    <td class="StFont1"><fmt:formatNumber value="${ summaryVO.salesSum}" pattern="#,###" />???</td>
                                    <td class="StFont1">0???</td>
                                    <td class="StFont1">0???</td>
                                    <td class="StFont1">0???</td>
                                    <td class="StFont1">0???</td>
                                </tr>
                                <tr>				
                                    <td class="alignCenter color" rowspan="2" style="line-height: 4; padding-left:55px;" ><strong class="fontSize">??????</strong></td>
                                    <td class="alignCenter" rowspan="2" style="line-height: 4;"><strong class="fontSize"><fmt:formatNumber value="${ summaryVO.purchaseSum}" pattern="#,###" />???</strong></td>
                                    
                                    <td><strong class="StFont1">???????????????</strong></td>
                                    <td><strong class="StFont1">???????????????</strong></td>
                                    <td><strong class="StFont1">???????????????</strong></td>
                                    <td><strong class="StFont1">?????????</strong></td>
                                    <td><strong class="StFont1">???????????????</strong></td>
                                </tr>
                                <tr>
                                	<td class="StFont1"><fmt:formatNumber value="${ summaryVO.cardPurchase }" pattern="#,###" />???</td>
                                	<td class="StFont1"><fmt:formatNumber value="${ summaryVO.taxBillPurchase }" pattern="#,###" />???</td>
                                	<td class="StFont1"><fmt:formatNumber value="${ summaryVO.simplePurchase}" pattern="#,###" />???</td>
                                	<td class="StFont1"><fmt:formatNumber value="${ summaryVO.taxPurchase }" pattern="#,###" />???</td>
                                	<td class="StFont1"><fmt:formatNumber value="${ summaryVO.cashPurchase }" pattern="#,###" />??? </td>
                                </tr>  
                            </tbody>
							
						</table>
						</form>
						</div>
						<hr>					
						<span style="font-weight: bold; font-size: 28px;"><img class="product-img5" src="${ pageContext.request.contextPath }/resources/img/ss3.png" style="margin-left: 3px; margin-bottom: 6px;">????????????</span>
						<table class="styled-table" style="border: 1px solid; border-radius: 5px; width:706px; padding: 0.4rem 0;">
							<tr>
								<th style="padding-left:15px; border-top: 0px solid; background-color: rgba(73, 80, 87,0.14); font-size: 27px;">?????????</th>
							</tr>
							<tr>
								<td><a href="javascript:goToCardForm(linkSubmit)">??? ??????????????????????????? ???????????? ?????????</a></td>
							</tr>
							<tr>
								<td><a href="javascript:goToTaxBill(linkSubmit)">??? ???????????? ????????????????????????</a></td>
							</tr>
							<tr>
								<td><a href="#">??? ???????????? ??????????????????</a></td>
							</tr>
							<tr>
								<td><a href="#">??? ???????????? ????????????????????????</a></td>
							</tr>
							<tr>
								<td><a href="#">??? ???????????? ??????????????????</a></td>
							</tr>
							<tr>
								<td><a href="#">??? ?????? ??? ?????????????????? ???????????????</a></td>
							</tr>
							<tr>
								<td><a href="#">??? ???????????? ?????? ???????????? ?????????</a></td>
							</tr>
							<tr>
								<td><a href="#">??? ??????????????? ??????????????? ?????????</a></td>
							</tr> 
							<tr>
								<td><a href="#">???  ?????????????????????</a></td>
							</tr>
							<tr>
								<td><a href="#">???  ?????????????????? ???????????????</a></td>
							</tr>
							
							
						</table>
						
						<table>
							<tr>
								
							</tr>
						</table>
					
					</div>
					
				
			</section>
		</div>

	</div>
	 
	 
	 
	 
	 
	 </div>







	
	
	
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>