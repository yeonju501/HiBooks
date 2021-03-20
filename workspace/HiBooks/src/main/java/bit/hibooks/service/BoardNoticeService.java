package bit.hibooks.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import bit.hibooks.domain.boardn.BoardN;
import bit.hibooks.domain.boardn.NoticeContentResult;
import bit.hibooks.domain.boardn.NoticeListResult;

public interface BoardNoticeService {
	String uploadImgTemp(MultipartFile file);
	void writeNotice(BoardN boardN, ArrayList<MultipartFile> files);
	NoticeListResult getList();
	NoticeContentResult getContent(long bn_seq);
	String getFileName(long nf_seq);
}
