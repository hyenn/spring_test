package image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class imgDAO {
	
	
	public boolean delete(int no) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from image ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
	
	public boolean pwCheck(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int no = (Integer)map.get("no");
		String pw = (String)map.get("pw");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(no) as no ");
		sql.append(" from image ");
		sql.append(" where no = ? and pw = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			int cnt = rs.getInt("no");
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
	}
	
	public boolean update(imgDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update image ");
		sql.append(" set title=?, content=?, img=? ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImg());
			pstmt.setInt(4, dto.getNo());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
	public List imgRead(int no) {
		
		List list = new ArrayList();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(no,2)     over (order by no) pre_no2,    ");
		sql.append("          lag(no,1)     over (order by no ) pre_no1,   ");
		sql.append("          no,  ");
		sql.append("          lead(no,1)    over (order by no) nex_no1,    ");
		sql.append("          lead(no,2)    over (order by no) nex_no2,    ");
		sql.append("          lag(img,2)  over (order by no) pre_file2,     ");
		sql.append("          lag(img,1)  over (order by no ) pre_file1,  ");
		sql.append("          img,   ");
		sql.append("          lead(img,1) over (order by no) nex_file1,  ");
		sql.append("          lead(img,2) over (order by no) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT no, img   ");
		sql.append("               FROM image ");
		sql.append("               ORDER BY no DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String[] files = { rs.getString("pre_file2"),
						rs.getString("pre_file1"),
						rs.getString("img"),
						rs.getString("nex_file1"),
						rs.getString("nex_file2") };
				
				int[] noArr = { rs.getInt("pre_no2"),
						rs.getInt("pre_no1"),
						rs.getInt("no"),
						rs.getInt("nex_no1"),
						rs.getInt("nex_no2") };
						
				list.add(noArr);
				list.add(files);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return list;	
	}
	
	
	public imgDTO read(int no) {
		imgDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no,title,name,content,img,mdate ");
		sql.append(" from image ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new imgDTO();
				
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
				dto.setMdate(rs.getString("mdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	
	public void upViewcnt(int no) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update image ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
	}
	
	public int total(Map map) {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
				
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from image ");
		
		if(word.trim().length()>0)
			sql.append(" where " + col + " like '%'||?||'%' ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return total;
	}
	
	
	public List<imgDTO> list(Map map){
		
		List<imgDTO> list = new ArrayList<imgDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no,title,name,img,viewcnt,mdate, r ");
		sql.append(" from( ");
		sql.append(" 	select no,title,name,img,viewcnt, ");
		sql.append(" 				mdate, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select no,title,name,img,viewcnt, ");
		sql.append(" 				to_char(mdate,'yyyy-mm-dd')as mdate ");
		sql.append(" 		from image ");
		
		if(word.trim().length()>0)
			sql.append(" 		where "+col+" like '%'||?||'%' ");
		
		sql.append(" 		order by no desc ");
		sql.append(" 	) ");
		sql.append(" ) where r>=? and r<=? ");
		
		int i = 0;
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				imgDTO dto = new imgDTO();
				
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setMdate(rs.getString("mdate"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
	}
	
	
	public boolean create(imgDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into image(no, title, name, content, img, pw, mdate) ");
		sql.append(" values((select nvl(max(no),0)+1 as no from image), ");
		sql.append(" ?,?,?,?,?,sysdate) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImg());
			pstmt.setString(5, dto.getPw());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

}
