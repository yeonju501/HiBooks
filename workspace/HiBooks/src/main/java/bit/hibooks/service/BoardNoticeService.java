package bit.hibooks.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import bit.hibooks.domain.boardn.BoardN;

public interface BoardNoticeService {
	String uploadImgTemp(MultipartFile file);
	void writeNotice(BoardN boardN, ArrayList<MultipartFile> files);
}
