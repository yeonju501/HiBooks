package bit.hibooks.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import bit.hibooks.domain.admin.Chart;
import bit.hibooks.domain.admin.ChartCate2;
import bit.hibooks.domain.admin.RecomListResult;
import bit.hibooks.domain.admin.RecommendVo;
import bit.hibooks.domain.admin.UpdateListResult;
import bit.hibooks.domain.book.Book;
import bit.hibooks.service.RecommendService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	private RecommendService service;
	
	@RequestMapping("recommend.do")
	public ModelAndView recommend(HttpSession session) {
		UpdateListResult updateLR = service.getNewBook();
		ModelAndView mv = new ModelAndView("admin/admin", "updateLR", updateLR);
		return mv;
	}
	
	@RequestMapping ("recomsearch.do")
	public ModelAndView search(HttpServletResponse response, HttpSession session, RecommendVo recommendVo) throws IOException {
		List<Book> list = null;
		if(recommendVo.getCat() == null){
			String alertText= "카테고리를 선택해 주세요";
			AlertController.alertAndBackPage(response, alertText);
		}else if(recommendVo.getKeyword().equals("")){
			String alertText= "키워드를 입력해 주세요";
			AlertController.alertAndBackPage(response, alertText);
		}else if(recommendVo.getCat() != null && !recommendVo.getKeyword().equals("")) {
			session.setAttribute("recommendVo", recommendVo);
			list=service.getBookList(recommendVo);
		}
		ModelAndView mv= new ModelAndView("admin/admin","recomList",list);
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="showbook", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public Book showBook(long b_seq, HttpServletResponse response, HttpSession session) throws IOException{
		Book book= service.getBook(b_seq);
		Object recomObj = session.getAttribute("recomSession");
		List<Book> recomSession = null;
		if(recomObj==null) {
			recomSession = new ArrayList<Book>();
			recomSession.add(book);
			session.setAttribute("recomSession", recomSession);
			return book;
		}else {
			recomSession = (List<Book>)recomObj;
			log.info(recomSession.size());
			if(recomSession.size() > 7) {
				return null;
			}else {
				for(int i=0; i<recomSession.size(); i++) {
					if(recomSession.get(i).getB_seq()==b_seq) {
					Book repetition = new Book();
					repetition.setB_itemId("repetition");
						return repetition;
					}
				}
				recomSession.add(book);
				session.setAttribute("recomSession", recomSession);
				return book;
			}
		}
	}
	
	@ResponseBody
	@GetMapping(value="deletebook",
				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public void deleteBook(long re_seq, HttpServletResponse response, HttpSession session) {
		log.info(re_seq);
		List<Book> recomSession = (List<Book>)session.getAttribute("recomSession");
		for(int i=0; i<recomSession.size(); i++) {
			if(recomSession.get(i).getB_seq()==re_seq) {
				recomSession.remove(i);
			}
		}
		session.setAttribute("recomSession", recomSession);
		
	}
	
	@RequestMapping("sendrecom.do")
	public String sendRecom(RecomListResult recomListResult, HttpSession session) {
		List<Book> list = (List<Book>)session.getAttribute("recomSession");
		recomListResult.setRe_seq1(list.get(0).getB_seq());
		recomListResult.setRe_seq2(list.get(1).getB_seq());
		recomListResult.setRe_seq3(list.get(2).getB_seq());
		recomListResult.setRe_seq4(list.get(3).getB_seq());
		recomListResult.setRe_seq5(list.get(4).getB_seq());
		recomListResult.setRe_seq6(list.get(5).getB_seq());
		recomListResult.setRe_seq7(list.get(6).getB_seq());
		recomListResult.setRe_seq8(list.get(7).getB_seq());
		
		service.sendRecom(recomListResult);
		session.removeAttribute("recomSession");
		
		return "redirect:recommend.do";
	}
	
	@PostMapping(value= "chart.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody List<Chart> getChartData(){
		List<Chart> list = new ArrayList<Chart>();
		list = service.getChart();
		return list;
	}
	
	@ResponseBody
	@PostMapping("cate2Chart.do")
	public List<List<ChartCate2>> getChart2Cate() {
		//log.info(service.getChartCate2());
		return service.getChartCate2();
	}
	
	/*
	 * @RequestMapping(value="upload.do", produces =
	 * "application/json; charset=utf8")
	 * 
	 * @ResponseBody public String uploadSummernoteImageFile(@RequestParam("file")
	 * MultipartFile multipartFile, HttpServletRequest request ) { JsonObject
	 * jsonObject = new JsonObject();
	 * 
	 * 
	 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때. String
	 * originalFileName = multipartFile.getOriginalFilename(); //오리지날 파일명 String
	 * extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	 * //파일 확장자 String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
	 * 
	 * File targetFile = new File(fileRoot + savedFileName); try { InputStream
	 * fileStream = multipartFile.getInputStream();
	 * FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
	 * jsonObject.addProperty("url", "/summernote_image/"+savedFileName); //
	 * contextroot + resources + 저장할 내부 폴더명 jsonObject.addProperty("responseCode",
	 * "success");
	 * 
	 * } catch (IOException e) { FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
	 * jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
	 * String a = jsonObject.toString(); return a; }
	 */

}
