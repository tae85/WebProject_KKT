package board.qna;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/qnaDelete.do")
public class QnaDeleteCtrl extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("QnaDeleteCtrl doPost ");
		String no = req.getParameter("no");
		QnaBoardDAO dao = new QnaBoardDAO();
		int result = dao.deleteQna(no);
		
		if(result == 1) {
			JSFunction.alertLocation(resp, "삭제되었습니다.", "qnaList.do");
		}
		else {
			JSFunction.alertLocation(resp, "삭제에 실패했습니다.", "qnaList.do");
		}
	}
}
