package spring.model.member;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MemberTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		MemberDAO dao = (MemberDAO)factory.getBean("member");
		
		//create(dao);
		//update(dao);
		//read(dao);
		//delete(dao);
		//list(dao);
		//total(dao);
		//updateFile(dao);
		//updatePw(dao);
		//passwdCheck(dao);
		//duplicateEmail(dao);
		//duplicateId(dao);
		//getPwFind(dao);
		//getIdFind(dao);
		//getGrade(dao);
		//loginCheck(dao);
		getFname(dao);
	}



	private static void getFname(MemberDAO dao) {

		p(dao.getFname("admin"));
		
	}



	private static void loginCheck(MemberDAO dao) {

		Map map = new HashMap();
		map.put("id", "admin");
		map.put("passwd", "1233");
		
		if(dao.loginCheck(map)) {
			p("로그인");
		}else {
			p("아님");
		}
		
	}



	private static void getGrade(MemberDAO dao) {
		
		p(dao.getGrade("admin"));
		
	}



	private static void getIdFind(MemberDAO dao) {

		Map map = new HashMap();
		map.put("mname", "관리자");
		map.put("email", "admin@mail.com");
		
		p(dao.getIdFind(map));
		
	}



	private static void getPwFind(MemberDAO dao) {

		Map map = new HashMap();
		map.put("mname", "관리자");
		map.put("id", "admin");
		
		p(dao.getPwFind(map));
		
	}



	private static void duplicateId(MemberDAO dao) {

		if(dao.duplicateId("aa12")) {
			p("아이디 중복");
		}else {
			p("아이디 중복 아님");
		}
		
	}



	private static void duplicateEmail(MemberDAO dao) {
		
		if(dao.duplicateEmail("admin@mail.om")) {
			p("이메일 중복");
		}else {
			p("이메일 중복아님");
		}
		
	}



	private static void passwdCheck(MemberDAO dao) {
		
		Map map = new HashMap();
		map.put("id", "aa1");
		map.put("passwd", "1234");
		
		if(dao.passwdCheck(map)) {
			p("일치");
		}else {
			p("불일치");
		}
		
	}



	private static void updatePw(MemberDAO dao) {

		Map map = new HashMap();
		map.put("id", "aa1");
		map.put("passwd", "1234");
		
		if(dao.updatePw(map)) {
			p("비밀번호 변경");
		}else {
			p("비밀번호 변경 실패");
		}
		
	}



	private static void updateFile(MemberDAO dao) {
		
		Map map = new HashMap();
		map.put("id", "aa1");
		map.put("fname", "member.jpg");
		
		if(dao.updateFile(map)) {
			p("변경");
		}else {
			p("변경 실패");
		}
		
	}



	private static void total(MemberDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		
		int tot = dao.total(map);
		
		p("전체 갯수: " + tot);
		
	}


	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<MemberDTO>list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			MemberDTO dto = list.get(i);
			
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void delete(MemberDAO dao) {
		
			if(dao.delete("sss")) {
				p("삭제");
			}else {
				p("실패");
			}
		}

	private static void read(MemberDAO dao) {
		p(dao.read("aaa"));
		
	}

	private static void p(MemberDTO dto) {
		
		p("아이디: " + dto.getId());
		p("이름: " + dto.getMname());
		p("이메일: " + dto.getEmail());
		p("직업: " + dto.getJob());
		p("전화번호: " + dto.getTel());
		p("우편번호: " + dto.getZipcode());
		p("주소1: " + dto.getAddress1());
		p("주소2: " + dto.getAddress2());
		p("날짜: " + dto.getMdate());
		p("등록사진: " + dto.getFname());

	}

	private static void update(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		
		dto.setTel("010-2222-2222");
		dto.setEmail("aaa1@name.com");
		dto.setZipcode("010111");
		dto.setAddress1("서울시");
		dto.setAddress2("강서구");
		dto.setJob("A01");
		dto.setId("aa1");
	
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		
		dto.setId("aa1");
		dto.setPasswd("123");
		dto.setMname("aa");
		dto.setEmail("aa@name");
		dto.setJob("학생");
		dto.setTel("010-111-1111");
		dto.setZipcode("01000");
		dto.setAddress1("서울시");
		dto.setAddress2("종로구");
		dto.setFname("");
		
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
