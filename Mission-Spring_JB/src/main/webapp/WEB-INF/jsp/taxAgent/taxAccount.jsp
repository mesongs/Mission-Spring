<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/list.css?after">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">



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
	
	background-color : #E9EDF1;
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
     background-color: rgba(82, 95, 127, .5);
     
 }
</style>  


<script>

	$(document).ready(function(){
	
		
		 
		
		
		
		
		
	})
	
	getBusinessList();
		
		function getBusinessList(){
			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/receipt/processedAllList",
				success : function(result){
					
					let obj = JSON.parse(result);
					
			 		 $('#test').empty();
			 		 
					 if(obj.length >= 1){
						 
						 // for(receipt vo(=searchWaitList) : receiptList) 1.5버전 for문과 동일함
						 obj.forEach(function(processedList){
							 	 
							 	 str="<tr>"
							 	 str += "<td>" + '<input type="checkbox" class="testBox">' + "</td>" 
							     str += "<td>" + processedList.receiptDate + "</td>"
							     str += "<td>" + processedList.receiptName + "</td>"
							     str += "<td><a href=" + "${ pageContext.request.contextPath }" +"/receipt/detail/" + processedList.receiptNo + ">" + processedList.storeName +"</a></td>"; 
							     str += "<td>" + processedList.sum +"원</td>";
							     str += "<td>" + processedList.purpose +"</td>";
							     
							     if(processedList.overlap == 'Y'){
				 					
							    	 str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.png">' + "</td>"
							     }else{
				 					
							    	 str += "<td>" + "</td>"
				 				 }
				 				 
							     /* str += "<td>" + '<img class="product-img2" src="${ pageContext.request.contextPath }/resources/img/overlap.jpg">' + "</td>" */
							     /* str +="<td>" + processedList.overlap + "</td>" */
							     
			 					 str += "<td>" + processedList.memo +"</td>";
			 					 str += "</tr>"
			 					 $('#test').append(str);
			 					 
			 					 
			 					 
			 					 
			 					 // 받아온 overlap값이 'Y'이면, 경고 이미지 띄우기
			 					 // 'N'이면, empty
			 					 
			 					 
			 					 
			 					
						 })
					 }
					
				},
				error:function(request, status, error){
				    alert("code:"+ request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
				
			})
			
		}
	
	
	// ajax로 세무사가 담당하고 있는 회원 리스트를 불러오기
	
	

	
	
	
	
	

</script>



</head>


<body>
	
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->

	<div class="comment-form-receipt" id="comment-custom-receipt" >
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
				      <input type="search" id="search" placeholder="검색어 입력" style="padding-top: 7px;" />
				  </div>
				</div>
			</div>
			
			<div class="row">
			
			 	<c:forEach items="${ customerList }" var="customerList">
					
					<div class="col-md-4" style="padding-left: 0px;">
							
							<div class="panel panel-default" style="height: 200px; cursor: pointer;" onclick="location.href='${ pageContext.request.contextPath }/taxAgent/taxAccountDetail/${ customerList.businessNo }'">
								<div class="panel-heading">
									 <span class="side-stick"></span>
									<sapn>사업장번호</sapn>
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
									    <span style="float: right: ;"><img src="${ pageContext.request.contextPath }/resources/img/env1.png" style="width: 60px;"></span>
										</div>
									</div>
							</div>
						 	
					</div>
					
				</c:forEach>
			
			</div>
			
			
			
			
		</div>

	<div class="row">
              <div class="col-lg-12">
                  <nav class="blog-pagination justify-content-center d-flex">
                      <ul class="pagination">
                          <li class="page-item">
                              <a href="#" class="page-link" aria-label="Previous">
                                  <span aria-hidden="true">
                                      <i class="ti-angle-left"></i>
                                  </span>
                              </a>
                          </li>
                          <li class="page-item active"><a href="#" class="page-link">1</a></li>
                          <li class="page-item"><a href="#" class="page-link">2</a></li>
                          <li class="page-item"><a href="#" class="page-link">3</a></li>
                          <li class="page-item">
                              <a href="#" class="page-link" aria-label="Next">
                                  <span aria-hidden="true">
                                      <i class="ti-angle-right"></i>
                                  </span>
                              </a>
                          </li>
                      </ul>
                  </nav>
              </div>
      </div>
      
	</div>
	
	
	
	
	
	
	<!-- Modal -->
	<jsp:include page="/WEB-INF/jsp/include/modalAlert.jsp"/>
	
	<!--================ End Blog Post Area =================-->

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>