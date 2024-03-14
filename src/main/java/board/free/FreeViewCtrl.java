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
		
		FreeBoardDAO dao = new FreeBoardDAO();		
		String no = req.getParameter("no");
//		System.out.println("FreeViewCtrl 진입1"+ no);
		
		dao.updateVisitCount(no);
		
		FreeBoardDTO dto = dao.selectView(no);
		dao.close();
		
		//textarea태그에서는 하면 안 됨.
//		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
//		System.out.println("FreeViewCtrl out : "+ dto.getNo());
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/tables/freeView.jsp").forward(req, resp);
	}
}
