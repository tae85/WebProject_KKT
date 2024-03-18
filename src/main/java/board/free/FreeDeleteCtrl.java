package board.free;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/freeDelete.do")
public class FreeDeleteCtrl extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("FreeDeleteCtrl doPost ");
		String no = req.getParameter("no");
		FreeBoardDAO dao = new FreeBoardDAO();
		int result = dao.deleteFree(no);
		
		if(result == 1) {
			JSFunction.alertLocation(resp, "삭제되었습니다.", "./freeList.do");
		}
		else {
			JSFunction.alertLocation(resp, "삭제에 실패했습니다.", "./freeList.do");
		}
	}
}
