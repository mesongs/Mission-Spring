<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                
                    <!--탭-->
                    <div class="row">
						<div class="col">
							<h4 style="font-family: 'Noto Sans KR', sans-serif;font-size: xx-large;">담당 고객 목록</h4>
						</div>
					</div>
					
					<div class="container" id="memberList">
						<div class="row" style="margin-top: 30px;">
							<div style="width: 500px; font-size: 20px; background-color: #27b2a5; color:#fff; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; margin-bottom: 30px;">
								<span style="margin-left: 6px;"><img class="product-img4" src="${ pageContext.request.contextPath }/resources/img/gd.png" style="margin-left: 3px; margin-bottom: 6px;">세무사님과 수임계약을 맺고있는 고객님들의 목록입니다.</span>
							</div>
						</div>
						<div class="row" style="margin-bottom: 31px;">
							<div class="box">
							  <div class="container-1">
							      <span class="icon"><i class="fa fa-search"></i></span>
							      <input type="search" id="search" placeholder="검색어 입력" style="padding-top: 7px; background-color: rgba(074,140,138,0.2)" />
							  </div>
							</div>
						</div>
						
		<div class="row">
			
			 	<c:forEach items="${ customerList }" var="customerList">
					
					<div class="col-md-10" style="padding-left: 0px;">
							
							<div class="panel panel-default" style="height: 200px; width:290px; cursor: pointer;" onclick="location.href='${ pageContext.request.contextPath }/taxAgent/taxAccountDetail/${ customerList.businessNo }'">
								<div class="panel-heading">
									 <span class="side-stick"></span>
									<sapn>BNo</sapn>
									<span> : </span>
									<span class="addBold">${ customerList.businessNo }</span>
									<br>
								</div>
									<div class="panel-body" style="font-size: 17px;margin-top: 15px; padding-right: 15px;">
										<span>상호명</span>
									    <sapn> : </sapn>
									    <span class="addBold">${ customerList.storeName }</span><br>
									    <span>고객명</span>
									    <sapn> : </sapn>
									    <span class="addBold">${ customerList.name }</span><br>
									    <span>연락처</span>
									    <sapn> : </sapn>
									    <span class="addBold">${ customerList.phone }</span><br>
									    <span>email</span>
									    <sapn> : </sapn>
									    <span class="addBold">${ customerList.email }</span><br>
									    <div align="right">
									    <span style="float: right: ;"><img src="${ pageContext.request.contextPath }/resources/img/test2.png" style="width: 55px; height: 25px;"></span>
										</div>
									</div>
							</div>
						 	
					</div>
					
				</c:forEach>
			
			</div>
						
						
					</div>
                    

                 

                
                
            
        </div>
    </body>
</html>