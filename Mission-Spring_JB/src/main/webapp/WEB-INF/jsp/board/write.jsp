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


<script>

	


</script>

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
			
			<%-- <form action="${ pageContext.request.contextPath }/board/write" method="post">--%>			
			<!-- 어떨 때 생략이 가능하다고?.. 현재 들어와있는 url이 /board/write임 이곳으로 그대로 post로 보냄 -->
			<form method="post">
				<table border="1" style="width: 80%">
					<tr>
						<th width="25%">제목</th>
						<td><input type="text" size="60" name="title"></td>
					</tr>
					<tr>
						<th width="25%">작성자</th>
						<td><input type="text" size="60" name="writer"></td>
					</tr>
					<tr>
						<th width="25%">내용</th>
						<td><textarea rows="8" cols="60" name="content"></textarea></td>
					</tr>
					
				</table>
				<br>
				<input type="submit" value="등록"> 
				<input id=goListBtn type="button" value="목록">
			</form>
		</div>




	</section>
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp"%> --%>
	</footer>













</body>
</html>