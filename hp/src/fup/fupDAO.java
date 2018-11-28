package fup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class fupDAO {
	
	public boolean replyCreate(fupDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into fup ");
		sql.append(" (fno,fname,ftitle,fcontent,fpw, ");
		sql.append(" filename,filesize,fdate,grpno,indent,ansnum,refnum) ");
		sql.append(" values((select nvl(max(fno),0)+1 as fno from fup), ");
		sql.append(" ?,?,?,?,?,?,sysdate, ");
		sql.append(" ?,?,?,?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getFtitle());
			pstmt.setString(3, dto.getFcontent());
			pstmt.setString(4, dto.getFpw());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());
			pstmt.setInt(7, dto.getGrpno());
			pstmt.setInt(8, dto.getIndent()+1);
			pstmt.setInt(9, dto.getAnsnum()+1);
			pstmt.setInt(10, dto.getFno());
			
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
	
	public void upAnsnum(Map map) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update fup ");
		sql.append(" set ansnum = ansnum + 1 ");
		sql.append(" where grpno = ? and ansnum > ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
	}
	
	public fupDTO replyRead(int fno) {
		fupDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select fno,ftitle,grpno,indent,ansnum");
		sql.append(" from fup ");
		sql.append(" where fno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, fno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new fupDTO();
				
				dto.setFno(rs.getInt("fno"));
				dto.setFtitle(rs.getString("ftitle"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	
	public boolean checkRefnum(int fno) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum) ");
		sql.append(" from fup ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, fno);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			int cnt = rs.getInt(1);
			
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
	
	public boolean delete(int fno) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from fup ");
		sql.append(" where fno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, fno);
			
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
	
	public boolean pwCh(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int fno = (Integer)map.get("fno");
		String fpw = (String)map.get("fpw");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(fno) as cnt ");
		sql.append(" from fup ");
		sql.append(" where fno = ? and fpw = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, fno);
			pstmt.setString(2, fpw);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			int cnt = rs.getInt("cnt");
			
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
	
	public boolean update(fupDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update fup ");
		sql.append(" set ftitle=?,fcontent=? ");
		
		if(dto.getFilesize()>0) {
			sql.append(" ,filename=?, ");
			sql.append(" filesize=? ");
		}
		sql.append(" where fno=? ");
		
		try {
			int i = 0;
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++i, dto.getFtitle());
			pstmt.setString(++i, dto.getFcontent());
			
			if(dto.getFilesize()>0) {
				pstmt.setString(++i, dto.getFilename());
				pstmt.setInt(++i, dto.getFilesize());
			}
			
			pstmt.setInt(++i, dto.getFno());
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
	
	public int total(Map map) {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from fup ");
		
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");
		
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
	
	public void upView(int fno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update fup ");
		sql.append(" set viewcnt = viewcnt+1 ");
		sql.append(" where fno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, fno);
			
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
	}
	
	public fupDTO read(int fno) {
		fupDTO dto = new fupDTO();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select fno,fname,ftitle,fcontent,viewcnt, ");
		sql.append(" filename,filesize,to_char(fdate,'yyyy-mm-dd') as fdate ");
		sql.append(" from fup ");
		sql.append(" where fno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, fno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setFno(rs.getInt("fno"));
				dto.setFname(rs.getString("fname"));
				dto.setFtitle(rs.getString("ftitle"));
				dto.setFcontent(rs.getString("fcontent"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
				dto.setFdate(rs.getString("fdate"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	
	public List<fupDTO> list(Map map){
		List<fupDTO> list = new ArrayList();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select fno,fname,ftitle,filename,viewcnt, ");
		sql.append(" 	fdate,grpno,indent,ansnum,r	 ");
		sql.append(" from( ");
		sql.append(" 	select fno,fname,ftitle,filename,viewcnt, ");
		sql.append(" 		fdate,grpno,indent,ansnum, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select fno,fname,ftitle,filename,viewcnt, ");
		sql.append(" 		to_char(fdate,'yyyy-mm-dd') as fdate,grpno,indent,ansnum ");
		sql.append(" 		from fup ");
				
		if(word.trim().length()>0)
			sql.append("    where "+col+" like '%'||?||'%' ");
		
		sql.append(" 		order by grpno desc, ansnum ");
		sql.append(" 		 ) ");
		sql.append(" 	 )where r>=? and r<=? ");
		
		int i = 0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fupDTO dto = new fupDTO();
				
				dto.setFno(rs.getInt("fno"));
				dto.setFname(rs.getString("fname"));
				dto.setFtitle(rs.getString("ftitle"));
				dto.setFilename(rs.getString("filename"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setFdate(rs.getString("fdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
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
	
	
	public boolean create(fupDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into fup ");
		sql.append(" (fno,fname,ftitle,fcontent,fpw, ");
		sql.append(" filename,filesize,fdate,grpno) ");
		sql.append(" values((select nvl(max(fno),0)+1 as fno from fup), ");
		sql.append(" ?,?,?,?,?,?,sysdate, ");
		sql.append(" (select nvl(max(grpno),0)+1 as grpno from fup)) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getFtitle());
			pstmt.setString(3, dto.getFcontent());
			pstmt.setString(4, dto.getFpw());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());
		
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
