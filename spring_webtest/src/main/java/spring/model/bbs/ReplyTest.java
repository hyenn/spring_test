package spring.model.bbs;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReplyTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		ReplyDAO dao = (ReplyDAO)factory.getBean("reply");
		
		//create(dao);
		//update(dao);
		//read(dao);
		//delete(dao);
		//bdelete(dao);
		list(dao);
		//total(dao);
		
	}

	private static void bdelete(ReplyDAO dao) {
		
		if(dao.bdelete(8)) {
			p("전체 삭제");
		}else {
			p("전체 삭제 실패");
		}
		
	}

	private static void total(ReplyDAO dao) {
		
		int tot = dao.total(8);
		
		p("전체 갯수: " + tot);
		
	}


	private static void list(ReplyDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 8);
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<ReplyDTO>list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			ReplyDTO dto = list.get(i);
			
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void delete(ReplyDAO dao) {
		
			if(dao.delete(3)) {
				p("삭제");
			}else {
				p("실패");
			}
		}

	private static void read(ReplyDAO dao) {
		p(dao.read(1));
		
	}

	private static void p(ReplyDTO dto) {
		
		p("번호: " + dto.getRnum());
		p("내용: " + dto.getContent());
		p("날짜: " + dto.getRegdate());
		p("아이디: " + dto.getId());
		p("부모글번호: " + dto.getBbsno());

	}

	private static void update(ReplyDAO dao) {
		ReplyDTO dto = new ReplyDTO();
		
		dto.setContent("ㅇㅇ");
		dto.setRnum(2);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(ReplyDAO dao) {
		ReplyDTO dto = new ReplyDTO();
		
		dto.setContent("122");
		dto.setId("aaa");
		dto.setBbsno(8);
		
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
