<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
$(document).ready(function(){
	
	
	
	$('#writeForm').click(function(){
	
		
		alert('클릭')
		
		let bNo = ${taxCustomer.businessNo};
		let storeName = '${taxCustomer.storeName}';
		location.href = '${ pageContext.request.contextPath }/taxAgent/taxWriteForm?bNo='+ bNo + "&storeName=" + storeName ;
		
		//location.href="search.jsp?type="+type+"&type2=type"+type2;

		
		
	})
})



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
                        <strong>${userVO.id } 세무사님,</strong>
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
                    <div class="listMenu">
                     <ul>
                            <li class="active"><strong style="font-size:20px;">수입(매출)</strong></li>
                            <li><strong style="font-size:20px;"><a href="#">비용(매입/일반경비)</a></strong></li>
                            <li><strong style="font-size:20px;"><a href="#">목록</a></strong></li>
                     </ul>
                        
                    </div>
                    
                    <div style="border: 3px solid; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
						<div class="row" style="height: 50px; width: 1050px; ;">
							<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;left: 15px;">사업자등록번호</div>
							<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">605-23-55236</div> <!--UserVO가 가지고 있는 값  -->
							<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">상호</div>
							<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${taxCustomer.storeName}</div>
						</div>
					</div>

                    <!--조건설정영역-->
                    <div class="condition">
                        <select>
                            <option>조회일</option>
                        </select>
                        <select>
                            <option>거래처 선택</option>
                        </select>
                        <select>
                            <option>상세조회조건</option>
                        </select>
                        <select>
                            <option>오픈마켓,PG,배달</option>
                        </select>
                    </div>

                    <!--데이터영역-->
                    <div class="table">
                        <div>
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
                                    <col width="11%">
                                </colgroup>
                                <thead>
                                    <th><input type="checkbox"></th>
                                    <th>날짜</th>
                                    <th>거래처</th>
                                    <th>품목(내용)</th>
                                    <th class="alignRight">공급가액</th>
                                    <th class="alignRight">부가세</th>
                                    <th class="alignRight">합계</th>
                                    <th class="alignRight">카드 수수료</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                       
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                       
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2019-09-01</td>
                                        <td>카드(매출)</td>
                                        <td>카드(5)</td>
                                        <td class="alignRight">581,182</td>
                                        <td class="alignRight">58,182</td>
                                        <td class="alignRight">640,000</td>
                                        <td class="alignRight">0</td>
                                       
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
                                    <col width="12%">
                                    <col width="11%">
                                </colgroup>
                                <tr>
                                    <td><strong>부분합계</strong></td>
                                    <td class="alignRight">5,031,841</td>
                                    <td class="alignRight">503,186</td>
                                    <td class="alignRight">5,535,000</td>
                                    <td class="alignRight">0</td>
                                </tr>
                                <tr>
                                    <td><strong>전체합계</strong></td>
                                    <td class="alignRight">5,031,841</td>
                                    <td class="alignRight">503,186</td>
                                    <td class="alignRight">5,535,000</td>
                                    <td class="alignRight">0</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
				
                
                <div class="account" style="margin-top: 30px;">
                    <span class="tit"><i class="fas fa-chevron-circle-right" style="font-size: 24px;"></i> <strong style="font-size: 24px;">요약 (부가세 포함)</strong></span>
                    <span style="float: right;"><button id="writeForm" class="writeForm" style="font-size: 24px;" type="submit">신고서 작성<i class="fas fa-chevron-right"></i></button></span>
                    <div class="table">
                        <table>
                            <colgroup>
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
                                    <td class="alignCenter" rowspan="2"><strong class="fontSize">7,711,000</strong></td>
                                    <td><strong class="StFont">카드</strong></td>
                                    <td><strong class="StFont">현금영수증</strong></td>
                                    <td><strong class="StFont">현금</strong></td>
                                    <td><strong class="StFont">세금계산서</strong></td>
                                    
                                </tr>
                                <tr>
                                    <td class="StFont">7,711,00</td>
                                    <td class="StFont">0</td>
                                    <td class="StFont">0</td>
                                    <td class="StFont">0</td>
                                    
                                </tr>
                                <tr>
                                    <td class="alignCenter color" rowspan="2"><strong class="fontSize">비용</strong></td>
                                    <td class="alignCenter" rowspan="2"><strong class="fontSize">6,611,000</strong></td>
                                    <td><strong class="StFont">카드</strong></td>
                                    <td><strong class="StFont">현금영수증</strong></td>
                                    <td><strong class="StFont">현금</strong></td>
                                    <td><strong class="StFont">세금계산서</strong></td>
                                    
                                </tr>
                                <tr>
                                    <td>7,711,00</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>