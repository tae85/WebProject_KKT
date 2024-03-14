package board.file;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class FileBoardDAO extends DBConnPool {
	public FileBoardDAO() {
		super();
	}
	
	//게시물 전체 개수
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "select count(*) from fileBoard ";
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//게시물 리스트 출력
	public List<FileBoardDTO> selectListPage(Map<String, Object> map) {
		List<FileBoardDTO> board = new Vector<FileBoardDTO>();
		
		String sql = 	" select * from "
					+	"	(select tb.*, rownum rNum from "
					+ 	"		(select * from fileBoard ";
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		sql += " 		order by fileNo desc "
				+ "   ) tb"
				+ " ) "
				+ " where rNum between ? and ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				FileBoardDTO dto = new FileBoardDTO();
				dto.setNo(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContents(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDowncount(rs.getInt(9));
				
				board.add(dto);
			}
		} 
		catch (Exception e) {
			System.out.println("자유게시판 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	public FileBoardDTO selectView(String no) {
		FileBoardDTO dto = new FileBoardDTO();
		
		String sql = "select * from fileBoard where fileNo = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContents(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDowncount(rs.getInt(9));
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String no) {
		String sql = "update fileBoard set fileVisitcount = fileVisitcount + 1 where fileNo = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.executeQuery();
		} 
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int insertFile(FileBoardDTO dto) {
		int result = 0;
		
		try {
			/* 쿼리문의 일련번호는 모델1 게시판에서 생성한 시퀀스를 그대로 사용한다. 나머지 값들은 
			컨트롤러(서블릿)에서 받은 후 모델(DAO)로 전달한다. */
			String sql = "insert into fileBoard "
					+ " (fileNo, id, fileTitle, fileContents, ofile, sfile) "
					+ " values (seq_file_board_num.nextval, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContents());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateFile(FileBoardDTO dto) {
		int result = 0;
		try {
			String sql = "update fileBoard"
					+ " set fileTitle = ?, fileContents = ?, ofile=?, sfile=? "
					+ " where fileNo = ? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContents());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setInt(5, dto.getNo());
			
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteFile(String no) {
		int result = 0;
		try {
			//일련번호에 해당하는 게시물 1개 삭제
			String sql = "delete from fileBoard where fileNo=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, no);
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public void downCountPlus(String no) {
		String sql = "update fileBoard set downcount = downcount + 1 where fileNo = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("다운로드 중 예외발생");
			e.printStackTrace();
		}
	}
}
























































