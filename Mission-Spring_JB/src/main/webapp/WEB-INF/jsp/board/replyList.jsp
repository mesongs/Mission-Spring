<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<tr>
				<th>번호</th>
				<th>답글</th>
				<th>작성자</th>	
				<th>작성일자</th>		
			</tr>
			
			<c:forEach items="${ replyList }" var="reply">
				<tr>
					<td>${ reply.no }</td>
					<td>${ reply.content }</td>
					<td>${ reply.writer }</td>
					<td>${ reply.regDate }</td>
				</tr>
			</c:forEach>