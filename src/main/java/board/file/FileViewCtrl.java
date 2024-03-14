package board.file;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fileView.do")
public class FileViewCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		FileBoardDAO dao = new FileBoardDAO();		
		String no = req.getParameter("no");
//		System.out.println("fileViewCtrl 진입1"+ no);
		
		dao.updateVisitCount(no);
		
		FileBoardDTO dto = dao.selectView(no);
		dao.close();
		
		//textarea태그에서는 하면 안 됨.
//		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
		
		String fileName = dto.getSfile();
		req.setAttribute("fileName", fileName);
		
		String ext = null;
		if(fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		}
		String [] extImg = {"png", "jpg", "gif", "jpeg", "tif"};
		String [] extVideo = {"mp4", "avi", "mov", "wmv", "mpeg"};
		String [] extAudio = {"mp3", "wav", "wma", "ogg"};
		List<String> imgList = Arrays.asList(extImg);
		List<String> videoList = Arrays.asList(extVideo);
		List<String> audioList = Arrays.asList(extAudio);
		String whatExt = "";
		if(imgList.contains(ext)) {
			whatExt = "img";
		}
		else if (videoList.contains(ext)) {
			whatExt = "video";
		}
		else if (audioList.contains(ext)) {
			whatExt = "audio";
		}
		else {
			whatExt = "etc";
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("whatExt", whatExt);
//		System.out.println("fileViewCtrl out : "+ dto.getNo());
		req.getRequestDispatcher("/pages/tables/fileView.jsp").forward(req, resp);
	}
}

























