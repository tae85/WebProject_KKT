package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.CookieManager;
import utils.JSFunction;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("pages/samples/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String cookieLoginChk = req.getParameter("cookieCheck");
		System.out.println("cookieLoginChk : " + cookieLoginChk);
		MemberDAO dao = new MemberDAO();
		
		boolean loginChk  = dao.loginMember(id, pass);
		dao.close();
		
		if(loginChk) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pass", pass);
			System.out.println(id + " : " + pass + "로그인성공");
			
			if(cookieLoginChk != null) {
				System.out.println("cookieLoginChk");
				CookieManager.makeCookie(resp, "cookieLogin", id, 86400);
//				Cookie cookie = new Cookie("cookieLogin", id);
//				
//				cookie.setPath(req.getContextPath());
//				
//				//24시간
//				cookie.setMaxAge(86400);
//				resp.addCookie(cookie);
			}
			
			
//			req.getRequestDispatcher("./index.do").forward(req, resp);
			resp.sendRedirect("./index.jsp");
		}
		else {
			JSFunction.alertBack(resp, "로그인에 실패했습니다.");
		}
		
	}
}
