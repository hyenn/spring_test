package spring.model.img;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;

public class ImgTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		ImgDAO dao = (ImgDAO)factory.getBean("img");
		
		//create(dao);
		//update(dao);
		//read(dao);
		//delete(dao);
		//list(dao);
		//replyCreate(dao);
		//replyRead(dao);
		//passcheck(dao);
		//upViewcnt(dao);
		//total(dao);
		//checkRefnum(dao);
		//getimg(dao);
		imgRead(dao);
		
	}


	private static void imgRead(ImgDAO dao) {
		
		List list = dao.imgRead(9);
		
	}


	private static void getimg(ImgDAO dao) {
		
		p(dao.getimg(9));
		
	}


	private static void checkRefnum(ImgDAO dao) {
		if(dao.CheckRefnum(1)) {
			p("답변글 존재");
		}else {
			p("답변글 없음");
		}
		
	}


	private static void total(ImgDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		
		int tot = dao.total(map);
		
		p("전체 갯수: " + tot);
		
	}


	private static void upViewcnt(ImgDAO dao) {
		dao.viewcnt(1);
		
	}


	private static void passcheck(ImgDAO dao) {
		Map map = new HashMap();
		map.put("no", 9);
		map.put("passwd", "123");
		
		if(dao.passcheck(map)) {
			p("일치");
		}else {
			p("불일치");
		}
	}


	private static void replyRead(ImgDAO dao) {
		p(dao.replyread(8));
	}

	private static void replyCreate(ImgDAO dao) {
		ImgDTO dto = dao.replyread(9);
		
		dto.setName("name");
		dto.setTitle("title");
		dto.setPasswd("123");
		dto.setImg("test11.txt");
		
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

	private static void list(ImgDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<ImgDTO>list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			ImgDTO dto = list.get(i);
			
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void delete(ImgDAO dao) {
		
			if(dao.delete(1)) {
				p("삭제");
			}else {
				p("실패");
			}
		}

	private static void read(ImgDAO dao) {
		p(dao.read(10));
		
	}

	private static void p(ImgDTO dto) {
		
		p("번호: " + dto.getNo());
		p("이름: " + dto.getName());
		p("제목: " + dto.getTitle());
		p("이미지: " + dto.getImg());
		p("날짜: " + dto.getMdate());
		p("조회수: " + dto.getViewcnt());

	}

	private static void update(ImgDAO dao) {
		ImgDTO dto = new ImgDTO();
		
		dto.setName("홍길동");
		dto.setTitle("기억");
		dto.setImg("img.jpg");
		dto.setNo(11);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(ImgDAO dao) {
		ImgDTO dto = new ImgDTO();
		
		dto.setName("아로미");
		dto.setTitle("ㅋㅋㅋ");
		dto.setImg("img.jpg");
		dto.setPasswd("123");
		
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
