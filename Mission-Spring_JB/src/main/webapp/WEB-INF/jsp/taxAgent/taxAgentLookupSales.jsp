<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link href="${ pageContext.request.contextPath }/resources/css/reset2.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/main2.css" rel="stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?after">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">    
    
<script src="${ pageContext.request.contextPath }/resources/vendors/jquery/jquery-3.2.1.min.js"></script>


<style>

th{
background-color: rgb(240,245,243);

}


.tabMove:hover { color: rgb(2,2,2); font-weight: bold; }
.tabMove { text-decoration: none; }
.tabMove:hover { text-decoration: none;}
.tabMove:link { color: rgb(2,2,2); }
.tabMove:visited { text-decoration: none; }

.list .listMenu ul li.active{
	border : 1px solid #dbdbdb;
	border-width : 1px 1px 0 1px;
	border-bottom : 1px solid #fff;
	color : #3A82CE;

}



.writeForm{

	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	background-color: #27b2a5;
	color: #ffffff;
	border : 0px;
}

.StFont{

	font-size: 20px;
}


.fontSize{
	
	font-size: 20px;
}

th{

	font-size: 20px;

}

.active{

color: #3a82ce;
}

</style>


<script>

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 사업자등록번호 '-' 추가
function bizNoFormatter(num, type) {

    var formatNum = '';

    try{

         if (num.length == 10) {

              if (type == 0) {

                   formatNum = num.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-*****');

              } else {

                    formatNum = num.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');

              }

         }

    } catch(e) {

         formatNum = num;

         console.log(e);

    }

    return formatNum;

}

// 날짜 포맷 변경
function YMDFormatter(num){

    if(!num) return "";

    var formatNum = '';



    // 공백제거

    num=num.replace(/\s/gi, "");



    try{

         if(num.length == 8) {

              formatNum = num.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');

         }

    } catch(e) {

         formatNum = num;

         console.log(e);

    }

    return formatNum;

}
	 
</script>

