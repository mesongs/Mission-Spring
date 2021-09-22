<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?after">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/reset2.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/main2.css" rel="stylesheet">


<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>

<style>

	.panel{
 	margin-bottom : 20px;
 	border-radius : 4px;
 	box-shadow : 0px 1px 3px 2px rgb(0 0 0 / 11%);
 }
 
 .panel-body{
 	
 	padding-left: 15px;
    padding-bottom: 14px;
    font-size: 18px;
 	
 
 }
 
 .panel-default > .panel-heading{
	
	background-color : rgba(39, 178, 127,0.4);
	border-color : #ddd;
	
	
	}

 .panel-heading{
 	font-weight :bold;
 	color : #3a414e;
 	font-size: 18px;
    letter-spacing: 0.025em;
    height: 50px;
 	padding : 10px 15px;
 	border-top-left-radius:3px;
 	border-top-right-radius:3px;
 }


	.product-img4{
 	max-width: 20px;
    max-height: 20px;
    margin-left : 18px;
    margin-top : 3px;
    margin-right: 0px;
 }

  .panel-default:hover {
    width:300px;
    transform:scale(1.1);
    transition: transform.5s;
    }
	
	.blog-pagination .page-item.active .page-link{
	
		color : rgb(2,2,2);
		background : transparent;
		border-color : #222;
		
	}

 	 a:link { color: #3a414e; text-decoration: none;}

	.container-1{
  width: 300px;
  vertical-align: middle;
  white-space: nowrap;
  position: relative;
}
.container-1 .icon{
  position: absolute;
  top: 50%;
  margin-left: 17px;
  margin-top: 17px;
  z-index: 1;
  color: #4f5b66;
}

.container-1 input#search{
  width: 228px;
  height: 50px;
  background: #E9EDF1;
  border: none;
  font-size: 13pt;
  float: left;
  color: #63717f;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}


.container-1 input#search::-webkit-input-placeholder {
   color: #65737e;
}
 
.container-1 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}
 
.container-1 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}
 
.container-1 input#search:-ms-input-placeholder {  
   color: #65737e;  
}

.container-1 input#search:hover, .container-1 input#search:focus, .container-1 input#search:active{
    outline:none;
    background: #E9EDF1;
  }
  
.container-1 input#search{
  width: 228px;
  height: 50px;
  background: #E9EDF1;
  border: none;
  font-size: 13pt;
  float: left;
  color: #E9EDF1;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
 
   
    -webkit-transition: background .55s ease;
  -moz-transition: background .55s ease;
  -ms-transition: background .55s ease;
  -o-transition: background .55s ease;
  transition: background .55s ease;
}

