package spring.model.memo;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MemoTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		MemoDAO dao = (MemoDAO)factory.getBean("memo");
		
		//create(dao);
		//update(dao);
		read(dao);
		//delete(dao);
		//list(dao);
		//replyCreate(dao);
		//replyRead(dao);
		//upViewcnt(dao);
		//total(dao);
		//CheckRefnum(dao);
		
	}


	private static void CheckRefnum(MemoDAO dao) {
		if(dao.CheckRefnum(601)) {
			p("답변글 존재");
		}else {
			p("답변글 없음");
		}
		
	}


	private static void total(MemoDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "ㄴㄴ");
		
		int tot = dao.total(map);
		
		p("전체 갯수: " + tot);
		
	}


	private static void upViewcnt(MemoDAO dao) {
		dao.updateViewcnt(1);
		
	}


	private static void replyRead(MemoDAO dao) {
		p(dao.replyRead(504));
	}

	private static void replyCreate(MemoDAO dao) {
		MemoDTO dto = dao.replyRead(704);
		
		dto.setTitle("title");
		dto.setContent("123");
		
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

	private static void list(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<MemoDTO>list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			MemoDTO dto = list.get(i);
			
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void delete(MemoDAO dao) {
		
			if(dao.delete(1)) {
				p("삭제");
			}else {
				p("실패");
			}
		}

	private static void read(MemoDAO dao) {
		p(dao.read(508));
		
	}

	private static void p(MemoDTO dto) {
		
		p("번호: " + dto.getMemono());
		p("제목: " + dto.getTitle());
		p("내용: " + dto.getContent());
		p("날짜: " + dto.getWdate());
		p("조회수: " + dto.getViewcnt());

	}

	private static void update(MemoDAO dao) {
		MemoDTO dto = new MemoDTO();
		
		dto.setTitle("기억");
		dto.setContent("ㅇㅇ");
		dto.setMemono(504);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(MemoDAO dao) {
		MemoDTO dto = new MemoDTO();
		
		dto.setTitle("ㅋㅋㅋ");
		dto.setContent("122");
		
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
