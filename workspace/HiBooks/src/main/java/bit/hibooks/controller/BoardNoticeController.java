package bit.hibooks.controller;



import java.io.File;
import java.security.Principal;
import java.util.ArrayList;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import bit.hibooks.domain.boardn.BoardN;
import bit.hibooks.service.BoardNoticeService;
import bit.hibooks.setting.Filepath;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("boardNotice")
@AllArgsConstructor
public class BoardNoticeController {
	private BoardNoticeService serviceBN;
	
	@ResponseBody
	@PostMapping("uploadImgTemp.do")
	public String uploadImgTemp(MultipartFile file) {
		String url = serviceBN.uploadImgTemp(file);
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("url", url);
		jsonObject.addProperty("reponseCode", "success");
		//log.info(jsonObject.toString());
		return jsonObject.toString();
	}
	
		
	@PostMapping("write.do")
	public String writeNotice(BoardN boardN, ArrayList<MultipartFile> fs) {
		log.info(fs);
		serviceBN.writeNotice(boardN, fs);
		return "redirect:../boardNotice/list.do";
	}
	@GetMapping("list.do")
	public String listNotice(Model model) {
		model.addAttribute("noticeListResult", serviceBN.getList());
		return "board-notice/list";
	}
	@GetMapping("content.do")
	public String showContent(long bn_seq, Model model) {
		
		model.addAttribute("ncr",serviceBN.getContent(bn_seq));
		log.info(model);
		return "board-notice/content";
	}
	@GetMapping("download.do")
    public ModelAndView download(long nf_seq) {
		String fname = serviceBN.getFileName(nf_seq);
    	File file = new File(Filepath.FILE_STORE_SUMMER+"file-added/", fname);
    	if(file.exists()) {
    		return new ModelAndView("fileDownloadView", "downloadFile", file);
    	}else {
    		return new ModelAndView("redirect:list.do");
    	}
    }
	
	@GetMapping("update.do")
	public String updatePage(long bn_seq, Model model) {
		log.info(bn_seq);
		model.addAttribute("ncr",serviceBN.getContent(bn_seq));
		return "board-notice/update";
	}
	@PostMapping("update.do")
	public String update(BoardN boardN, ArrayList<MultipartFile> fs) {
		serviceBN.updateNotice(boardN, fs);
		return "redirect:content.do?bn_seq="+ boardN.getBn_seq();
	}
}
