package bit.hibooks.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.qboard.Boardq;
import bit.hibooks.domain.qboard.BoardqContentResult;
import bit.hibooks.domain.qboard.BoardqListResult;
import bit.hibooks.service.BoardqService;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/boardq/*")
@AllArgsConstructor
public class BoardqController {
	private BoardqService service;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session){
		
		int[] page = setPageNum(request,session);
		int cp = page[0]; int ps = page[1];
		
		//(3) ModelAndView 
		BoardqListResult listResult = service.getBoardqListResult(cp, ps);
		ModelAndView mv = new ModelAndView("boardq/list", "listResult", listResult); // board/list.do에 listResult이름으로 listResult를 보냄
		
		if(listResult.getList().size() == 0) {
			if(cp>1)
				return new ModelAndView("redirect:list.do?cp="+(cp-1));
			else
				return new ModelAndView("boardq/list", "listResult", null);
		}else {
			return mv;
		}
	}
	
	@GetMapping("reply.do")
	public String reply(HttpServletRequest request, HttpSession session) {
		String qb_refStr=request.getParameter("qb_ref");
		String qb_levStr=request.getParameter("qb_lev");
		String qb_sunStr=request.getParameter("qb_sun");
		qb_refStr= qb_refStr.trim();
		int qb_ref = Integer.parseInt(qb_refStr);
		request.setAttribute("qb_ref", qb_ref);
		
		qb_levStr= qb_levStr.trim();
		int qb_lev = Integer.parseInt(qb_levStr);
		request.setAttribute("qb_lev", qb_lev);
		
		qb_sunStr= qb_sunStr.trim();
		int qb_sun = Integer.parseInt(qb_sunStr);
		request.setAttribute("qb_sun", qb_sun);
		return "boardq/reply";
	}
	
	@PostMapping("reply.do")
	public String reply(Boardq boardq) {
		service.reply(boardq);
		return "redirect:list.do";
	}

	@GetMapping("write.do")
	public String write() {
		return "boardq/write";
	}
	
	@PostMapping("write.do")
	public String write(Boardq boardq, @RequestParam ArrayList<MultipartFile> files) {
		service.write(boardq,files);
		return "redirect:list.do";
	}
	
	@GetMapping("content.do")
	public ModelAndView content(long qb_seq) {
		BoardqContentResult contentResult=service.getBoardq(qb_seq);
		ModelAndView mv = new ModelAndView("boardq/content", "contentResult", contentResult);
		return mv;
	}
	
	@GetMapping("del.do")
	public String delete(long qb_seq) {
		service.remove(qb_seq);
		return "redirect:list.do";
	}
	
	@GetMapping("update.do")
	public ModelAndView update(long qb_seq) {
		BoardqContentResult contentResult = service.getBoardq(qb_seq);
		ModelAndView mv = new ModelAndView("boardq/update", "contentResult", contentResult);	
		return mv;
	}
	
	@PostMapping("update.do")
	public String update(Boardq boardq) {
		service.edit(boardq);
		return "redirect:list.do";
	}
	
	private int[] setPageNum(HttpServletRequest request, HttpSession session) {
		
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps 
		int ps = 10;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		
		int[] a = new int[2];
		a[0] = cp; a[1] = ps;
		return a;
	}
	
}
