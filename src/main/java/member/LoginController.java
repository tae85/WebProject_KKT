package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberDAO dao = new MemberDAO();
		
		boolean loginChk  = dao.loginMember(id, pass);
		dao.close();
		
		if(loginChk) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pass", pass);
			
			System.out.println(id + "로그인성공");
			resp.sendRedirect("index.jsp");
		}
		else {
			JSFunction.alertBack(resp, "로그인에 실패했습니다.");
		}
		
	}
}
