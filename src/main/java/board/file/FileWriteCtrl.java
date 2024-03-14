package board.file;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/fileWrite.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 40
)
public class FileWriteCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("/pages/tables/fileWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("fileWriteCtrl doPost ");
		
		String saveDirectory = getServletContext().getRealPath("/Uploads");
		
		String originalFileName = "";
		try {
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		} 
		catch (Exception e) {
			e.printStackTrace();
			JSFunction.alertLocation(resp, "파일 업로드 오류입니다.", "write.do");
		}
		
		FileBoardDTO dto = new FileBoardDTO();
		dto.setId(req.getParameter("id"));
		dto.setTitle(req.getParameter("title"));
		dto.setContents(req.getParameter("contents"));
		
		if(originalFileName != "") {
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			
			dto.setOfile(originalFileName);
			dto.setSfile(savedFileName);
		}
		
		FileBoardDAO dao = new FileBoardDAO();
		int result = dao.insertFile(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("fileList.do");
		}
		else {
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "fileWrite.do");
		}
	}
}





















