package bbss;

import java.util.HashMap;
import java.util.Map;

public class bbssTest {

	public static void main(String[] args) {
		bbssDAO dao = new bbssDAO();
		
		//create(dao);
		//update(dao);
		//read(dao);
		passch(dao);

	}

	private static void passch(bbssDAO dao) {
		
		Map map = new HashMap();
		map.put("bbsno", 2);
		map.put("passwd", "1234");
	
		if(dao.PassCheck(map)) {
			p("일치");
		}else {
			p("불일치");
		}
		
	}

	private static void read(bbssDAO dao) {
		p(dao.read(1));
		
	}

	private static void p(bbssDTO dto) {
		p("번호: " + dto.getBbsno());
		p("이름: " + dto.getBname());
		p("제목: " + dto.getTitle());
		p("내용: " + dto.getContent());
		p("조회수: " + dto.getViewcnt());
		p("날짜: " + dto.getWdate());
		
	}

	private static void update(bbssDAO dao) {
		bbssDTO dto = new bbssDTO();
		
		dto.setTitle("다시 묻기");
		dto.setContent("안녕");
		dto.setBbsno(1);
		
		if(dao.update(dto)) {
			p("수정");
		}else {
			p("수정ㄴ");
		}
		
	}

	private static void create(bbssDAO dao) {
		bbssDTO dto = new bbssDTO();
		
		dto.setBname("아로미");
		dto.setTitle("안부인사");
		dto.setContent("잘지내니");
		dto.setPasswd("1234");
		
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
