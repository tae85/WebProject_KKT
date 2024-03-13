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
		String query = "select count(*) from freeBoard ";
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
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
		
		String query = 	" select * from "
					+	"	(select tb.*, rownum rNum from "
					+ 	"		(select * from freeBoard ";
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		query += " 		order by no desc "
				+ "   ) tb"
				+ " ) "
				+ " where rNum between ? and ?";
		
		try {
			psmt = con.prepareStatement(query);
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
		
		String query = "select * from freeBoard where no = ?";
		try {
			psmt = con.prepareStatement(query);
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
}
