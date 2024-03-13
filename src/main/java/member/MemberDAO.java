package member;

import java.util.Map;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {
	public MemberDAO () {
		super();
	}
	
	public boolean loginMember(String id, String pass) {
		boolean loginChk = false;
		String sql = "select count(*) from member where id=? and pass=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1) != 0) {
				loginChk = true;
			}
		} 
		catch (Exception e) {
			System.out.println("로그인 시도 중 예외 발생");
			e.printStackTrace();
		}
		
		return loginChk;
	}
	
	public int registerMember(MemberDTO dto) {
		int result = 0;
		
		try {
			String sql = "insert into member (id, pass, name, email) "
						+ " values (?, ?, ?, ?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			result = psmt.executeUpdate();
			System.out.println("DAO - 회원가입성공" + result);
		} 
		catch (Exception e) {
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int reviseMember(MemberDTO dto, String prevPass) {
		int result = 0;
		
		try {
			String sql = "update member "
					+ "    set pass=?, name=?, email=? "
					+ "    where id=? and pass=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getId());
			psmt.setString(5, prevPass);
			result = psmt.executeUpdate();
			System.out.println("DAO - 정보 수정 성공");
		} 
		catch (Exception e) {
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public MemberDTO selectMember(String id) {
		MemberDTO dto = new MemberDTO();
		
		String sql = "select * from member where id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setRegidate(rs.getDate(5));
			}
		} 
		catch (Exception e) {
			System.out.println("회원 정보 수정 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
}






























