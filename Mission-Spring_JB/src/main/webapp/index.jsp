<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"/>
<style>

#mainImage {
	width: 900px;
	margin-top: 30px;
}

.cardMenu {
	border: 3px solid;
	border-color: rgba(130, 139, 178, 0.5);
	width: 250px;
	height: 241px
}

.cardMenu>a img {
	width: 70%;
}
</style>

</head>

<body>
	<!--================Header Menu Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
	<!--================Header Menu Area =================-->

	<main class="site-main">

		<!--================Hero Banner start =================-->
		<section class="mb-30px">
			<div class="container" align="center">
				<img id="mainImage" src="${ pageContext.request.contextPath }/resources/img/indexMain2.png">
			</div>
		</section>

		<!--================Hero Banner end =================-->

		<!--================ Start Blog Post Area =================-->

		<section>
			<div class="container" align="center" class="cardMenuCon">
				<div class="row">
					<div class="col">
						<div class="single-recent-blog-post card-view">
							<div class="cardMenu">
								<a href="#"> <img src="${ pageContext.request.contextPath }/resources/img/money.png"style="margin-top: -13px">
								</a>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-recent-blog-post card-view">
							<div class="cardMenu">
								<a href="#"> <img src="${ pageContext.request.contextPath }/resources/img/financial2.png"
									style="margin-top: -8px">
								</a>


							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-recent-blog-post card-view">
							<div class="cardMenu">
								<a href="#"> <img src="${ pageContext.request.contextPath }/resources/img/receipt.png"
									style="margin-top: 13px;">
								</a>


							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-recent-blog-post card-view">
							<div class="cardMenu">
								<a href="#"> <img src="${ pageContext.request.contextPath }/resources/img/counsel.png"
									style="margin-top: -8px"">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!--================ Start Footer Area =================-->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	<!--================ End Footer Area =================-->


</body>
</html>