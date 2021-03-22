package bit.hibooks.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class AdminController {
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
	
	@PostMapping(value= "chart.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody List<Chart> getChartData(){
		List<Chart> list = new ArrayList<Chart>();
		list = service.getChart();
		return list;
	}
	
	
	@RequestMapping(value="upload.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        
		String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote_image/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

}
