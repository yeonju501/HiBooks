package bit.hibooks.controller;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.IndexListResult;
import bit.hibooks.service.RecommendService;
import lombok.extern.log4j.Log4j;


//import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class IndexController {
	
	private RecommendService service;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
//	  @RequestMapping("/") 
//	  public ModelAndView index() {
//	  IndexListResult indexLR= service.getSec();
//	  ModelAndView mv = new ModelAndView("index", "indexLR", indexLR);
//	  return mv; 
//	  }
	 }
 