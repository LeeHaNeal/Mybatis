package com.mybatis.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.mybatis.board.service.BoardService;
import com.mybatis.board.service.BoardServiceImpl;
import com.mybatis.board.vo.Board;
import com.mybatis.board.vo.Reply;

@WebServlet("/boardDetail")  // URL 매핑 추가
public class BoardDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    BoardService bService = new BoardServiceImpl();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int boardNo = Integer.parseInt(request.getParameter("bno"));

        // 조회수 증가 시키기
        int result = bService.increaseCount(boardNo);

        // 조회수 증가가 잘 되었으면 검색하여 boardDetailView.jsp로 가져가기
        if (result > 0) {
            Board b = bService.selectBoard(boardNo);
            ArrayList<Reply> list = bService.selectReplyList(boardNo);

            request.setAttribute("b", b);
            request.setAttribute("reply", list);

            request.getRequestDispatcher("WEB-INF/views/board/boardDetailView.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "상세조회 실패");
            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
        }
    }

    // 댓글 작성 기능은 doPost로 변경
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reply r = new Reply();
        r.setRefBoardNo(Integer.parseInt(request.getParameter("bno")));
        r.setReplyWriter(request.getParameter("writer"));
        r.setReplyContent(request.getParameter("content"));

        int result = bService.replyInsert(r);

        // 성공 여부에 따른 처리
        if (result > 0) {
            response.sendRedirect("boardDetail?bno=" + r.getRefBoardNo()); // 성공 시 상세페이지로 이동
        } else {
            request.setAttribute("errorMsg", "댓글 작성 실패");
            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
        }
    }
}
