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

import spring.model.board.BoardDAO;
import spring.model.board.BoardDTO;
import spring.model.board.BoardMgr;
import spring.model.board.BreplyDAO;
import spring.model.board.BreplyDTO;
import spring.utility.webtest.Utility;



@Controller
public class BoardController {
	
	@Autowired
	private BreplyDAO rdao;	
	@Autowired
	private BoardDAO dao;	
	@Autowired
	private BoardMgr mgr;
	
	
	@RequestMapping("/board/rdelete")
	public String rdelete(Model model, int num, int rnum,
			String col, String word, String nowPage, int nPage) {
		
		int total = rdao.total(rnum);
		int totalPage = (int)(Math.ceil((double)total/3));
		
		if(rdao.delete(rnum)) {
			if(nPage!=1 && nPage==totalPage && total%3==1) {
				nPage = nPage - 1;
			}
			model.addAttribute("num", num);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			
			return "redirect:/board/read";
		}else {
			return "/error/error";
		}
	}
	
	
	@RequestMapping("/board/rupdate")
	public String rupdate(BreplyDTO dto, Model model,
			String col, String word, String nowPage, String nPage) {
		
		if(rdao.update(dto)) {
			model.addAttribute("num", dto.getNum());
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			
			return "redirect:/board/read";
		}else {
			return "/error/error";
		}
		
	}
	
	@RequestMapping("/board/rcreate")
	public String rcreate(BreplyDTO dto, Model model,
			String col, String word, String nowPage) {
		
		if(rdao.create(dto)) {
			model.addAttribute("num", dto.getNum());
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			
			return "redirect:/board/read";
		}else {
			return "/error/error";
		}
		
	}
	
	@RequestMapping(value="/board/delete", method=RequestMethod.GET)
	public String delete(int num, Model model) {
		
		boolean flag = dao.CkRefnum(num);
		model.addAttribute("flag", flag);
		
		return "/board/deleteForm";
	}
	
	@RequestMapping(value="/board/delete", method=RequestMethod.POST)
	public String delete(int num, String passwd, String oldfile,
			HttpServletRequest request, Model model) {
		
		String basePath = request.getRealPath("/storage");
		
		Map map = new HashMap();
		map.put("num", num);
		map.put("passwd", passwd);
		
		boolean pflag = dao.chPasswd(map);
	
		if(pflag) {
			dao.delete(num);
			Utility.deleteFile(basePath, oldfile);
			
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			
			return "redirect:/board/list";
			
		}else {
			return "/error/passwdError";
		}
	
	}
	
	@RequestMapping(value="/board/reply", method=RequestMethod.GET)
	public String reply(int num, Model model) {
		
		BoardDTO dto = dao.readRe(num);
		model.addAttribute("dto", dto);
		
		return "/board/reply";
	}
	
	@RequestMapping(value="/board/reply", method=RequestMethod.POST)
	public String reply(BoardDTO dto, Model model, HttpServletRequest request) {
		
		String basePath = request.getRealPath("/storage");
		
		dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), basePath));
		dto.setFilesize((int)dto.getFilenameMF().getSize());
		dto.setIp(request.getRemoteAddr());
		
		boolean flag = mgr.reply(dto);
		
		if(flag) {
			
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			
			return "redirect:/board/list";
		}else {
			return "/error/error";
		}
	}
	
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public String update(int num, Model model) {
		
		BoardDTO dto = dao.read(num);
		model.addAttribute("dto",dto);
		
		return "/board/update";
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String update(BoardDTO dto, HttpServletRequest request, 
			String oldfile, Model model) {
		
		String basePath = request.getRealPath("/storage");
		
		dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), basePath));
		dto.setFilesize((int)dto.getFilenameMF().getSize());
		
		Map map = new HashMap();
		map.put("num", dto.getNum());
		map.put("passwd", dto.getPasswd());
		
		boolean pflag = dao.chPasswd(map);
		boolean flag = false;
		
		if(pflag) {
			flag = dao.update(dto);
		}
		
		String str = null;
		
		if(pflag) {
			if(flag) {
				if(dto.getFilesize()>0) {
					Utility.deleteFile(basePath, oldfile);
				}
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				
				str = "redirect:/board/list";
			}else {
				if(dto.getFilesize()>0) {
					Utility.deleteFile(basePath, dto.getFilename());
				}
				
				str = "/error/error";
			}
		}else {
			if(dto.getFilesize()>0) {
				Utility.deleteFile(basePath, dto.getFilename());
			}
			str = "/error/passwdError";
		}
		
		return str;
	}
	
	@RequestMapping("/board/read")
	public String read(int num, Model model, HttpServletRequest request) {
		
		dao.upviewCnt(num);
		BoardDTO dto = dao.read(num);
		String content = dto.getContent().replaceAll("\r\n","<br>");
		dto.setContent(content);
		
		model.addAttribute("dto", dto);
		
		
		/* 댓글 처리 */
		String url = "read";
		int nPage = 1;
		if(request.getParameter("nPage")!=null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 3;
		int sno = ((nPage-1)*recordPerPage)+1;
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("num", num);
		
		List<BreplyDTO> rlist = rdao.list(map);
		int total = rdao.total(num);
		
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		
		String paging = Utility.bpaging3(total, nowPage, recordPerPage, 
				col, word, num, nPage, url);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("nPage", nPage);
		model.addAttribute("paging", paging);
		
		/* 댓글처리 끝 */
		
		return "/board/read";
	}
	
	
	@RequestMapping(value="/board/create", method=RequestMethod.GET)
	public String create() {
		
		return "/board/create";
	}
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(BoardDTO dto, HttpServletRequest request) {
		
		String upDir = request.getRealPath("/storage");
		
		dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), upDir));
		dto.setFilesize((int)dto.getFilenameMF().getSize());
		dto.setIp(request.getRemoteAddr());
		
		boolean flag = dao.create(dto);
		
		if(flag) { 
			//return "/list"; 실행하면 포워드. 따라서 반드시 컨트롤러를 거쳐서 가야함
			
			return "redirect:/board/list";
		}else {
			return "/error/error";
		}
	
	}
	
	@RequestMapping("/board/list")
	public String list(HttpServletRequest request, Model model) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) word = "";
		
		//페이징
		int nowPage = 1;
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage - 1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
			
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		//1.model사용
		List<BoardDTO> list = dao.list(map);
		int total = dao.total(map); 
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		
		//2.request 저장
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
				
				
		return "/board/list";
	}

}
