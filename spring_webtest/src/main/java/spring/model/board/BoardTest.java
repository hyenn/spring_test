package spring.model.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BoardTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		BoardDAO dao = (BoardDAO)factory.getBean("board");
		
		//create(dao);
		//update(dao);
		//read(dao);
		//delete(dao);
		//list(dao);
		//createRe(dao);
		//readRe(dao);
		//chPasswd(dao);
		//upviewCnt(dao);
		//total(dao);
		ChRefnum(dao);
		
	}


	private static void ChRefnum(BoardDAO dao) {
		if(dao.CkRefnum(2)) {
			p("답변글 존재");
		}else {
			p("답변글 없음");
		}
		
	}


	private static void total(BoardDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "num");
		map.put("word", "11");
		
		int tot = dao.total(map);
		
		p("전체 갯수: " + tot);
		
	}


	private static void upviewCnt(BoardDAO dao) {
		dao.upviewCnt(1);
		
	}


	private static void chPasswd(BoardDAO dao) {
		Map map = new HashMap();
		map.put("num", 1);
		map.put("passwd", "23");
		
		if(dao.chPasswd(map)) {
			p("일치");
		}else {
			p("불일치");
		}
	}


	private static void readRe(BoardDAO dao) {
		p(dao.readRe(6));
	}

	private static void createRe(BoardDAO dao) {
		BoardDTO dto = dao.readRe(1);
		
		dto.setName("999");
		dto.setContent("df");
		dto.setPasswd("123");
		dto.setIp("127.0.0.1");
		dto.setFilename("test11.txt");
		dto.setFilesize(22);
		dto.setRef(1);
		
		Map map = new HashMap();
		map.put("ref", dto.getRef());
		map.put("ansnum", dto.getAnsnum());
		
		dao.upAnsnum(map);
		
		if(dao.createRe(dto)) {
			p("등록");
		}else {
			p("실패");
		}
	
	}

	private static void list(BoardDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<BoardDTO>list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			BoardDTO dto = list.get(i);
			
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void delete(BoardDAO dao) {
		
			if(dao.delete(1)) {
				p("삭제");
			}else {
				p("실패");
			}
		}

	private static void read(BoardDAO dao) {
		p(dao.read(1));
		
	}

	private static void p(BoardDTO dto) {
		
		p("번호: " + dto.getNum());
		p("이름: " + dto.getName());
		p("제목: " + dto.getSubject());
		p("내용: " + dto.getContent());
		p("날짜: " + dto.getRegdate());
		p("조회수: " + dto.getCount());
		p("아이피: " + dto.getIp());
		p("파일이름: " + dto.getFilename());
		p("파일크기: " + dto.getFilesize());

	}

	private static void update(BoardDAO dao) {
		BoardDTO dto = new BoardDTO();
		
		dto.setName("홍길동");
		dto.setSubject("기억");
		dto.setContent("일깨우기");
		dto.setFilename("test.txt");
		dto.setFilesize(20);
		dto.setNum(3);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(BoardDAO dao) {
		BoardDTO dto = new BoardDTO();
		
		dto.setName("홍길동");
		dto.setSubject("ㅋㅋㅋ");
		dto.setContent("배우는중");
		dto.setPasswd("123");
		dto.setIp("127.0.0.1");
		//dto.setFilename("0919.txt");
		//dto.setFilesize(20);
		
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
