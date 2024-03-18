package board.free;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/freeWrite.do")
public class FreeWriteCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("/pages/tables/freeWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("FreeWriteCtrl doPost ");
		
		FreeBoardDTO dto = new FreeBoardDTO();
		dto.setId(req.getParameter("id"));
		dto.setTitle(req.getParameter("title"));
		dto.setContents(req.getParameter("contents"));
		
		FreeBoardDAO dao = new FreeBoardDAO();
		int result = dao.insertFree(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("./freeList.do");
		}
		else {
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../../freeWrite.do");
		}
	}
}
