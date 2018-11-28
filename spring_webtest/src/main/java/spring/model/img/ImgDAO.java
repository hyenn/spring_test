package spring.model.img;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class ImgDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	
	public boolean CheckRefnum(int no){
		boolean flag = false;
		
		int cnt = mybatis.selectOne("img.CheckRefnum", no);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public String getimg(int no) {
				
		return mybatis.selectOne("img.getimg", no);
	}
	
	public List imgRead(int no){
		
		List list = new ArrayList();
		Map map = mybatis.selectOne("img.imgRead", no);
		
		int[] noArr = {
				((BigDecimal)map.get("PRE_NO2")).intValue(),
				((BigDecimal)map.get("PRE_NO1")).intValue(),
				((BigDecimal)map.get("NO")).intValue(),
				((BigDecimal)map.get("NEX_NO1")).intValue(),
				((BigDecimal)map.get("NEX_NO2")).intValue()
							};
		
		String[] files = {
				(String)map.get("PRE_FILE2"),
				(String)map.get("PRE_FILE1"),
				(String)map.get("IMG"),
				(String)map.get("NEX_FILE1"),
				(String)map.get("NEX_FILE2")
							};
		
		//System.out.println(map.get("NO"));
		//System.out.println((String)map.get("IMG"));
		
		list.add(noArr);
		list.add(files);
		
		return list;
		}
		
		
	public boolean create(ImgDTO dto) {
		boolean f=false;

		int cnt = mybatis.insert("img.create", dto);
		if(cnt>0) f = true;

		return f;
	}

	
	public boolean update(ImgDTO dto) {
		boolean f = false;
		
		int cnt = mybatis.update("img.update", dto);
		if(cnt>0) f = true;

		return f;
	}

	
	public boolean delete(int no) {
		boolean f = false;

		int cnt = mybatis.delete("img.delete", no);
		if(cnt>0) f = true;
		
		return f;

	}

	public List<ImgDTO> list(Map map) {
		
		return mybatis.selectList("img.list", map);
	}
	

	public int total(Map map) {

		return mybatis.selectOne("img.total", map);

	}

	public ImgDTO read(int no) {
		
		return mybatis.selectOne("img.read", no);
	}
	

	public boolean replyCreate(ImgDTO dto) {
		boolean f = false;
		
		int cnt = mybatis.insert("img.replyCreate", dto);
		if(cnt>0) f = true;
		
		return f;
	}

	public ImgDTO replyread(int no) {

		return mybatis.selectOne("img.replyread", no);
	}

	public void upAnsnum(Map map) {
		
		mybatis.update("img.upAnsnum", map);
		
	}

	public void viewcnt(int no) {
			
		mybatis.update("img.viewcnt", no);
	}

	public boolean passcheck(Map<Integer,String> map) {
		
		boolean f = false;
		
		int cnt = mybatis.selectOne("img.passcheck", map);
		if(cnt>0) f = true;

		return f;
	}

}