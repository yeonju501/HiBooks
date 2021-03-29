package bit.hibooks.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import bit.hibooks.domain.cboard.*;
import bit.hibooks.domain.review.ReviewResult;
import bit.hibooks.domain.review.ReviewVo;
import bit.hibooks.domain.file.BoardcFile;
import bit.hibooks.domain.book.BookReview;
import bit.hibooks.filesetting.Path;
import bit.hibooks.mapper.BoardcMapper;
import bit.hibooks.mapper.BoardcFileMapper;


@Log4j
@Service
@AllArgsConstructor
public class BoardcServiceImpl implements BoardcService {
    private BoardcMapper boardcMapper; //Spring 4.3 ~: AutoInjection (with @AllArgsConstructor ) 
    private BoardcFileMapper fileMapper;
	@Override
	public BoardcListResult getBoardListResult(int cp, int ps) {
		long totalCount = boardcMapper.selectCount();
		BoardcVo boardVo = new BoardcVo(null, null, cp, ps);
		List<Boardc> list = boardcMapper.selectPerPage(boardVo);
		
		return new BoardcListResult(cp, totalCount, ps, list);
	}
	
	@Override
	public BoardcListResult getBoardListResult(String catgo, String keyword, int cp, int ps) {
		BoardcVo boardVo = new BoardcVo(catgo, keyword, cp, ps);
		long totalCount = boardcMapper.selectCountByCatgo(boardVo);
		List<Boardc> list = boardcMapper.selectByCatgo(boardVo);
		
		return new BoardcListResult(cp, totalCount, ps, list);
	}
	@Override
	public Boardc getBoard(long cb_seq) {
		boardcMapper.updateCcnt(cb_seq);
		return boardcMapper.selectBySeq(cb_seq);
	}

	@Override
	public void write(Boardc board, ArrayList<MultipartFile> files) {
		boardcMapper.insert(board);
		long cb_seq = board.getCb_seq();
		log.info("########"+cb_seq);
		for(MultipartFile file: files) {
    		String ofname = file.getOriginalFilename();
    		if(ofname != null) ofname = ofname.trim();
    		if(ofname.length() != 0) {
    			saveStore(file, cb_seq);
    		}
    	}
		//filedao.insertFileInfo(file);
	}

	@Override
	public void edit(Boardc board) {
		boardcMapper.update(board);
	}

	@Override
	public void remove(long cb_seq) {
		boardcMapper.delete(cb_seq);
	}
	
	private void saveStore(MultipartFile file, long cb_seq) {
		String ofname = file.getOriginalFilename();
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx);
		String ext = ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String saveFileName = sb.toString();
		
		long fsize = file.getSize();
		
		//log.info("#ofname: " + ofname + ", saveFileName: " + saveFileName + ", fsize: "+fsize);
		
		//파일정보를  DB에 저장
		BoardcFile fBoard = new BoardcFile(-1, cb_seq, saveFileName, ofname, fsize);
		fileMapper.insertFileInfo(fBoard);
		
		
		boolean flag = writeFile(file, saveFileName);	// 실제 서버의 하드디스크에 파일을 저장
		if(flag) {
			log.info("#업로드 성공");
		}else {
			log.info("#업로드 실패");
		}
	}
	
	private boolean writeFile(MultipartFile file, String saveFileName) {
		File rDir = new File(Path.FILE_STORE);
		if(!rDir.exists()) rDir.mkdirs();
		
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(Path.FILE_STORE+saveFileName);
			fos.write(data);
			fos.flush();
			
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {}
		}
	}
}
