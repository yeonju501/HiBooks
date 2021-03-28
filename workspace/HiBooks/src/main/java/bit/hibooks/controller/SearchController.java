package bit.hibooks.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.search.SearchListResult;
import bit.hibooks.domain.search.SearchVo;
import bit.hibooks.service.SearchService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class SearchController {

	private SearchService service;

	@RequestMapping("search.do")
	public ModelAndView search(SearchVo searchVo, HttpSession session) {
		
		String keyword= null; searchVo.getKeyword();
		 if(searchVo.getKeyword() != null) {
			 keyword= searchVo.getKeyword();
			 keyword=keyword.trim();
			 session.setAttribute("keyword", keyword);
		 }else {
			 keyword=(String)session.getAttribute("keyword");
			 System.out.println("키워드 없음");
		 }
		// (2) cp
		int cp = 1;
		if (searchVo.getCp() == 0) {
			Object cpObj = session.getAttribute("cp");
			if (cpObj != null) {
				cp = (Integer) cpObj;
			}
		} else {
			cp = searchVo.getCp();
		}
		session.setAttribute("cp", cp);
		searchVo.setCp(cp);

		// (3) ps
		int ps = 20;
		session.setAttribute("ps", ps);
		keyword= (String) session.getAttribute("keyword");
		
		log.info(cp +" "+ ps);
		SearchListResult listResult = service.getSearchListResult(keyword, cp, ps);
		ModelAndView mv = new ModelAndView("product/search", "listResult", listResult);
		log.info("startPage: "+listResult.getStartPage());
		log.info("startPage: "+listResult.getStartPage());
		log.info("totalCount: "+listResult.getTotalCount());
		log.info("totalPage: "+listResult.getTotalPageCount());
		if (listResult.getList().size() == 0) {
			if (cp > 1)
				return new ModelAndView("redirect:search.do?cp=" + (cp - 1));
			else
				return new ModelAndView("product/search", "listResult", null);
		} else {
			return mv;
		}
	}
	
	@ResponseBody
	@PostMapping("getauto.do")
	public List<Book> getAuto(String keyword){
		log.info("##### 자동완성");
		List<Book> list = service.getAuto(keyword);
		//System.out.println(list);
		return list;
		
	}

}
