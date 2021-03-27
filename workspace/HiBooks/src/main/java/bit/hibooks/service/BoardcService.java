package bit.hibooks.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import bit.hibooks.domain.cboard.Boardc;
import bit.hibooks.domain.cboard.BoardcListResult;


import bit.hibooks.domain.review.ReviewResult;
import bit.hibooks.domain.review.ReviewVo;
import bit.hibooks.domain.file.BoardcFile;

public interface BoardcService {
	BoardcListResult getBoardListResult(int cp, int ps);
	BoardcListResult getBoardListResult(String catgo, String keyword, int cp, int ps);
	Boardc getBoard(long seq);
	
	void write(Boardc board, ArrayList<MultipartFile> files);
	void edit(Boardc board);
	void remove(long seq);
	
}
