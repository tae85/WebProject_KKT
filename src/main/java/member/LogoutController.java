package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.CookieManager;

@WebServlet("/logout.do")
public class LogoutController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("로그아웃 두겟");
		
		CookieManager.deleteCookie(resp, "cookieLogin");
		req.getSession().removeAttribute("id");
//		req.getRequestDispatcher("./index.do").forward(req, resp);
		resp.sendRedirect("./index.jsp");
	}
}
