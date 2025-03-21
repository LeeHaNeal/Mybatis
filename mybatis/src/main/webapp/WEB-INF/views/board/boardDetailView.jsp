<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
    #detail-area {
        border: 1px solid;
        border-collapse: collapse;
        width: 80%;
        margin: 0 auto;
    }
    #detail-area tr, #detail-area th, #detail-area td {
        border: 1px solid;
        padding: 8px;
    }
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="outer">
        <h2>게시판 상세보기</h2>
        
        <table id="detail-area">
            <tr>
                <td>글번호</td>
                <td>${board.boardNo}</td>
            </tr>
            <tr>
                <td>제목</td>
                <td>${board.boardTitle}</td>
            </tr>
            <tr>
                <td>작성자</td>
                <td>${board.boardWriter}</td>
            </tr>
            <tr>
                <td>조회수</td>
                <td>${board.count}</td>
            </tr>
            <tr>
                <td>작성일</td>
                <td>${board.createDate}</td>
            </tr>
            <tr>
                <td>내용</td>
                <td>${board.boardContent}</td>
            </tr>
        </table>
        
        
    </div>
</body>
</html>
