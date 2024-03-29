package board.free;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class FreeBoardDAO extends DBConnPool {
	public FreeBoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "select count(*) from freeBoard ";
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
	
	public List<FreeBoardDTO> selectListPage(Map<String, Object> map) {
		List<FreeBoardDTO> board = new Vector<FreeBoardDTO>();
		
		String sql = 	" select * from "
					+	"	(select tb.*, rownum rNum from "
					+ 	"		(select * from freeBoard ";
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		sql += " 		order by no desc "
				+ "   ) tb"
				+ " ) "
				+ " where rNum between ? and ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				dto.setNo(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContents(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				
				board.add(dto);
			}
		} 
		catch (Exception e) {
			System.out.println("자유게시판 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	public FreeBoardDTO selectView(String no) {
		FreeBoardDTO dto = new FreeBoardDTO();
		
		String sql = "select * from freeBoard where no = ?";
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
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String no) {
		String sql = "update freeBoard set visitcount = visitcount + 1 where no = ?";
		
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
	
	public int insertFree(FreeBoardDTO dto) {
		int result = 0;
		
		try {
			/* 쿼리문의 일련번호는 모델1 게시판에서 생성한 시퀀스를 그대로 사용한다. 나머지 값들은 
			컨트롤러(서블릿)에서 받은 후 모델(DAO)로 전달한다. */
			String sql = "insert into freeBoard "
					+ " (no, id, title, contents) "
					+ " values (seq_free_board_num.nextval, ?, ?, ?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContents());
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateFree(FreeBoardDTO dto) {
		int result = 0;
		try {
			String sql = "update freeBoard"
					+ " set title = ?, contents = ? "
					+ " where no = ? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContents());
			psmt.setInt(3, dto.getNo());
			
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteFree(String no) {
		int result = 0;
		try {
			//일련번호에 해당하는 게시물 1개 삭제
			String sql = "delete from freeBoard where no=?";
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
}
