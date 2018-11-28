package spring.model.team;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class TeamTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		TeamDAO dao = (TeamDAO)factory.getBean("team");
		
		//create(dao);
		//update(dao);
		//read(dao);
		//delete(dao);
		//list(dao);
		replyCreate(dao);
		//replyRead(dao);
		//total(dao);
		//checkRefnum(dao);
		
	}


	private static void checkRefnum(TeamDAO dao) {
		if(dao.checkRefnum(2)) {
			p("답변글 존재");
		}else {
			p("답변글 없음");
		}
		
	}


	private static void total(TeamDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		
		int tot = dao.total(map);
		
		p("전체 갯수: " + tot);
		
	}

	private static void replyRead(TeamDAO dao) {
		p(dao.replyRead(8));
	}

	private static void replyCreate(TeamDAO dao) {
		TeamDTO dto = dao.replyRead(13);
		
		dto.setName("ㅇㅇ");
		dto.setPhone("010-1234-1111");
		dto.setHobby("자기");
		dto.setSkills("Java");
		dto.setGender("여");
		//dto.setZipcode("01111");
		//dto.setAddress("종로");
		//dto.setAddress2("젊음의 거리");
		
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		
		dao.upAnsnum(map);
		
		if(dao.replyCreate(dto)) {
			p("등록");
		}else {
			p("실패");
		}
	
	}

	private static void list(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<TeamDTO>list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			TeamDTO dto = list.get(i);
			
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void delete(TeamDAO dao) {
		
			if(dao.delete(3)) {
				p("삭제");
			}else {
				p("실패");
			}
		}

	private static void read(TeamDAO dao) {
		p(dao.read(8));
		
	}

	private static void p(TeamDTO dto) {
		
		p("번호: " + dto.getNo());
		p("이름: " + dto.getName());
		p("성별: " + dto.getGender());
		p("취미: " + dto.getHobby());
		p("기술: " + dto.getSkills());
		p("연락처: " + dto.getPhone());
		p("grp: " + dto.getGrpno());
		p("indent: " + dto.getIndent());
		p("ansnum: " + dto.getAnsnum());

	}

	private static void update(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		
		dto.setNo(12);
		dto.setPhone("010-9864-3456");
		dto.setHobby("영화");
		dto.setSkills("MVC");
		//dto.setZipcode("00411");
		//dto.setAddress("종로");
		//dto.setAddress2("젊음의 거리");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		
		dto.setName("NN");
		dto.setPhone("010-9864-1111");
		dto.setHobby("독서");
		dto.setSkills("Java");
		dto.setGender("여");
		//dto.setZipcode("01111");
		//dto.setAddress("종로");
		//dto.setAddress2("젊음의 거리");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
