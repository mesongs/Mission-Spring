<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<hr>
	${ userVO }<br>
	${ sessionScope.userVO }<br>
	<hr>

	<!--표현식이나 자바코드 사용안하고!! el방식으로 가져옴! pageContext가 가진 request로 -->
	<a href="${ pageContext.request.contextPath }/board">게시글</a><br>
	<!-- GET 방식으로 보내는 것  -->
	<a href="${ pageContext.request.contextPath }/board/write">새글등록</a><br>
	
	<c:if test="${empty userVO }">
		<a href="${ pageContext.request.contextPath }/login">로그인</a><br>
	</c:if>
	<c:if test="${not empty userVO }">
		<a href="${ pageContext.request.contextPath }/logout">로그아웃</a><br>
	</c:if>
	


</body>
</html>