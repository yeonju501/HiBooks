package bit.hibooks.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.admin.RecomListResult;
import bit.hibooks.domain.admin.RecommendVo;
import bit.hibooks.domain.book.Book;
import bit.hibooks.service.RecommendService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
public class RecommendController {
	private RecommendService service;
	
	@RequestMapping("recommend.do")
	public String recommend() {
		return "admin/admin";
	}
	
	@RequestMapping ("recomsearch.do")
	public ModelAndView search(RecommendVo recommendVo) {
		List<Book> list=service.getBookList(recommendVo);
		ModelAndView mv= new ModelAndView("admin/admin","list",list);
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="showbook", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public Book showBook(long b_seq, HttpServletResponse response) {
		Book book= service.getBook(b_seq);
		log.info(book);
		return book;	
	}
	
	@RequestMapping("sendrecom.do")
	public String sendRecom(RecomListResult recomListResult) {
		log.info(recomListResult);
		service.sendRecom(recomListResult);
		return "redirect:recommend.do";
		
	}

}
