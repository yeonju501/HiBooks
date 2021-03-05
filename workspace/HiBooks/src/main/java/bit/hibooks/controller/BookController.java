package bit.hibooks.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookListResult;
import bit.hibooks.domain.book.BookReview;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.domain.review.ReviewResult;
import bit.hibooks.domain.review.ReviewVo;
import bit.hibooks.service.BookService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("book")
@AllArgsConstructor
public class BookController {
	
	private BookService service;
	
	
	@GetMapping("shop.do")
	public ModelAndView moveShop(BookVo bookVo, HttpSession session) {
		//log.info(bookVo);
		int cp = 1;
		if(bookVo.getCp() == 0) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer) cpObj;
			}
		}else {
			cp = bookVo.getCp();
		}
		session.setAttribute("cp", cp);
		bookVo.setCp(cp);
		
		int ps = 20;
		session.setAttribute("ps", ps);
		
		bookVo.setPs(ps);
		//log.info(bookVo);
		BookListResult bookLR = service.getList(bookVo);
		
		return new ModelAndView("book/shop", "bookLR", bookLR);
	}
	
	@GetMapping("content.do")
	public ModelAndView moveContent(ReviewVo reviewVo) {
		
		Book book = service.getBook(reviewVo.getItemId());
		ReviewResult reviewResult = service.getReviewList(reviewVo);
		
		ModelAndView mv = new ModelAndView("book/content");
		mv.addObject("book", book);
		mv.addObject("reviewResult", reviewResult);
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping("review.do")
	public ReviewResult ajaxReview(BookReview br, ReviewVo reviewVo) {
		//log.info(br+" "+reviewVo);
		ReviewResult rr = service.writeReview(br, reviewVo);
		//log.info(rr);
		return rr;
	}
	@ResponseBody
	@GetMapping("review.do")
	public ReviewResult ajaxReview(ReviewVo reviewVo) {
		log.info(reviewVo);
		ReviewResult rr= service.getReviewList(reviewVo);
		//log.info(rr);
		return rr;
	}
	
	@ResponseBody
	@GetMapping("re-delete.do")
	public ReviewResult ajaxDeleteReview(BookReview br, ReviewVo reviewVo) {
		return service.deleteReview(br, reviewVo);
	}
	@ResponseBody
	@PostMapping("re-update.do")
	public ReviewResult ajaxUpdateReview(BookReview br, ReviewVo reviewVo) {
		return service.updateReview(br, reviewVo);
	}
	@ResponseBody
	@GetMapping("re-like.do")
	public ReviewResult ajaxLikeReview(BookReview br, ReviewVo reviewVo) {
		return service.likeReview(br, reviewVo);
	}
}