<script>
$(document).ready(function(){
	
	// 발급유형 전체 체크
	$('#allCheck').click(function(){
			
			if($('#allCheck').prop('checked')){
				
				$("input[name=tblChk]").prop('checked',true)
				
			}else{
				
				$("input[name=tblChk]").prop('checked',false)
				
			}
			
	})
	
	function getSalesRow(){
		
		// select value가져오기
		let selectYear = $('#selectYear').val() 
		let selectOrder = $('#selectOrder').val()
		let curPage = 1; //
		$.ajax({
			async: false,
			type : "get",
			data : {selectYear : selectYear, selectOrder : selectOrder, curPage : curPage},
			url : "${pageContext.request.contextPath}/taxAgent/getPurchaseListAjax",
			success : function(result){
				
				$('#hiddenSelectYear').val(selectYear)
				$('#hiddenSelectOrder').val(selectOrder)
				
				let obj = JSON.parse(result);
				
				
				// 매입유형별 금액 => 세금신고서 작성에 사용되는 값
				for(let i=0; i< obj.receiptKindSumList.length; i++ ){
					
					switch(obj.receiptKindSumList[i].receiptCode) {
						
						case '001':  
						    $('#taxBillPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
						    $('#hiddenTaxBillPurchase').val(obj.receiptKindSumList[i].receiptKindPurchase)
						    break;
		
						case '002':  
							$('#taxPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
							$('#hiddenTaxPurchase').val(obj.receiptKindSumList[i].receiptKindPurchase)
						    break;
						    
						case '003':
							$('#cardPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
							$('#hiddenCardPurchase').val(obj.receiptKindSumList[i].receiptKindPurchase)
							break;
							    
						case '004':  
							$('#simplePur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
							$('#hiddenSimplePurchase').val(obj.receiptKindSumList[i].receiptKindPurchase)
							break;
							    
						case '005':  
							$('#cashPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
							$('#hiddenCashPurchase').val(obj.receiptKindSumList[i].receiptKindPurchase)
							break;
					}
					  
				}
				
				$('#purchaseAmountSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseAmountSum)+"원");
				$('#purchaseVatSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseVatSum)+"원");
				$('#purchaseSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseSum)+"원");
				
				
				// 신고서 작성으로 넘어가는 값 hidden으로 되어있는 input에 value
				
				$('#hiddenPurchaseSum').val(obj.customerPurchaseVO.purchaseSum);
				
				
				// 집계에 있는 비용 합계에도 동일하게 들어감
				$('#purchaseAllSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseSum)+"원");
				
				let ObjPurchaseList = obj.purchasePageRowList
				
								
		 		 $('#test').empty();
		 		 
				 if(ObjPurchaseList.length >= 1){
					 
					 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
					 ObjPurchaseList.forEach(function(purchaseList){
						 	 
						 	 
						 	 str="<tr>"
						 	 
						 	 str += "<td>" + '<input type="checkbox">' + "</td>" 
						     str += "<td>" + purchaseList.receiptDate + "</td>"
						     str += "<td>" + purchaseList.receiptCode + "</td>"
						     str += "<td>" + purchaseList.supplierBusinessNo + "</td>"
						     str += "<td>" + purchaseList.storeName + "</td>"
						     str += "<td>" + numberWithCommas(purchaseList.amount) + "원</td>"
						     str += "<td>" + numberWithCommas(purchaseList.vat) + "원</td>"
						     str += "<td>" + numberWithCommas(purchaseList.calSum) + "원</td>"
		 					 str += "</tr>"
		 					 
		 					 $('#test').append(str);
							   
							    
		 					 
					 })
				 }
				
			},
			error:function(request, status, error){
			    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
			
			
			
		})
		
			purchasePageCountStr = "<p class='paging' style='margin-top: 20px;'>"
			purchasePageCountStr += "<span><i class='fas fa-chevron-left'></i></span>"
			purchasePageCountStr += "<span>1</span>"
			purchasePageCountStr += "<span>2</span>"
			purchasePageCountStr += "<span>3</span>"
			purchasePageCountStr += "<span>4</span>"
			purchasePageCountStr += "<span>5</span>"
			purchasePageCountStr += "<span><i class='fas fa-chevron-right'></i></span>"
			purchasePageCountStr += "</p>"
				
		    $('#salesPageCount').append(purchasePageCountStr);
		
	}
	
	
	// 조회버튼 눌렀을 때 실행, 세무사가 조회하는 날짜에 해당하는 값 조회
	// 통합 매입 ajax
	$(document).on("click", "button[name='searchWriteForm']", function(){
		
		getSalesRow();
	})

	
	// 통합 매출 ajax
	$(document).on("click", "button[name='salesListSearch']", function(){
		
		// select value가져오기
		let selectYear = $('#selectYear').val() 
		let selectOrder = $('#selectOrder').val()
		let curPage = 1;
		
		// 세무사가 조회를 눌러야 페이지번호가 뜸
		// total page
		
		
		$.ajax({
			async : false,
			type : "get",
			data : {selectYear : selectYear, selectOrder : selectOrder, curPage : curPage},
			url : "${pageContext.request.contextPath}/taxAgent/getSalesListAjax",
			success : function(result){
				
				

				// receiptKindSumList
				let obj = JSON.parse(result);
				
				// 사용자가 조회한 매출 합계 금액
				$('#salesAmountSum').html(numberWithCommas(obj.customerSaelsVO.salesAmountSum)+"원");
				$('#salesVatSum').html(numberWithCommas(obj.customerSaelsVO.salesVatSum)+"원");
				$('#salesSum').html(numberWithCommas(obj.customerSaelsVO.salesSum)+"원");
				
				//
				$('#hiddenSalesSum').val(obj.customerSaelsVO.salesSum);
				
				// 신고서 작성 시 hidden으로 넘어가는 값
				//salesSum purchaseSum cashPurchase simplePurchase taxPurchase taxBillPurchase cardPurchase
				
				
				// 집계에 있는 수입 합계, 카드영수증 합계에도 동일하게 들어감  
				$('#salesAll').html(numberWithCommas(obj.customerSaelsVO.salesSum)+"원");
				$('#salesCardSum').html(numberWithCommas(obj.customerSaelsVO.salesSum)+"원");

				// 사용자가 조회한 값의 합계 금액을 구해야함
				
				let ObjSalesList = obj.pageRowList
				
				
		 		 $('#test').empty();
		 		 
				 if(ObjSalesList.length >= 1){
					 
					 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
					 ObjSalesList.forEach(function(salesList){
						 
						 	 str="<tr>"
						 	 str += "<td>" + '<input type="checkbox">' + "</td>" 
						     str += "<td>" + YMDFormatter(salesList.dealDate) + "</td>"
						     str += "<td>" + "카드(매출)" + "</td>"
						     str += "<td>" + salesList.approvalNo + "</td>"
						     str += "<td>" + numberWithCommas(salesList.amount) + "원</td>"
						     str += "<td>" + numberWithCommas(salesList.vat) + "원</td>"
						     str += "<td>" + numberWithCommas(salesList.calSum) + "원</td>"
		 					 str += "</tr>"
							 
		 					 $('#test').append(str);
		 					 
		 					 
					 })
				 }
				
			},
			error:function(request, status, error){
			    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
			
		})
		
		pageCountStr = "<p class='paging' style='margin-top: 20px;'>"
	    pageCountStr += "<span><i class='fas fa-chevron-left'></i></span>"
	    pageCountStr += "<span>1</span>"
	    pageCountStr += "<span>2</span>"
	    pageCountStr += "<span>3</span>"
	    pageCountStr += "<span>4</span>"
	    pageCountStr += "<span>5</span>"
	    pageCountStr += "<span><i class='fas fa-chevron-right'></i></span>"
	    pageCountStr += "</p>"
			
	    $('#pageCount').append(pageCountStr);
		
	})
	
})




function summary(formName){
		
		// .val()해서 hidden에 넣은 값이 잘들어가는지 확인하기
	
		formName.action = "${pageContext.request.contextPath}/taxAgent/taxWriteForm" ;
		formName.method = "post";
		formName.submit();
		
		
	}

// 비용(통합 매입 탭으로 이동)
function goToSales(){
	
	// 처음에 '수입' 탭부터 시작
	$('#purchaseTab').addClass("active");
	$('#salesTab').removeClass("active");
	
	$('#salesTabCss').css('color','rgb(2,2,2)');
//	salesTabCss purchaseTabCss  
	$('#purchaseTabCss').css('color','#3a82ce');
	
	$("input[name=tblChk]").prop('checked',false)

	// 수입 탭으로 이동됐고, replace => $.get으로 jsp페이지를 불러오기
	
	$.get("${ pageContext.request.contextPath }/taxAgent/taxAgentPurchaseReplace", function(data){

			$('#replacePurchase').replaceWith(data)
	})
	
	
}
</script>


</head>
    <body>

        <!--헤더-->
        <div class="header">
            <div class="logo">
                <a href="javascript:void(0)"><img src="${ pageContext.request.contextPath }/resources/img/logo.png" alt="logo" style="width: 214px; height: 80px;"></a>
            </div>
        </div>

        <div class="wrapper">

           
            <div class="nav" style="height:980px;">

               
                <!--회원정보-->
                <div class="memberInfo">
                    <p class="memberId">
                        <strong>${userVO.name } 세무사님,</strong>
                        <br><span style="font-size: 20px;">환영합니다!</span>
                    </p>
                    <a class="applyBtn" href="javascript:void(0)"><strong>로그아웃<i class="fas fa-chevron-right"></i></strong></a>
                </div>

                <!--메뉴-->
                <ul class="menu">
                    <li class="mainMenu" style="margin-top:20px;">
                        <a href="javascript:void(0)"><strong><i class="fas fa-file-signature"></i>고객 증빙자료</strong></a>
                        <ul class="subMenu">
                            <li><a href="javascript:void(0)">-증빙자료 조회/수집</a></li>
                            
                        </ul>
                    </li>
                    <li class="mainMenu" style="margin-top: 10px;">
                        <a href="javascript:void(0)"><i class="fas fa-poll"></i><strong> 세무신고</strong></a>
                        <ul class="subMenu">
                            <li><a href="javascript:void(0)">-신고서작성</a></li>
                            <li><a href="javascript:void(0)">-과거 신고내역 조회</a></li>
                            <li><a href="javascript:void(0)">-HomeTax 바로가기</a></li>
                        </ul>
                    </li>
                    <li class="mainMenu" style="margin-top: 10px;">
                        <a href="javascript:void(0)"><i class="fas fa-clipboard"></i><strong> 고객관리</strong></a>
                        <ul class="subMenu">
                            <li><a href="javascript:void(0)">-고객목록</a></li>
                            <li><a href="javascript:void(0)">-SMS발송</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <!--우측컨텐츠-->
            <div class="content">
                <div class="list">
                    <!--탭-->
                    <div class="listMenu" style="margin-bottom: 30px;">
                     <ul>
                            <li class="active" id="salesTab"><strong style="font-size:20px;"><a href="javascript:goToSales();" id="salesTabCss" style="color :#3a82ce">수입(매출)</a></strong></li>
                            <li id="purchaseTab"><strong style="font-size:20px;"><a href="javascript:goToSales();"  style="color: rgb(2,2,2);" id="purchaseTabCss">비용(매입/일반경비)</a></strong></li>
                            <li><strong style="font-size:20px; color: rgb(2,2,2);"><a href="#" style="color: rgb(2,2,2);">목록</a></strong></li>
                     </ul>
                    </div>
                    
                    <div style="border: 3px solid #797979; color:#797979; width:648px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
						<div class="row" style="height: 50px; width: 1050px; ;">
							<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;left: 15px;">사업자등록번호</div>
							<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">605-23-55236</div> <!--UserVO가 가지고 있는 값  -->
							<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">상호</div>
							<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${taxCustomer.storeName}</div>
						</div>
					</div>
					
					
					
					
                    <!--조건설정영역-->
                    <div class="condition" style="margin-top: 20px;">
							<span style="float: left; font-weight: bold; color: rgb(2,2,2); margin-bottom: 10px; font-size: 18px;">발급유형</span>
							<label style="float: left; font-size: 17px; margin-top: 2px; text-decoration: underline; font-weight:600;"><input type="checkbox" name="tblChk" id="allCheck" value="0" style="margin-left: 10px;">전체 선택</label> 
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="001" style="margin-left: 10px;">세금계산서</label> 
							<label style="float: left; font-size: 17px; margin-top: 2px;" ><input type="checkbox" name="tblChk" value="002" style="margin-left: 10px;">계산서</label> 
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="003" style="margin-left: 10px;">카드영수증</label> 
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="004" style="margin-left: 10px;">간이영수증</label>
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="005" style="margin-left: 10px;">현금영수증</label>
                    </div>
                    
                    
                    <section id="replacePurchase">
                    <div class="condition" style="margin-top: 20px; border-top: 0px;">
                    	
                    	
                        <span style="float: left; font-weight: bold; color: rgb(2,2,2); margin-bottom: 10px; margin-top:3px; font-size: 18px; ">조회기간 설정</span>
                        <label style="float: left; font-size: 17px; margin-top: 5px;"><input type="radio" name="searchDateDay" value="1" style="margin-left: 10px;"> 일별</label> 
						<label style="float: left; font-size: 17px; margin-top: 5px;"><input type="radio" name="searchDateDay" value="2" style="margin-left: 10px;"> 월별</label>
						<label style="float: left; font-size: 17px; margin-top: 5px;"><input type="radio" name="searchDateDay" value="2" style="margin-left: 10px;" checked="checked"> 기 수별</label>
                        
                        <select name="selectYear" id="selectYear" style="margin-left: 15px; float: left; width: 100px; color:#495057; height: 35px;">
								<option value="2019">2019년</option>
								<option value="2020">2020년</option>
								<option value="2021" selected="selected">2021년</option>
						</select>
						<select name="selectOrder" id="selectOrder" style="margin-left: 15px; float: left; width: 55px; color:#495057; height: 35px;">
												<option value="1" selected="selected">1기</option>
												<option value="2">2기</option>
						</select>
							 			<span style="float: left">
												<button id="salesListSearch" name="salesListSearch" type="button" style="height : 35px; margin-left: 15px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;border-top-right-radius: 5px;border-bottom-right-radius: 5px; font-size: 18px; font-weight: bold;">조회</button>
										</span>
										<span style="float: right;">
											 <button id="excelDownload" style="height : 35px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;border-top-right-radius: 5px;border-bottom-right-radius: 5px; font-size: 18px; font-weight: bold;"><i class="fas fa-file-excel"></i><span style="margin-left:5px;">Excel 다운로드</span></button>
										</span>
					
                       <%-- <button type="submit" id="excelBtn" style="padding-left: 0px; margin-left: 10px; font-size: 18px;"><img class="product-img" src="${ pageContext.request.contextPath }/resources/img/excel.png" style="margin-top: -5px;">Excel 다운로드</button> --%>
                    </div>
                    
                    <!--데이터영역-->
                    <div class="table" style="margin-top:20px;">
                        <div class="scrollArea">
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="12%">
                                    <col width="12%">
                                    <col width="12%">
                                    <col width="12%">
                                    <col width="12%">
                                    <col width="12%">
                                </colgroup>
                                <thead>
                                    <th><input type="checkbox"></th>
                                    <th>거래날짜</th>
                                    <th>매출유형</th>
                                    <th>승인번호</th>
                                    <th>공급가액</th>
                                    <th>부가세</th>
                                    <th>합계</th>
                                </thead>
                                <tbody id="test">
										<tr>
											<td><input type="checkbox"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="sum">
                            <table>
                                <colgroup>
                                    <col width="41%">
                                    <col width="12%">
                                    <col width="12%">
                                    <col width="12%">
                                </colgroup>
                                
                                <tr>
                                    <td><strong style="font-size: 23px;">전체합계</strong></td>
                                    <td id="salesAmountSum"></td>
                                    <td id="salesVatSum"></td>
                                    <td id="salesSum"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <div id="pageCount">
					
					</div>
					
					</section>
                </div>
				
                
                <div class="account" style="margin-top: 30px;">
                    <span class="tit"><i class="fas fa-chevron-circle-right" style="font-size: 24px;"></i> <strong style="font-size: 24px;">요약 (부가세 포함)</strong></span>
                   <span style="float: right;"><a href="javascript:summary(sendSummary)" class="writeForm" style="font-size: 24px;">신고서 작성<i class="fas fa-chevron-right"></i></a></span>
                    <div class="table">
                        <form name= sendSummary>
                        <input type="hidden" name="storeName" value="${taxCustomer.storeName}">
                        <!-- 사업자번호로 세부적인 세금계산서를 조회해야함  -->
                        <input type="hidden" name="bNo" value="${taxCustomer.businessNo}">
                        
                        <!-- 세무사가 선택한 날짜에 해당하는 값 -->
                        <input type="hidden" id="hiddenSelectYear" name="selectYear">
                        <input type="hidden" id="hiddenSelectOrder" name="selectOrder">
                        
                        <input type="hidden" id="hiddenSalesSum" name="salesSum">
                        <input type="hidden" id="hiddenPurchaseSum" name="purchaseSum" >
                        <input type="hidden" id="hiddenCashPurchase" name="cashPurchase" >
                        <input type="hidden" id="hiddenSimplePurchase" name="simplePurchase">
                        <input type="hidden" id="hiddenTaxPurchase" name="taxPurchase">
                        <input type="hidden" id="hiddenTaxBillPurchase" name="taxBillPurchase">
                        <input type="hidden" id="hiddenCardPurchase" name="cardPurchase">
                        <table>
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
                                    <td class="alignCenter color" rowspan="2"><strong class="fontSize">수입</strong></td>
                                    <td class="alignCenter" rowspan="2" id="salesAll"><strong class="fontSize">0원</strong></td>
                                    <td><strong class="StFont">카드영수증</strong></td>
                                    <td><strong class="StFont">세금계산서</strong></td>
                                    <td><strong class="StFont">간이영수증</strong></td>
                                    <td><strong class="StFont">계산서</strong></td>
                                    <td><strong class="StFont">현금영수증</strong></td>
                                </tr>
                                <tr>
                                	<!-- 카드 매출 데이터 -->
                                    <td class="StFont" id="salesCardSum">0원</td>
                                    <td class="StFont">0원</td>
                                    <td class="StFont">0원</td>
                                    <td class="StFont">0원</td>
                                    <td class="StFont">0원</td>
                                </tr>
                                <tr>
                                    <td class="alignCenter color" rowspan="2"><strong class="fontSize">비용</strong></td>
                                    <td class="alignCenter" rowspan="2" id="purchaseAllSum"><strong class="fontSize">0원</strong></td>
                                    <td><strong class="StFont">카드영수증</strong></td>
                                    <td><strong class="StFont">세금계산서</strong></td>
                                    <td><strong class="StFont">간이영수증</strong></td>
                                    <td><strong class="StFont">계산서</strong></td>
                                    <td><strong class="StFont">현금영수증</strong></td>
                                </tr>
                                <tr>
                                	<td id="cardPur">0원</td>
                                	<td id="taxBillPur">0원</td>
                                	<td id="simplePur">0원</td>
                                	<td id="taxPur">0원</td>
                                	<td id="cashPur">0원</td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                         <!-- <span style="float: right;"><a href="javascript:summary(sendSummary)" class="writeForm" style="font-size: 24px;">신고서 작성<i class="fas fa-chevron-right"></i></a></span> -->
                    </div>						
                </div>
            </div>
        </div>
    </body>
</html>