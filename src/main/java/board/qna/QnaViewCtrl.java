package board.qna;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/qnaView.do")
public class QnaViewCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		QnaBoardDAO dao = new QnaBoardDAO();		
		String no = req.getParameter("no");
//		System.out.println("QnaViewCtrl 진입1"+ no);
		
		dao.updateVisitCount(no);
		
		QnaBoardDTO dto = dao.selectView(no);
		dao.close();
		
		//textarea태그에서는 하면 안 됨.
//		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
//		System.out.println("QnaViewCtrl out : "+ dto.getNo());
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/tables/qnaView.jsp").forward(req, resp);
	}
}
