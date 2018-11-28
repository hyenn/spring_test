package spring.model.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BreplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybayis(SqlSessionTemplate mybayis) {
		this.mybatis = mybayis;
	}
	
	
	public boolean delete(int num) {
		boolean flag = false;
		
		int cnt = mybatis.delete("breply.delete", num);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public boolean bdelete(int num) {
		boolean flag = false;
		
		int cnt = mybatis.delete("breply.bdelete", num);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public boolean update(BreplyDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.update("breply.update", dto);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	
	public int total(int num) {
		return mybatis.selectOne("breply.total", num);
	}
	
	public List<BreplyDTO> list(Map map){
		return mybatis.selectList("breply.list", map);
	}
	
	public boolean create(BreplyDTO dto) {
		
		boolean flag = false;
		
		int cnt = mybatis.insert("breply.create", dto);
		if(cnt>0) flag = true;
		
		return flag;
	}

}
