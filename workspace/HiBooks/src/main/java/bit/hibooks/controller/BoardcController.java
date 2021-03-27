package bit.hibooks.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.GetProxy;
import bit.hibooks.domain.book.BookReview;
import bit.hibooks.domain.cboard.*;
import bit.hibooks.domain.review.ReviewResult;
import bit.hibooks.domain.review.ReviewVo;
import bit.hibooks.service.BoardcService;
import bit.hibooks.service.BoardcServiceImpl;

@RequestMapping("boardc")
@Controller
@Log4j
@AllArgsConstructor
public class BoardcController {
	private BoardcService service;//Spring 4.3 ~: AutoInjection (with @AllArgsConstructor )
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
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
		int ps = 3;
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
		
		//(3) ModelAndView 
		BoardcListResult listResult = service.getBoardListResult(cp, ps);
		ModelAndView mv = new ModelAndView("boardc/list", "listResult", listResult);
		
		if(listResult.getList().size() == 0) {
			if(cp>1)
				return new ModelAndView("redirect:list.do?cp="+(cp-1));
			else
				return new ModelAndView("boardc/list", "listResult", null);
		}else {
			return mv;
		}
	}
	
	@GetMapping("write.do")
	public String write() {
		return "boardc/write";
	}
	@PostMapping("write.do")
	public String write(Boardc board, @RequestParam ArrayList<MultipartFile> files) {
		service.write(board, files);
		return "redirect:list.do";
	}
	
	@GetMapping("content.do")
	public ModelAndView content(long seq) {
		Boardc board = service.getBoard(seq);
		ModelAndView mv = new ModelAndView("boardc/content", "board", board);
		
		return mv;
	}
	
	@GetMapping("update.do")
	public ModelAndView update(long seq) {
		Boardc board = service.getBoard(seq);
		ModelAndView mv = new ModelAndView("boardc/update", "board", board);
		
		return mv;
	}
	@PostMapping("update.do")
	public String update(Boardc board) {
		service.edit(board);
		
		return "redirect:list.do";
	}
	@GetMapping("del.do")
	public String delete(long seq) {
		service.remove(seq);
		
		return "redirect:list.do";
	}
}








