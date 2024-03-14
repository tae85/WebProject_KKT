package common;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/index.do")
public class IndexCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("IndexCtrl 진입 ");
		HttpSession session = req.getSession(); 
		
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				String cookieName = cookies[i].getName();
				String cookieValue = cookies[i].getValue();
				if(cookieName.equals("cookieLogin")) {
					session.setAttribute("id", cookieValue);
				}
			}
		}
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
