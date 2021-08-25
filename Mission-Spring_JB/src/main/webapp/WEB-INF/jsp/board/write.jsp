<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">


<style>

	.error{
		color: red;
	}


</style>

</head>
<body>

	<header>
		<%-- <jsp:include page="/jsp/include/topMenu.jsp" /> --%>
		<!-- action include  -->
	</header>
	<section>

		<div align="center">
			<hr width="80%">
			<h2>게시글 등록폼</h2>
			<hr width="80%">
			<br>
			<!--get과 post가 동일하니까, action을 쓸 필요없음, 스프링4 이전에는 modelAttribute가 commnad name? 이었음 -->
			<form:form method="post" modelAttribute="boardVO">
				<table border="1" style="width: 100%;">
					<tr>
						<th width="25%">제목</th>
						<td>
							<!--boarVO에 등록된 객체의 getTitle(), setTitle() path -->
							<!--path 이것으로 사용자가 이미 입력했던 정보를 get으로 불러옴 -->
							<form:input path="title" />
							<form:errors path="title" class="error" />
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<form:input path="writer" />
							<form:errors path="writer" class="error" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<form:textarea rows="8" cols="60" path="content" />
							<form:errors path="content" class="error" />
						</td>
					</tr>
				</table>
				<br>
				<form:button>등록</form:button>
			</form:form>
			
		</div>




	</section>
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp"%> --%>
	</footer>













</body>
</html>