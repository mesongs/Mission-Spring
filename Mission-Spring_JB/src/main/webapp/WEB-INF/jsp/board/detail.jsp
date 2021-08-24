<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	 
	 
	$(document).ready(function(){
		
		// replyList, 게시글 상세 들어오면, 댓글 리스트 먼저 출력
		replyList()
		
		
		function replyList(){
			
			//해당 게시글의 댓글을 호출하는 ajax
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/board/replyList/${ board.no }",
				
				success : function(data){
					
					//console.log(data)
					// 받아온 html data를 바로 삽입
					$('#replyList').html(data)
					
				}
				
				
			})
			
			
		}
		
		// 댓글 등록 버튼, 댓글 insert
		$('#btnReply').click(function(){
			
			var content = $('#content').val()
			var writer = $('#writer').val()
			var boardNo = ${board.no};
			
			var param = "content=" + content + "&boardNo=" + boardNo+ "&writer=" + writer
			
			$.ajax({
				async: false, // ajax를 호출하여 서버에서 응답을 기다렸다가, 응답을 모두 완료한 후 다음 로직을 실행
				type : "post",
				data : param,
				url : "${pageContext.request.contextPath}/board/reply",
				
				succsess: function(data){
					//replyList() //성공한 경우, ajax 함수 실행해야하는데
					console.log(data)
					alert('성공')
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			})
			
			replyList()
		})
		
	function clickBtn(type) {
			switch(type) {
			case 'U' : 
				
				break
			case 'D' : 
				location.href = "${ pageContext.request.contextPath }/board/delete/${ board.no }"
				break
			case 'L' :
				location.href = "${ pageContext.request.contextPath }/board"
				break

			}
		}	
		
		
	})
</script>


</head>
<body>
	<header>
		<%-- <jsp:include page="/jsp/include/topMenu.jsp" /> --%>
	</header>
	<section>
		<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<th width="25%">번호</th>
				<td><c:out value="${ board.no }"/></td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><c:out value="${ board.title }" /></td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>${ board.content }</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
			
		</table>
		<br>
		<button onclick="clickBtn('U')">수정</button>
		<button onclick="clickBtn('D')">삭제</button>
		<button onclick="clickBtn('L')">목록</button>
	</div>
	<div align="center">
	<hr>
		댓글 : <input type="text" id="content" name="content" />
		작성자 : <input type="text" id="writer" name="writer" />
		<button id="btnReply" >댓글등록</button>
	<hr>
	</div>
	<div align="center" style="width: 100%;">
		<table id=replyList>
		
		</table>
	</div>
	
	</section>
	
	
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>
</body>
</html>