<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css?after">

<header class="header_area">
    
    <div class="main_menu">
      <nav id="nav_custom" class="navbar navbar-expand-lg navbar-light">
        <div class="container box_1620">
        
          <a class="navbar-brand logo_h" href="${ pageContext.request.contextPath }"><img src="/Mission-Spring/resources/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav justify-content-center" id="menuContent">
              <!--사용자의 agreement가 'N'일 경우 agreement 실행  -->
              <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/account/agreement">계좌관리</a></li> 
              <li class="nav-item"><a class="nav-link" href="salesReport.jsp">사업보고서</a></li> 
              <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/receipt/processedList">증빙관리</a>
              <li class="nav-item"><a class="nav-link" href="supprotCenter.jsp">지원센터</a>
              <li class="nav-select"><a class="nav-link" href="${ pageContext.request.contextPath }/login">로그인</a>
              <li class="nav-select"><a class="nav-link" href="${ pageContext.request.contextPath }/signUp">회원가입</a>
            </ul>
          </div> 
        </div>
      </nav>
    </div>
    
  </header>