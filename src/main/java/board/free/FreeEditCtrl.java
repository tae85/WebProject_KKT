package board.free;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/freeEdit.do")
public class FreeEditCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
//		System.out.println("FreeEditCtrl doGet ");
		String no = req.getParameter("no");
		FreeBoardDAO dao = new FreeBoardDAO();
		FreeBoardDTO dto = dao.selectView(no);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/tables/freeEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
//		System.out.println("FreeEditCtrl doPost ");
		String no = req.getParameter("no");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		FreeBoardDTO dto = new FreeBoardDTO();
		dto.setNo(Integer.parseInt(no));
		dto.setId(id);
		dto.setTitle(title);
		dto.setContents(contents);
		
		FreeBoardDAO dao = new FreeBoardDAO();
		int result = dao.updateFree(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("freeList.do");
		}
		else {
			JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.", 
					"../../freeList.do");
		}
	}
}



















