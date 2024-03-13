package board.free;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/freeView.do")
public class FreeViewCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("FreeViewCtrl 진입");
		
		FreeBoardDAO dao = new FreeBoardDAO();		
		String no = req.getParameter("no");
		
		dao.updateVisitCount(no);
		
		FreeBoardDTO dto = dao.selectView(no);
		dao.close();
		
		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/tables/freeView.jsp").forward(req, resp);
	}
}
