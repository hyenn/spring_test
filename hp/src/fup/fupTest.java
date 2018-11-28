package fup;

import java.util.HashMap;
import java.util.Map;

public class fupTest {

	public static void main(String[] args) {
		fupDAO dao = new fupDAO();
		
		//create(dao);
		pwCh(dao);

	}

	private static void pwCh(fupDAO dao) {
		Map map = new HashMap();
		map.put("fno", 2);
		map.put("fpw", "123");
		
		if(dao.pwCh(map)) {
			p("올바름");
		}else {
			p("틀림");
		}
		
	}

	private static void create(fupDAO dao) {
		fupDTO dto = new fupDTO();
		
		dto.setFname("이름");
		dto.setFtitle("제목");
		dto.setFcontent("내용");
		dto.setFpw("123");
		dto.setFilename("파일");
		dto.setFilesize(1);
		
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
