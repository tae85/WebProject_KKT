package board.qna;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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
		
		Cookie viewCookie = null;
		Cookie[] cookies = req.getCookies();
		System.out.println("cookie : " + cookies);
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("qnaBoard|" + no)) {
					System.out.println("cookies[i].getName() : " + cookies[i].getName());
					viewCookie = cookies[i];
					System.out.println("viewCookie : " + viewCookie);
				}
			}
		}
		else {
			System.out.println("cookies 없음");
		}
		
		if(viewCookie == null) {
			System.out.println("viewCookie 없음");
			try {
				Cookie newCookie = new Cookie("qnaBoard|" + no, "OK");
				resp.addCookie(newCookie);
				dao.updateVisitCount(no);
			} 
			catch (Exception e) {
				System.out.println("조회수 중복 체크 중 예외 발생");
				e.printStackTrace();
			}
		}
		else {
			String value=viewCookie.getValue();
			System.out.println("viewCookie : " + value);
		}
		
		QnaBoardDTO dto = dao.selectView(no);
		dao.close();
		
		//textarea태그에서는 하면 안 됨.
//		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
//		System.out.println("QnaViewCtrl out : "+ dto.getNo());
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/tables/qnaView.jsp").forward(req, resp);
	}
}
