package spring.model.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public boolean chPasswd(Map map) {
		boolean flag = false;
		
		int cnt = mybatis.selectOne("board.chPasswd", map);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public void upAnsnum(Map map) {
		
		mybatis.update("board.upAnsnum", map);
		
	}
	
	public BoardDTO readRe(int num) {
		
		return mybatis.selectOne("board.readRe", num);
		
	}
	
	
	public boolean createRe(BoardDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.insert("board.createRe", dto);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public boolean CkRefnum(int num) {
		boolean flag = false;
		
		int cnt = mybatis.selectOne("board.CkRefnum", num);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public void upviewCnt(int num) {
		mybatis.update("board.upviewCnt", num);
	}
	
	public int total(Map map) {
		
		return mybatis.selectOne("board.total", map);
	}
	
	public List<BoardDTO> list(Map map){
		
		return mybatis.selectList("board.list", map);
	}
	
	public boolean create(BoardDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.insert("board.create", dto);
		if(cnt>0) flag = true;
		             
		return flag;
	}
	
	public boolean update(BoardDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.update("board.update", dto);
		if(cnt>0) flag = true;
		
		return flag; 
	}
	
	public BoardDTO read(int num) {
		
		return mybatis.selectOne("board.read", num);
	}
	
	public boolean delete(int num) {
		boolean flag = false;
		
		int cnt = mybatis.delete("board.delete", num);
		if(cnt>0) flag = true;
		
		return flag;
	}

}
