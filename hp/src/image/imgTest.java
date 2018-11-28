package image;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class imgTest {

	public static void main(String[] args) {
		imgDAO dao = new imgDAO();
		
		//create(dao);
		//list(dao);
		//read(dao);
		//update(dao);
		delete(dao);

	}

	private static void delete(imgDAO dao) {
		
		if(dao.delete(1)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void update(imgDAO dao) {
		imgDTO dto = new imgDTO();
		
		dto.setTitle("이미지");
		dto.setContent("어딨어");
		dto.setImg("없음");
		dto.setNo(12);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(imgDAO dao) {
		
		p(dao.read(2));
		
	}

	private static void list(imgDAO dao) {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<imgDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			imgDTO dto = list.get(i);
			
			p(dto);
			p("------------------------------");
		}
		
	}

	private static void p(imgDTO dto) {
		p("no: " + dto.getNo());
		p("title: " + dto.getTitle());
		p("name: " + dto.getName());
		p("img: " + dto.getImg());
		p("view: " + dto.getViewcnt());
		p("mdate: " + dto.getMdate());
		
		
	}

	private static void create(imgDAO dao) {
		
		imgDTO dto = new imgDTO();
		
		dto.setTitle("제목");
		dto.setName("이름");
		dto.setContent("내용");
		dto.setImg("이미지");
		dto.setPw("123");
		
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
