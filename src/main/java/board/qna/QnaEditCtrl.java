package board.qna;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/qnaEdit.do")
public class QnaEditCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
//		System.out.println("QnaEditCtrl doGet ");
		String no = req.getParameter("no");
		QnaBoardDAO dao = new QnaBoardDAO();
		QnaBoardDTO dto = dao.selectView(no);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/tables/qnaEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
//		System.out.println("qnaEditCtrl doPost ");
		String no = req.getParameter("no");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		QnaBoardDTO dto = new QnaBoardDTO();
		dto.setNo(Integer.parseInt(no));
		dto.setId(id);
		dto.setTitle(title);
		dto.setContents(contents);
		
		QnaBoardDAO dao = new QnaBoardDAO();
		int result = dao.updateQna(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("./qnaList.do");
		}
		else {
			JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.", "./qnaList.do");
		}
	}
}



















