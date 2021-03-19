package bit.hibooks.controller;


import java.security.Principal;
import java.util.ArrayList;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import bit.hibooks.domain.boardn.BoardN;
import bit.hibooks.service.BoardNoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("boardNotice")
@AllArgsConstructor
public class BoardNoticeController {
	private BoardNoticeService serviceBN;
	
	@GetMapping("write.do")
	public String write(Model model, Principal principal) {
		log.info(principal.getName());
		return "board-notice/write";
	}
	
	@ResponseBody
	@PostMapping("uploadImgTemp.do")
	public String uploadImgTemp(MultipartFile file) {
		String url = serviceBN.uploadImgTemp(file);
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("url", url);
		jsonObject.addProperty("reponseCode", "success");
		log.info(jsonObject.toString());
		return jsonObject.toString();
	}
	
	@PostMapping("write.do")
	public String writeNotice(BoardN boardN, ArrayList<MultipartFile> fs) {
		log.info(fs);
		serviceBN.writeNotice(boardN, fs);
		return "board-notice/list";
	}
}