.side-stick {
     position: absolute;
     width: 5px;
     height: 48px;
     top:0;
     left: 0;
     background-color: rgba(074,140,138,0.6); 
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







</head>


<body>
	
	<!--================Header Menu Area =================-->
	<%-- <jsp:include page="/WEB-INF/jsp/include/header.jsp"/> --%>
	<!--================Header Menu Area =================-->
	<!--헤더-->
        <div class="header">
            <div class="logo">
                <a href="javascript:void(0)"><img src="${ pageContext.request.contextPath }/resources/img/logo.png" alt="logo" style="width: 214px; height: 80px;"></a>
            </div>
        </div>
	
	<div class="wrapper" style="background-color: #ffffff;">
	<div class="nav" style="margin-bottom: 70px; height: 770px;">

               
                <!--회원정보-->
                <div class="memberInfo" style="height: 0px; background-color: #474A5B;">
                    <p class="memberId">
                        <strong>${userVO.id } 세무사님,</strong>
                        <br><span style="font-size: 20px;">환영합니다!</span>
                    </p>
                    <a class="applyBtn" href="javascript:void(0)" style="width: 170px; height: 39px;"><strong>로그아웃<i class="fas fa-chevron-right"></i></strong></a>
                </div>

                <!--메뉴-->
                <ul class="menu" style="margin-bottom: 140px;">
                    <li class="mainMenu" style="margin-top:20px;">
                        <a href="javascript:void(0)"><strong><i class="fas fa-file-signature"></i>고객 증빙자료</strong></a>
                        <ul class="subMenu">
                            <li><a href="${ pageContext.request.contextPath }/taxAgent/taxAgentCustomer">-증빙자료 조회/수집</a></li>
                            
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
	
	
	
	
	<div class="comment-form-receipt" id="comment-custom-receipt" style="width: 1110px;margin-left: 0px;margin-bottom: 0px;margin-top: 0px;">
		<div class="row">
			<div class="col">
				<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large; margin-left: 32px;">세금신고서 작성</h4>
			</div>
			
		</div>
		<div class="container">
			
			
			<section>
					<div class="container" style="margin-left: 36px;">
					
					
						
					
					
						<div class="row" style="margin-top: 30px; margin-right: 0px; margin-left: 0px; margin-bottom: 30px;">
							 	<div style="width: 778px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
									<span style="margin-left: 6px; font-size: 17px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="margin-left: 3px; margin-bottom: 6px;">담당하시고 계신 '간편장부 대상자' 고객님의 부가가치세 신고에 필요한 증빙 자료를 조회하실 수 있습니다.</span>
								</div>
						</div>
						
						<div style="border: 3px solid; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; ">
								<div class="row" style="height: 50px; width: 1050px; ;">
									<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;left: 15px;">사업자등록번호</div>
									<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${bNo}</div> <!--UserVO가 가지고 있는 값  -->
									<div class="col-2" style="background-color: rgba(130,139,178,0.25); width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">상호</div>
									<div class="col-4" style="width: 20%; text-align:center; display:table-cell; vertical-align:middle; line-height:50px;font-size: 20px;">${storeName}</div>
								</div>
						</div>
						
						
						
					
						<div class="row" style="margin-top: 30px;">
							 		<div class="col-7" style="float: left; width: 496px">
							 			<span style="float: left; font-weight: bold; color: rgb(2,2,2); margin-bottom: 10px; margin-top:3px; font-size: 17px; ">조회기간 설정</span>
							 			
							 			<select name="selectYear" id="selectYear" style="margin-left: 15px; float: left; width: 100px; margin-bottom: 20px; color:#495057; height: 35px;">
												<option value="2019">2019년</option>
												<option value="2020">2020년</option>
												<option value="2021" selected="selected">2021년</option>
										</select>
										<select name="selectOrder" id="selectOrder" style="margin-left: 15px; float: left; width: 100px; margin-bottom: 20px; color:#495057; height: 35px;">
												<option value="1" selected="selected">1기</option>
												<option value="2">2기</option>
										</select>
							 			<span style="float: left">
												<button id="searchWriteForm" name="searchWriteForm" type="button" style="height : 35px; margin-left: 15px; border-top-left-radius: 5px;border-bottom-left-radius: 5px;border-top-right-radius: 5px;border-bottom-right-radius: 5px;">조회</button>
										</span>
							 		</div>
						</div>
						
						<form name="linkSubmit">
						<table>
							<!-- hidden 으로 보내도 되니까 -->
							<tr>
								<th rowspan="2"><input type="text" class="form-control" name="test" id="test" style="float: left; width: 200px;">수입 </th>
								<th rowspan="2">7,711,000원</th>
								<th style="border-top: none;">카드</th>
								<th>현금영수증</th>
								<th>현금</th>
								<th>세금계산서</th>
							</tr>
							<tr>
								<th>매입(비용)</th>
								<td>234,000원</td>
								
							</tr>
							
						</table>
						</form>
						<hr>					
						<span style="font-weight: bold; font-size: 25px;"><img class="product-img5" src="${ pageContext.request.contextPath }/resources/img/ss3.png" style="margin-left: 3px; margin-bottom: 6px; width: 27px;">작성서류</span>
						<table class="styled-table" style="border: 1px solid; border-radius: 5px; width:706px;">
							<tr>
								<th style="border-top: 0px solid; background-color: rgba(73, 80, 87,0.14); font-size: 22px;">서식명</th>
							</tr>
							<tr>
								<td><a href="${ pageContext.request.contextPath }/taxAgent/cardSealesWriteForm">신용카드매출전표등 발행금액 집계표</a></td>
							</tr>
							<tr>
								<td><a href="javascript:goToTaxBill(linkSubmit)">매입처별 세금계산서합계표</a></td>
							</tr>
							<tr>
								<td><a href="${ pageContext.request.contextPath }/taxAgent/taxBillVatZero">매입처별 계산서합계표</a></td>
							</tr>
							<tr>
								<td><a href="#">매출처별 세금계산서합계표</a></td>
							</tr>
							<tr>
								<td><a href="#">매출처별 계산서합계표</a></td>
							</tr>
							<tr>
								<td><a href="#">건물 등 감가상각자산 취득명세서</a></td>
							</tr>
							<tr>
								<td><a href="#">공제받지 못할 매입세액 명세서</a></td>
							</tr>
							<tr>
								<td><a href="#">일반과세자 부가가치세 신고서</a></td>
							</tr> 
							<tr>
								<td><a href="#">현금매출명세서</a></td>
							</tr>
							<tr>
								<td><a href="#">의제매입세액 공제신고서</a></td>
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
	
	
	
	
	
	<!-- Modal -->
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<%-- <jsp:include page="/WEB-INF/jsp/include/footer.jsp"/> --%>
	<!--================ End Footer Area =================-->


</body>
</html>