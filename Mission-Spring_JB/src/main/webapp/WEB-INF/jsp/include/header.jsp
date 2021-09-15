<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
@import url(http://weloveiconfonts.com/api/?family=entypo);
[class*="entypo-"]:before {font-family: 'entypo', sans-serif;font-size:50px;color:#555;}
html, body {height: 100%;}

.badge-num {
  box-sizing:border-box;
  font-family: 'Trebuchet MS', sans-serif;
  background: #ff0000;
  cursor:default;
  border-radius: 50%;
  color: #fff;
  font-weight:bold;
  font-size: 16px;
  height: 30px;
  line-height:1.55em;
  top:-4px;
  right:-12px;
  border:3px solid #fff;
  position: absolute;
  text-align: center;
  width: 30px;
  box-shadow: 1px 1px 5px rgba(0,0,0, .2);
  animation: pulse 1.5s 1;
}
.badge-num:after {
  content: '';
  position: absolute;
  top:-2px;
  left:-2px;
  border:2px solid rgba(255,0,0,.5);
  opacity:0;
  border-radius: 50%;
  width:100%;
  height:100%;
  animation: sonar 1.5s 1;
}
@keyframes sonar { 
  0% {transform: scale(.9); opacity:1;}
  100% {transform: scale(2);opacity: 0;}
}
@keyframes pulse {
  0% {transform: scale(1);}
  20% {transform: scale(1.4); } 
  50% {transform: scale(.9);} 
  80% {transform: scale(1.2);} 
  100% {transform: scale(1);}
}

</style>        


<script>




</script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css?after">

<header class="header_area">
    
    <div class="main_menu">
      <nav id="nav_custom" class="navbar navbar-expand-lg navbar-light">
        <div class="container box_1620">
          <c:choose>
          	<c:when test="${ userVO.userStatus == 'S'}">
          	  <a class="navbar-brand logo_h" href="${ pageContext.request.contextPath }"><img src="${ pageContext.request.contextPath }/resources/img/empLogo.png" alt="" style="200px; height: 72px;"></a>
          	</c:when>
          	<c:otherwise>
	          <a class="navbar-brand logo_h" href="${ pageContext.request.contextPath }"><img src="${ pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>          		
          	</c:otherwise>
          </c:choose>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav justify-content-center" id="menuContent">
              <!--사용자의 agreement가 'N'일 경우 agreement 실행  -->
              <c:choose>
              	<c:when test="${userVO.userStatus == 'T' }">
              	  <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/taxAgent/taxAccount">고객 증빙자료 조회/수집</a></li>
              	  <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptManager">세금신고서</a>
              	</c:when>
              	<c:when test="${userVO.userStatus == 'S' }">
              	  <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/account/agreement">회원관리</a></li> 
              	<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/receiptManager">증빙 승인/반려</a>
              	</c:when>
              <c:otherwise>
	              <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/account/agreement">계좌관리</a></li> 
	              <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/financial/slaesReport">사업보고서</a></li> 
              </c:otherwise>
              </c:choose>
              
              <c:choose>
              	<c:when test="${userVO.userStatus == 'S'}">
              		<li class="nav-item"><a class="nav-link" href="#">History</a></li> 
              		<li class="nav-item"><a class="nav-link" href="supprotCenter.jsp">고객문의</a>
              	</c:when>
              	<c:when test="${userVO.userStatus == 'T'}">
              		<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/account/agreement">HomeTax</a></li>
              	</c:when>
              	
              	
              	<c:otherwise>
              		<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">증빙관리</a>
	                <li class="nav-item"><a class="nav-link" href="supprotCenter.jsp">지원센터</a>
              	</c:otherwise>
              </c:choose>
              
              <c:choose>
              	<c:when test="${ not empty userVO }">
              	  <li class="nav-select"><a class="nav-link" href="#">마이페이지</a>
	              <li class="nav-select"><a class="nav-link" href="${ pageContext.request.contextPath }/member/logout">로그아웃</a>
              	</c:when>
              	
              	<c:otherwise>
              	  <li class="nav-select"><a class="nav-link" href="${ pageContext.request.contextPath }/member/login">로그인</a>
	              <li class="nav-select"><a class="nav-link" href="${ pageContext.request.contextPath }/member/signUp">회원가입</a> 
              	</c:otherwise>
              </c:choose>
            </ul>
          </div> 
        </div>
      </nav>
    </div>
    
  </header>