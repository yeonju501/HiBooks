package bit.hibooks.controller;



import java.util.List;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.IndexListResult;
import bit.hibooks.domain.admin.UpdateListResult;
import bit.hibooks.domain.boardn.BoardN;
import bit.hibooks.domain.boardn.NoticeContentResult;
import bit.hibooks.domain.boardn.NoticeMainResult;
import bit.hibooks.domain.book.Book;
import bit.hibooks.service.RecommendService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


//import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class IndexController {
	
	private RecommendService service;
	

	@RequestMapping("recommend/list.do") 
	public ModelAndView recommend() {
		IndexListResult indexLR = service.getSec();
		
		ModelAndView mv = new ModelAndView("recommend/list", "indexLR", indexLR);
		return mv; 
	}
	
	@RequestMapping("/") 
	public ModelAndView index() {
		UpdateListResult updateLR = service.getNewBook();
		List<Book> BestBookList = service.getBestBook();
		List<NoticeMainResult> NoticeList = service.getNoticeMain();
		log.info(NoticeList);
		ModelAndView mv = new ModelAndView("index", "updateLR", updateLR);
		mv.addObject("BestBookList", BestBookList);
		mv.addObject("NoticeList", NoticeList);
		return mv; 
	}
}
 