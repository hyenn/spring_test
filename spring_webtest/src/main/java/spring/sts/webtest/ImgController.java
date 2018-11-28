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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;
import spring.model.img.ImgService;
import spring.utility.webtest.Utility;


@Controller
public class ImgController {

	@Autowired
	private ImgDAO dao;
	@Autowired
	private ImgService mgr;
	
	
	@RequestMapping(value="/img/reply", method=RequestMethod.GET)
	public String reply(int no, HttpServletRequest request) {
		
		ImgDTO dto = dao.replyread(no);
		
		request.setAttribute("dto", dto);
		
		return "/img/reply";
	}
	
	@RequestMapping(value="/img/reply", method=RequestMethod.POST)
	public String reply(HttpServletRequest request, ImgDTO dto, Model model) {
		
		String upDir = request.getRealPath("/img/storage");
		int size = (int) dto.getImgMF().getSize();
		String img = "";
		
		if (size > 0) {
			img = Utility.saveFileSpring(dto.getImgMF(), upDir);
		}
 
		dto.setImg(img);

		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		
		boolean flag = mgr.reply(dto);
		
		if(flag) {
			model.addAttribute("flag", flag);
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			return "redirect:/img/list";
			
		}else {
			if(!img.equals(""))
				Utility.deleteFile(upDir, img);
			
			return "/error/error";
		}
		
	}

	@RequestMapping(value = "/img/delete", method = RequestMethod.GET)
	public String delete(int no, HttpServletRequest request) {
		
		boolean flag = dao.CheckRefnum(no);

		request.setAttribute("flag", flag);
		
		return "/img/delete";
	}

	@RequestMapping(value = "/img/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, String oldfile, 
			@RequestParam Map<Integer,String> map, Model model) {
		
		String upDir = request.getRealPath("/img/storage");
		int no = Integer.parseInt(map.get("no"));
		
		boolean pflag = dao.passcheck(map);
		boolean flag = false;
		
		if(pflag){
			flag = dao.delete(no);
			
			if(flag) {
				if(oldfile!=null && !oldfile.equals("default.jpg")) {
					Utility.deleteFile(upDir, oldfile);
			}
			
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			return "redirect:/img/list";
			
			}else {
				return "/error/error";
			}
		}else {
			return "/error/passwdError";
		}
		
	}

	@RequestMapping(value = "/img/update", method = RequestMethod.GET)
	public String update(int no, HttpServletRequest request) {

		ImgDTO dto = dao.read(no);

		request.setAttribute("dto", dto);

		return "/img/update";
	}

	@RequestMapping(value = "/img/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, String oldfile, ImgDTO dto, Model model, 
			@RequestParam Map<Integer,String> map) {

		String upDir = request.getRealPath("/img/storage");
		String img = "";

		int size = (int) dto.getImgMF().getSize();

		if (size > 0) {
			img = Utility.saveFileSpring(dto.getImgMF(), upDir);
		} else {
			img = oldfile;
		}
		dto.setImg(img);

		boolean pflag = dao.passcheck(map);
		boolean flag = false;

		if (pflag) {
			flag = dao.update(dto);
		} else {
			return "/error/passwdError";
		}

		if (flag) {
			if (img.equals(oldfile)) {
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));

				return "redirect:/img/list";
			}

			Utility.deleteFile(upDir, oldfile);
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/img/list";
		} else {

			Utility.deleteFile(upDir, img);
			return "error/error";
		}
	}

	@RequestMapping(value = "/img/create", method = RequestMethod.GET)
	public String create() {

		return "/img/create";
	}

	@RequestMapping(value = "/img/create", method = RequestMethod.POST)
	public String create(ImgDTO dto, HttpServletRequest request, MultipartFile imgMF) {

		String upDir = request.getRealPath("/img/storage");
		int size = (int) dto.getImgMF().getSize();
		String img = "";

		if (size > 0) {
			img = Utility.saveFileSpring(dto.getImgMF(), upDir);
		}

		dto.setImg(img);

		boolean flag = dao.create(dto);

		request.setAttribute("flag", flag);

		return "redirect:/img/list";

	}

	@RequestMapping("/img/read")
	public String read(int no, HttpServletRequest request) {
		
		dao.viewcnt(no);
		ImgDTO dto = dao.read(no);
		List list = dao.imgRead(no);
		int[] noArr = (int[]) list.get(0);
		String[] files = (String[]) list.get(1);
		
		

		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		request.setAttribute("noArr", noArr);
		request.setAttribute("files", files);

		return "/img/read";
	}

	@RequestMapping("/img/list")
	public String list(HttpServletRequest request) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		int nowPage = 1;
		int recordPerPage = 10;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<ImgDTO> list = dao.list(map);
		// 전체 레코드 개수(col,word)
		int totalRecord = dao.total(map);

		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		return "/img/list";
	}

}
