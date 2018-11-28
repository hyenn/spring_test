package spring.model.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//트랜잭션 처리
@Service
public class BoardMgr {

	//dao에 해쉬코드가 들어와서 객체생성을 위해 DAO에 @Repository필요
	@Autowired
	private BoardDAO dao;
	
	
	public boolean reply(BoardDTO dto) {
		boolean flag = false;
		
		Map map = new HashMap();
		map.put("ref", dto.getRef());
		map.put("ansnum", dto.getAnsnum());
		
		try {
			
			dao.upAnsnum(map);
			flag = dao.createRe(dto);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
		}
	
		return flag;
	}
}
