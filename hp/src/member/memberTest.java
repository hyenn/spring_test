package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class memberTest {

	public static void main(String[] args) {
		
		memberDAO dao = new memberDAO();
		
		//create(dao);
		//update(dao);
		//read(dao);
		//delete(dao);
		//list(dao);
		//searchId(dao);
		searchPw(dao);
	}

	private static void searchPw(memberDAO dao) {
		p(dao.searchPw("bear"));
		
	}

	private static void searchId(memberDAO dao) {
		p(dao.searchId("1"));
		
	}

	private static void list(memberDAO dao) {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<memberDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			memberDTO dto = list.get(i);
			
			p(dto);
			p("---------------------");
		}
		
	}

	private static void delete(memberDAO dao) {
		
		if(dao.delete("bbb")) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(memberDAO dao) {
		p(dao.read("bbb"));
		
	}

	private static void p(memberDTO dto) {
		p("id: " + dto.getId());
		p("pw: " + dto.getPw());
		p("mname: " + dto.getMname());
		p("phone: " + dto.getPhone());
		p("email: " + dto.getEmail());
		p("zipcode: " + dto.getZipcode());
		p("address1: " + dto.getAddress1());
		p("address2: " + dto.getAddress2());
		p("mdate: " + dto.getMdate());
		
	}

	private static void update(memberDAO dao) {
		memberDTO dto = new memberDTO();
		
		dto.setPhone("010-1111-1111");;
		dto.setEmail("ddd@namw.com");
		dto.setZipcode("01010");
		dto.setAddress1("서울");
		dto.setAddress2("성북");
		dto.setPw("123");
		dto.setId("bbb");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(memberDAO dao) {
		memberDTO dto = new memberDTO();
		
		dto.setId("aa");
		dto.setPw("123");
		dto.setEmail("aa@name.nae");
		dto.setMname("aa");
		dto.setPhone("123-123");
		dto.setZipcode("12345");
		dto.setAddress1("서울시");
		dto.setAddress2("강남구");
		
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
