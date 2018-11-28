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

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.model.bbs.BbsService;
import spring.model.bbs.ReplyDAO;
import spring.model.bbs.ReplyDTO;
import spring.utility.webtest.Utility;


@Controller
public class BbsController {

	@Autowired
	private ReplyDAO rdao;
	@Autowired
	private BbsDAO dao;
	@Autowired
	private BbsService mgr;
	
	
	@RequestMapping("/bbs/rdelete")
	public String rdelete(int bbsno, int nPage, String col, 
			String word, String nowPage, Model model, int rnum) {
		
		int total = rdao.total(bbsno);
		int totalPage = (int)(Math.ceil((double)total/3));
		
		if(rdao.delete(rnum)) {
			if(nPage!=1 && nPage==totalPage && total%3==1) {
				nPage = nPage - 1;
			}
			model.addAttribute("bbsno", bbsno);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			
			return "redirect:/bbs/read";
		
		}else {
			
			return "/error/error";
		}
		
	}
	
	@RequestMapping("/bbs/rupdate")
	public String rupdate(ReplyDTO dto, Model model, String nowPage,
			String col, String word, String nPage) {
		
		if(rdao.update(dto)) {
			model.addAttribute("bbsno", dto.getBbsno());
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			
			return "redirect:/bbs/read";
		
		}else {
			
			return "/error/error";
		}
	}
	
	@RequestMapping("/bbs/rcreate")
	public String rcreate(ReplyDTO dto, Model model, String nowPage,
			String col, String word) {
		
		if(rdao.create(dto)) {
			model.addAttribute("bbsno", dto.getBbsno());
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			
			return "redirect:/bbs/read";
		
		}else {
			
			return "/error/error";
		}
		
	}
	
	@RequestMapping(value="/bbs/reply", method=RequestMethod.GET)
	public String reply(int bbsno, Model model) {
		
		BbsDTO dto = dao.replyRead(bbsno);
		model.addAttribute("dto", dto);
		
		return "/bbs/reply";
	}
	
	@RequestMapping(value="/bbs/reply", method=RequestMethod.POST)
	public String reply(BbsDTO dto, Model model, HttpServletRequest request) {
		
		String basePath = request.getRealPath("/bbs/storage");
		int filesize = (int)dto.getFilenameMF().getSize();
		String filename = "";
		
		if(filesize>0)
			filename = Utility.saveFileSpring(dto.getFilenameMF(), basePath);
		
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
		try {
			mgr.reply(dto);

			return "redirect:/bbs/list";
		}catch(Exception e){
			e.printStackTrace();
			
			Utility.deleteFile(basePath, filename);
			return "/error/error";
		}
	}
	
	@RequestMapping(value="/bbs/delete", method=RequestMethod.GET)
	public String delete(int bbsno, Model model) {
		
		boolean flag = dao.checkRefnum(bbsno); 
		
		model.addAttribute("flag", flag);
		
		return "/bbs/delete";
	}
	
	@RequestMapping(value="/bbs/delete", method=RequestMethod.POST)
	public String delete(int bbsno, String passwd, 
			String oldfile, HttpServletRequest request, Model model) {
		
		String upDir = request.getRealPath("/bbs/storage");
		
		Map map = new HashMap();
		map.put("bbsno", bbsno);
		map.put("passwd", passwd);
		
		boolean pflag = dao.passCheck(map);
		
		if(pflag){
			
			try {
			mgr.delete(bbsno);
			
			Utility.deleteFile(upDir, oldfile);
			
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			
			return "redirect:/bbs/list";
						
		}catch(Exception e) {
			e.printStackTrace();
			return "/error/error";
		}
			
	}else {
		return "/error/passwdError";
		}
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.GET)
	public String update(int bbsno, Model model) {
		
		BbsDTO dto = dao.read(bbsno);
		model.addAttribute("dto", dto);
		
		return "/bbs/update";
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.POST)
	public String update(BbsDTO dto, HttpServletRequest request
			,Model model, String oldfile) {
		
		String upDir = request.getRealPath("/bbs/storage");
						
		Map map = new HashMap();
		map.put("bbsno", dto.getBbsno());
		map.put("passwd", dto.getPasswd());
		
		int filesize = (int)dto.getFilenameMF().getSize();
		String filename = "";
		
		boolean pflag = dao.passCheck(map);
		
		if(pflag){
			if(filesize>0){
				
				if(oldfile != null){
					Utility.deleteFile(upDir, oldfile);
				}

				filename = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
			}
			
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			if(dao.update(dto)) {
				
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				
				return "redirect:/bbs/list";
			}else {
				return "/error/error";
			}
		}else {
			return "/error/passwdError";
		}
		
	}
	
	@RequestMapping("/bbs/read")
	public String read(int bbsno, Model model, HttpServletRequest request) {
		
		dao.upViewcnt(bbsno);
		BbsDTO dto = dao.read(bbsno);
		
		model.addAttribute("dto", dto);
		model.addAttribute("content", dto.getContent().replaceAll("\r\n", "<br>"));
		
		/* 댓글 처리 */
		String url = "read"; //댓글 페이지의 매개변수
		int nPage = 1;
		if(request.getParameter("nPage")!=null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 3;
		int sno = ((nPage-1) * recordPerPage) + 1;
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);

		List<ReplyDTO> rlist = rdao.list(map);
		int total = rdao.total(bbsno);
				
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		
		String paging = Utility.rpaging3(total, nowPage, recordPerPage, 
				col, word, bbsno, nPage, url);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("nPage", nPage);
		model.addAttribute("paging", paging);
		
		/* 댓글처리 끝 */
		
		return "/bbs/read";
	}
	
	
	@RequestMapping(value="/bbs/create", method=RequestMethod.GET)
	public String create() {
		
		
		return "/bbs/create";
	}
	
	@RequestMapping(value="/bbs/create", method=RequestMethod.POST)
	public String create(BbsDTO dto, HttpServletRequest request) {
		
		int filesize = (int)dto.getFilenameMF().getSize();
		String upDir = request.getRealPath("/bbs/storage");
		String filename = "";
		
		if(filesize>0)				
			filename = Utility.saveFileSpring(dto.getFilenameMF(),upDir);
		
		dto.setFilesize(filesize);
		dto.setFilename(filename);

		boolean flag = dao.create(dto);
		
				
		if(flag) {
			
			return "redirect:/bbs/list"; 
			
		}else {
			if(!filename.equals("")) 
				Utility.deleteFile(upDir, filename);
			
			return "/error/error";
		}
		
	}

	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request, Model model) {

		// 검색관련 처리
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이징 관련
		int nowPage = 1;
		int recordPerPage = 5;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			// 넘버포맷익셉션이 일어날 수 있음. 널 값일 때 불러올 수 있기 때문
		}

		// DB에서 가져올 레코드 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);


		List<BbsDTO> list = dao.list(map);

		// 전체 레코드 갯수의 필요한 매개변수(col,word). 비교해야함
		int totalRecord = dao.total(map);

		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("rdao", rdao);

		return "/bbs/list";
	}
}
