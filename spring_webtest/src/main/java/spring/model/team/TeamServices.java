package spring.model.team;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.db.webtest.DBClose;
import spring.db.webtest.DBOpen;


@Service
public class TeamServices {

	@Autowired
	private TeamDAO dao;
	
	
		public boolean reply(TeamDTO dto) {
			boolean flag = false;
			
			Map map = new HashMap();
			map.put("grpno", dto.getGrpno());
			map.put("ansnum", dto.getAnsnum());
			
			try {
				
				dao.upAnsnum(map);
				
				flag = dao.replyCreate(dto);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				
			}
		
		   return flag;		
	}

}
