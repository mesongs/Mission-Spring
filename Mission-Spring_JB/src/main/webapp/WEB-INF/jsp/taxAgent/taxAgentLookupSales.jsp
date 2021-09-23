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
 



.tabMove:hover { color: rgb(2,2,2); font-weight: bold; }
.tabMove { text-decoration: none; }
.tabMove:hover { text-decoration: none;}
.tabMove:active { text-decoration: none; }
.tabMove:link { color: rgb(2,2,2); }
.tabMove:visited { text-decoration: none; }



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
	
	
	
	getSalesRow();
	
	function getSalesRow(){
		
		// select value가져오기
		let selectYear = $('#selectYear').val() 
		let selectOrder = $('#selectOrder').val()
		
		 
			
			
		$.ajax({
			type : "get",
			data : {selectYear : selectYear, selectOrder : selectOrder},
			url : "${pageContext.request.contextPath}/taxAgent/getPurchaseListAjax",
			success : function(result){
				
				
				// receiptKindSumList
				let obj = JSON.parse(result);
				
				
				// 매입유형별 금액 => 세금신고서 작성에 사용되는 값
				for(let i=0; i< obj.receiptKindSumList.length; i++ ){
					
					switch(obj.receiptKindSumList[i].receiptCode) {
						
						case '001':  
						    $('#taxBillPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
						    break;
		
						case '002':  
							$('#taxPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
						    break;
						    
						case '003':
							$('#cardPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
							break;
							    
						case '004':  
							$('#simplePur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
							break;
							    
						case '005':  
							$('#cashPur').html(numberWithCommas(obj.receiptKindSumList[i].receiptKindPurchase)+"원")
							break;
						    
					}
					  
				}
				
				// 색인 purchaseAmountSum purchaseSum purchaseVatSum
				$('#purchaseAmountSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseAmountSum)+"원");
				$('#purchaseVatSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseVatSum)+"원");
				$('#purchaseSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseSum)+"원");
							
				// 집계에 있는 비용 합계에도 동일하게 들어감
				$('#purchaseAllSum').html(numberWithCommas(obj.customerPurchaseVO.purchaseSum)+"원");
				
				let ObjPurchaseList = obj.purchaseList
								
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
		
	}
	
	
	// 조회버튼 눌렀을 때 실행, 세무사가 조회하는 날짜에 해당하는 값 조회
	$('#searchWriteForm').click(function(){
		
		getSalesRow();
		
		
		
		
	})
	
	
	
	
	
})




function summary(formName){
	
		formName.action = "${pageContext.request.contextPath}/taxAgent/taxWriteForm" ;
		formName.method = "post";
		formName.submit();
		
		
	}
	
function goToSales(){
	
	
	$('#salesTab').addClass("active");
	$('#purchaseTab').removeClass("active");
	
	// 수입 탭으로 이동됐고, replace => $.get으로 jsp페이지를 불러오기
	
	
	
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

           
            <div class="nav">

               
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
                            <li id="salesTab"><strong style="font-size:20px;"><a href="javascript:goToSales();" class="tabMove">수입(매출)</a></strong></li>
                            <li class="active" id="purchaseTab"><strong style="font-size:20px;">비용(매입/일반경비)</strong></li>
                            <li><strong style="font-size:20px;"><a href="#" class="tabMove">목록</a></strong></li>
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
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="001" style="margin-left: 10px;">세금계산서</label> 
							<label style="float: left; font-size: 17px; margin-top: 2px;" ><input type="checkbox" name="tblChk" value="002" style="margin-left: 10px;">계산서</label> 
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="003" style="margin-left: 10px;">카드영수증</label> 
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="004" style="margin-left: 10px;">간이영수증</label>
							<label style="float: left; font-size: 17px; margin-top: 2px;"><input type="checkbox" name="tblChk" value="005" style="margin-left: 10px;">현금영수증</label>
                    </div>
                    
                    
                    
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
												<button id="searchWriteForm" name="searchWriteForm" type="button" style="height : 35px; margin-left: 15px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;border-top-right-radius: 5px;border-bottom-right-radius: 5px; font-size: 18px;">조회</button>
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
                                    <col width="12%">
                                    
                                </colgroup>
                                <thead>
                                    <th><input type="checkbox"></th>
                                    <th>매입일시</th>
                                    <th>발급유형</th>
                                    <th>사업자등록번호</th>
                                    <th>상호명</th>
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
											<td></td>
										</tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="sum">
                            <table>
                                <colgroup>
                                    <col width="53%">
                                    <col width="12%">
                                    <col width="12%">
                                    <col width="12%">
                                    
                                </colgroup>
                                
                                <tr>
                                    <td><strong>전체합계</strong></td>
                                    <td id="purchaseAmountSum"></td>
                                    <td id="purchaseVatSum"></td>
                                    <td id="purchaseSum"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
					<p class="paging" style="margin-top: 20px;">
                        <span><i class="fas fa-chevron-left"></i></span>
                        <span>1</span>
                        <span>2</span>
                        <span>3</span>
                        <span>4</span>
                        <span>5</span>
                        <span><i class="fas fa-chevron-right"></i></span>
                    </p>
					
                    
                    
                </div>
				
                
                <div class="account" style="margin-top: 30px;">
                    <span class="tit"><i class="fas fa-chevron-circle-right" style="font-size: 24px;"></i> <strong style="font-size: 24px;">요약 (부가세 포함)</strong></span>
                   <span style="float: right;"><a href="javascript:summary(sendSummary)" class="writeForm" style="font-size: 24px;">신고서 작성<i class="fas fa-chevron-right"></i></a></span>
                    <div class="table">
                        <form name= sendSummary> 
                        <input type="hidden" name="storeName" value="${taxCustomer.storeName}">
                        <input type="hidden" name="bNo" value="${taxCustomer.businessNo}">
                        <input type="hidden" name="salesSum" value="${customerSalesVO.slaesSum}">
                        <input type="hidden" name="purchaseSum" value="${ pusrchaseSumVO.purchaseSum}">
                        <input type="hidden" name="cashPurchase" value="${ cashSum }">
                        <input type="hidden" name="simplePurchase" value="${ simpleSum }">
                        <input type="hidden" name="taxPurchase" value=" ${ taxSum }">
                        <input type="hidden" name="taxBillPurchase" value="${ taxBilSum }">
                        <input type="hidden" name="cardPurchase" value="${cardSum}">
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
                                    <td class="alignCenter" rowspan="2"><strong class="fontSize"><fmt:formatNumber value="${ customerSalesVO.slaesSum}" pattern="#,###" />원</strong></td>
                                    <td><strong class="StFont">카드영수증</strong></td>
                                    <td><strong class="StFont">세금계산서</strong></td>
                                    <td><strong class="StFont">간이영수증</strong></td>
                                    <td><strong class="StFont">계산서</strong></td>
                                    <td><strong class="StFont">현금영수증</strong></td>
                                    
                                </tr>
                                <tr>
                                	<!-- 카드 매출 데이터 -->
                                    <td class="StFont"><fmt:formatNumber value="${ customerSalesVO.slaesSum}" pattern="#,###" />원</td>
                                    <td class="StFont">0</td>
                                    <td class="StFont">0</td>
                                    <td class="StFont">0</td>
                                    <td class="StFont">0</td>
                                </tr>
                                <tr>
                                    <td class="alignCenter color" rowspan="2"><strong class="fontSize">비용</strong></td>
                                    <td class="alignCenter" rowspan="2" id="purchaseAllSum"><strong class="fontSize"></strong></td>
                                    <td><strong class="StFont">카드영수증</strong></td>
                                    <td><strong class="StFont">세금계산서</strong></td>
                                    <td><strong class="StFont">간이영수증</strong></td>
                                    <td><strong class="StFont">계산서</strong></td>
                                    <td><strong class="StFont">현금영수증</strong></td>
                                </tr>
                                <tr>
                                	<td id="cardPur"></td>
                                	<td id="taxBillPur"></td>
                                	<td id="simplePur"></td>
                                	<td id="taxPur"></td>
                                	<td id="cashPur"></td>
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