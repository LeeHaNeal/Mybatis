<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer table {
		border: 1px solid;
		border-collapse: collapse;
	}
	.outer tr, .outer td {
		border: 1px solid;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<h2>게시판 상세보기</h2>
		
		<table align="center">
			<tr>
				<td width="100px;">글번호</td>
				<td width="400px;">${b.boardNo}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${b.boardTitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${b.boardWriter}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${b.count}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${b.createDate}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${b.boardContent}</td>
			</tr>
		</table>
		<br>
		<table align="center">
			<c:choose>
				<c:when test="${loginUser != null}">
					<tr>
						<th width="100">댓글작성</th>
						<th width="400"><textarea cols="53" rows="3" id="content"></textarea></th>
						<th width="100"><button id="replyInsert">등록</button></th>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th width="100">댓글작성</th>
						<th width="400"><textarea cols="53" rows="3" readonly>로그인 후 이용 가능한 서비스입니다</textarea></th>
						<th width="100"><button disabled>등록</button></th>
					</tr>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${rlist.size() > 0}">
					<tr>
						<th colspan="3" style="text-align:center">댓글(${rlist.size()})</th>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="3" style="text-align:center">댓글이 없습니다</th>
					</tr>
				</c:otherwise>
			</c:choose>
			<c:forEach var="r" items="${reply}">
				<tr>
					<td>${r.replyWriter}</td>
					<td>${r.replyContent}</td>
					<td>${r.createDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		$(() => {
			$('#replyInsert').click(function(){
				$.ajax({
					url : 'detail.bo' , 
					data : {
						bno : ${b.boardNo},
						content : $('#content').val(),
						wirter : "${loginUser.userName}"
					},
					type : 'post',
					success : function(result){
						console.log(result)
					},
				})eroor : function(){
					colsole.log("댓글달기 통신 실패");
				}
			})
		})
	</script>
</body>
</html>