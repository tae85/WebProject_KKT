package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/revise.do")
public class ReviseController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String id = (String) req.getSession().getAttribute("id");
		
		System.out.println("ReviseController doGet = " + id);
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.selectMember(id);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/samples/revise.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String pass = (String) req.getSession().getAttribute("pass");
		
		System.out.println("ReviseController doGet = " + pass);
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("pass"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.reviseMember(dto, pass);
		dao.close();
		
		if(result == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("pass", req.getParameter("pass"));
			System.out.println("Ctrl - 정보 수정 성공");
			resp.sendRedirect("./index.jsp");
		}
		else {
			JSFunction.alertLocation(resp, "회원가입에 실패했습니다.", "./index.jsp");
		}
		
	}
}
