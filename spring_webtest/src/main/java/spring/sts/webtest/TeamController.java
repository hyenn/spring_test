package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.team.TeamDAO;
import spring.model.team.TeamDTO;
import spring.model.team.TeamServices;
import spring.utility.webtest.Utility;


@Controller
public class TeamController {

	@Autowired
	private TeamDAO dao;
	@Autowired
	private TeamServices mgr;

	@RequestMapping(value = "/team/reply", method = RequestMethod.GET)
	public String reply(int no, Model model) {

		TeamDTO dto = dao.replyRead(no);
		model.addAttribute("dto", dto);

		return "/team/reply";
	}

	@RequestMapping(value = "/team/reply", method = RequestMethod.POST)
	public String reply(TeamDTO dto, Model model, HttpServletRequest request) {

		if (mgr.reply(dto)) {
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/team/list";
		}else {
			
			return "/error/error";
		}
		
	}

	@RequestMapping("/team/delete")
	public String delete(int no, Model model, HttpServletRequest request) {

		boolean dflag = dao.checkRefnum(no);		
		
		if(dflag) {
			model.addAttribute("dflag", dflag);
			
			return "team/delete";
		
		}else if (dflag == false) {
			dao.delete(no);

			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/team/list";
		} else {

			return "error/error";
		}

	}

	@RequestMapping(value = "/team/update", method = RequestMethod.GET)
	public String update(int no, HttpServletRequest request) {

		TeamDTO dto = dao.read(no);

		request.setAttribute("dto", dto);

		return "/team/update";
	}

	@RequestMapping(value = "/team/update", method = RequestMethod.POST)
	public String update(TeamDTO dto, Model model, HttpServletRequest request) {

		if (dao.update(dto)) {
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/team/list";
		} else {

			return "/error/error";
		}

	}

	@RequestMapping("/team/read")
	public String read(int no, HttpServletRequest request) {

		TeamDTO dto = dao.read(no);

		request.setAttribute("dto", dto);

		return "/team/read";
	}

	@RequestMapping(value = "/team/create", method = RequestMethod.GET)
	public String create() {

		return "/team/create";
	}

	@RequestMapping(value = "/team/create", method = RequestMethod.POST)
	public String create(TeamDTO dto, Model model) {

		boolean flag = dao.create(dto);
		model.addAttribute("flag", flag);

		return "redirect:/team/list";
	}

	@RequestMapping("/team/list")
	public String list(HttpServletRequest request, Model model) {

		// 검색관련
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이징
		int nowPage = 1;
		int recordPerPage = 5;

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		// DB에서 가져올 시작번호 끝번호
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<TeamDTO> list = dao.list(map);
		int totalRecord = dao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);

		return "/team/list";
	}

}
