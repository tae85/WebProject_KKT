package board.qna;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class QnaBoardDAO extends DBConnPool {
	public QnaBoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "select count(*) from qnaBoard ";
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
	
	public List<QnaBoardDTO> selectListPage(Map<String, Object> map) {
		List<QnaBoardDTO> board = new Vector<QnaBoardDTO>();
		
		String sql = 	" select * from "
					+	"	(select tb.*, rownum rNum from "
					+ 	"		(select * from qnaBoard ";
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		sql += " 		order by qnaNo desc "
				+ "   ) tb"
				+ " ) "
				+ " where rNum between ? and ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				QnaBoardDTO dto = new QnaBoardDTO();
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
	
	public QnaBoardDTO selectView(String no) {
		QnaBoardDTO dto = new QnaBoardDTO();
		
		String sql = "select * from qnaBoard where qnaNo = ?";
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
		String sql = "update qnaBoard set qnaVisitcount = qnaVisitcount + 1 where qnaNo = ?";
		
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
	
	public int insertQna(QnaBoardDTO dto) {
		int result = 0;
		
		try {
			/* 쿼리문의 일련번호는 모델1 게시판에서 생성한 시퀀스를 그대로 사용한다. 나머지 값들은 
			컨트롤러(서블릿)에서 받은 후 모델(DAO)로 전달한다. */
			String sql = "insert into qnaBoard "
					+ " (qnaNo, id, qnaTitle, qnaContents) "
					+ " values (seq_qna_board_num.nextval, ?, ?, ?)";
			
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
	
	public int updateQna(QnaBoardDTO dto) {
		int result = 0;
		try {
			String sql = "update qnaBoard"
					+ " set qnaTitle = ?, qnaContents = ? "
					+ " where qnaNo = ? ";
			
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
	
	public int deleteQna(String no) {
		int result = 0;
		try {
			//일련번호에 해당하는 게시물 1개 삭제
			String sql = "delete from qnaBoard where qnaNo=?";
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
