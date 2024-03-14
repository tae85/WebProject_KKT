package board.file;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class DownloadController extends HttpServlet{
	//다운로드 링크를 클릭하므로 get방식의 요청 처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//파라미터 받기
		String ofile = req.getParameter("ofile");
		String sfile = req.getParameter("sfile");
		String no = req.getParameter("no");
		
		//파일을 다운로드 한다.
		FileUtil.download(req, resp, "/Uploads", sfile, ofile);
		
		//다운로드 횟수를 증가시킨다. 
		FileBoardDAO dao = new FileBoardDAO();
		dao.downCountPlus(no);
		dao.close();
	}
}
