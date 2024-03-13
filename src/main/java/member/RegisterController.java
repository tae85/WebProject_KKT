package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/register.do")
public class RegisterController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		System.out.println("Ctrl - 회원가입 진입");
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("pass"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.registerMember(dto);
		dao.close();
		
		if(result == 1) {
			System.out.println("Ctrl - 회원가입성공");
			resp.sendRedirect("index.jsp");
		}
		else {
			JSFunction.alertLocation(resp, "회원가입에 실패했습니다.", "index.jsp");
		}
	}
}
