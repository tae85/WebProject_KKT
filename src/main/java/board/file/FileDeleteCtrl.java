package board.file;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/fileDelete.do")
public class FileDeleteCtrl extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("FileDeleteCtrl doPost ");
		String no = req.getParameter("no");
		FileBoardDAO dao = new FileBoardDAO();
		FileBoardDTO dto = dao.selectView(no);
		
		
		int result = dao.deleteFile(no);
		
		if(result == 1) {
			String saveFileName = dto.getSfile();
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
			JSFunction.alertLocation(resp, "삭제되었습니다.", "./fileList.do");
		}
		else {
			JSFunction.alertLocation(resp, "삭제에 실패했습니다.", "./fileList.do");
		}
	}
}
