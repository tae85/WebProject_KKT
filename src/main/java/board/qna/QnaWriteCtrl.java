package board.qna;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/qnaWrite.do")
public class QnaWriteCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("/pages/tables/qnaWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("QnaWriteCtrl doPost ");
		
		QnaBoardDTO dto = new QnaBoardDTO();
		dto.setId(req.getParameter("id"));
		dto.setTitle(req.getParameter("title"));
		dto.setContents(req.getParameter("contents"));
		
		QnaBoardDAO dao = new QnaBoardDAO();
		int result = dao.insertQna(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("qnaList.do");
		}
		else {
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "qnaWrite.do");
		}
	}
}
