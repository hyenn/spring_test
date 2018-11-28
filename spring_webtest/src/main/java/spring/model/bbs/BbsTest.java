package spring.model.bbs;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BbsTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		BbsDAO dao = (BbsDAO)factory.getBean("dao");
		
		//create(dao);
		//update(dao);
		//read(dao);
		//delete(dao);
		list(dao);
		//replyCreate(dao);
		//replyRead(dao);
		//passCheck(dao);
		//upViewcnt(dao);
		//total(dao);
		//checkRefnum(dao);
		
	}


	private static void checkRefnum(BbsDAO dao) {
		if(dao.checkRefnum(1)) {
			p("답변글 존재");
		}else {
			p("답변글 없음");
		}
		
	}


	private static void total(BbsDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "11");
		
		int tot = dao.total(map);
		
		p("전체 갯수: " + tot);
		
	}


	private static void upViewcnt(BbsDAO dao) {
		dao.upViewcnt(1);
		
	}


	private static void passCheck(BbsDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("passwd", "123");
		
		if(dao.passCheck(map)) {
			p("일치");
		}else {
			p("불일치");
		}
	}


	private static void replyRead(BbsDAO dao) {
		p(dao.replyRead(8));
	}

	private static void replyCreate(BbsDAO dao) {
		BbsDTO dto = dao.replyRead(1);
		
		dto.setWname("name");
		dto.setTitle("title");
		dto.setContent("123");
		dto.setPasswd("123");
		dto.setFilename("test11.txt");
		dto.setFilesize(22);
		
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

	private static void list(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<BbsDTO>list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			BbsDTO dto = list.get(i);
			
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void delete(BbsDAO dao) {
		
			if(dao.delete(1)) {
				p("삭제");
			}else {
				p("실패");
			}
		}

	private static void read(BbsDAO dao) {
		p(dao.read(1));
		
	}

	private static void p(BbsDTO dto) {
		
		p("번호: " + dto.getBbsno());
		p("이름: " + dto.getWname());
		p("제목: " + dto.getTitle());
		p("내용: " + dto.getContent());
		p("날짜: " + dto.getWdate());
		p("조회수: " + dto.getViewcnt());
		p("파일이름: " + dto.getFilename());
		p("파일크기: " + dto.getFilesize());

	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		
		dto.setWname("홍길동");
		dto.setTitle("기억");
		dto.setContent("ㅇㅇ");
		dto.setFilename("test.txt");
		dto.setFilesize(20);
		dto.setBbsno(13);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		
		dto.setWname("아로미");
		dto.setTitle("ㅋㅋㅋ");
		dto.setContent("122");
		dto.setPasswd("123");
		dto.setFilename("0919.txt");
		dto.setFilesize(20);
		
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
