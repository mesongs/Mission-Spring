<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--표현식이나 자바코드 사용안하고!! el방식으로 가져옴! pageContext가 가진 request로 -->
	<a href="${ pageContext.request.contextPath }/board">게시글</a>
</body>
</html>