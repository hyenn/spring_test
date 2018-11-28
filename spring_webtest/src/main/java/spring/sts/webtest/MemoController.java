package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.memo.MemoDAO;
import spring.model.memo.MemoDTO;
import spring.utility.webtest.Utility;

@Controller
public class MemoController {

	@Autowired
	private MemoDAO dao;

	@RequestMapping(value = "/memo/delete", method = RequestMethod.GET)
	public String delete(int memono, Model model) {

		boolean flag = dao.CheckRefnum(memono);

		model.addAttribute("flag", flag);

		return "/memo/delete";
	}

	@RequestMapping(value = "/memo/delete", method = RequestMethod.POST)
	public String delete(int memono, Model model, HttpServletRequest request) {

		if(dao.delete(memono)) {
			
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			return "redirect:/memo/list";
		}else {
			
			return "/error/error";
		}

	}

	@RequestMapping(value = "/memo/reply", method = RequestMethod.GET)
	public String reply(int memono, Model model) {

		MemoDTO dto = dao.replyRead(memono);

		model.addAttribute("dto", dto);

		return "/memo/reply";
	}

	@RequestMapping(value = "/memo/reply", method = RequestMethod.POST)
	public String reply(int memono, Model model, MemoDTO dto, HttpServletRequest request) {

		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());

		dao.upAnsnum(map);

		if (dao.replyCreate(dto)) {

			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/memo/list";

		} else {

			return "/error/error";
		}
	}

	@RequestMapping(value = "/memo/update", method = RequestMethod.GET)
	public String update(int memono, Model model) {

		MemoDTO dto = dao.read(memono);

		model.addAttribute("dto", dto);

		return "/memo/update";
	}

	@RequestMapping(value = "/memo/update", method = RequestMethod.POST)
	public String update(int memono, MemoDTO dto, Model model) {

		boolean flag = dao.update(dto);

		model.addAttribute("flag", flag);

		return "redirect:/memo/list";
	}

	@RequestMapping("/memo/read")
	public String read(int memono, Model model) {

		// 조회수 증가
		dao.updateViewcnt(memono);
		// 조회수 증가 끝

		// 조회. 조회수 증가 쿼리문 삭제하고 본문을 읽어오는 쿼리문을 읽어오기 위해서 삭제

		MemoDTO dto = dao.read(memono);
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");// not null이기 때문에 if없이 써도 가능

		dto.setContent(content);

		model.addAttribute("dto", dto);

		return "/memo/read";

	}

	@RequestMapping(value = "/memo/create", method = RequestMethod.GET)
	public String create() {

		return "/memo/create";
	}

	@RequestMapping(value = "/memo/create", method = RequestMethod.POST)
	public String create(MemoDTO dto, Model model) {

		boolean flag = dao.create(dto);

		model.addAttribute("flag", flag);

		return "redirect:/memo/list";
	}

	@RequestMapping("/memo/list")
	public String list(HttpServletRequest request) {

		// 검색
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이징관련
		int nowPage = 1;
		int recordPerPage = 5;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		// DB에서 가져올 순번 생성
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<MemoDTO> list = dao.list(map);

		int totalRecord = dao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);

		return "/memo/list";
	}

}
