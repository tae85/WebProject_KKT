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

@WebServlet("/fileEdit.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 40
)
public class FileEditCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
//		System.out.println("FileEditCtrl doGet ");
		String no = req.getParameter("no");
		FileBoardDAO dao = new FileBoardDAO();
		FileBoardDTO dto = dao.selectView(no);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/pages/tables/fileEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
//		System.out.println("FileEditCtrl doPost ");
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		String originalFileName = "";
		try {
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		} 
		catch (Exception e) {
			JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
			return;
		}
		
		String no = req.getParameter("no");
		String prevOfile = req.getParameter("prevOfile");
		String prevSfile = req.getParameter("prevSfile");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		FileBoardDTO dto = new FileBoardDTO();
		dto.setNo(Integer.parseInt(no));
		dto.setId(id);
		dto.setTitle(title);
		dto.setContents(contents);
		
		if(originalFileName != "") {
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			
			dto.setOfile(originalFileName);
			dto.setSfile(savedFileName);
			
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		FileBoardDAO dao = new FileBoardDAO();
		int result = dao.updateFile(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("./fileList.do");
		}
		else {
			JSFunction.alertLocation(resp, "게시물 수정에 실패했습니다. fileeditctrl", 
					"./fileList.do");
		}
	}
}






























