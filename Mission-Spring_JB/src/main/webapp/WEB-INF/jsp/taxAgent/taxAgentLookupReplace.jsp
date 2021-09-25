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



					
                    <!--조건설정영역-->
                    
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
                                    <td><strong style="font-size: 23px;">전체합계</strong></td>
                                    <td id="purchaseAmountSum"></td>
                                    <td id="purchaseVatSum"></td>
                                    <td id="purchaseSum"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    
                    <div id="salesPageCount">
					
					</div>
					</section>
              
				
                
                
           
        
    </body>
</html>