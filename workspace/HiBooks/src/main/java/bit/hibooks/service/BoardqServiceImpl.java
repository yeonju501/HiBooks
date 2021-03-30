package bit.hibooks.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import bit.hibooks.domain.qboard.Boardq;
import bit.hibooks.domain.qboard.BoardqContentResult;
import bit.hibooks.domain.qboard.BoardqListResult;
import bit.hibooks.domain.qboard.BoardqVo;
import bit.hibooks.domain.qboard.Qfile;
import bit.hibooks.mapper.BoardqMapper;

import static bit.hibooks.setting.Filepath.*;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardqServiceImpl implements BoardqService {
	private BoardqMapper boardqMapper;
	
	@Override
	public BoardqListResult getBoardqListResult(int cp, int ps) {
		long totalCount = boardqMapper.selectCount();
		BoardqVo boardqVo = new BoardqVo(null,null,cp,ps);
		List<Boardq> list = boardqMapper.selectByRef(boardqVo);
		return new BoardqListResult(cp, totalCount, ps, list);
	}

	@Override
	public BoardqContentResult getBoardq(long qb_seq) {
		boardqMapper.updateCount(qb_seq);
		List<Qfile> flist= boardqMapper.selectQfile(qb_seq);
		Boardq boardq = boardqMapper.selectBySeq(qb_seq);
		return new BoardqContentResult(boardq,flist);
	}
	
	public List<Qfile> getQfile(long qb_seq) {
		return boardqMapper.selectQfile(qb_seq);
	}

	@Override
	public void write(Boardq boardq, ArrayList<MultipartFile> files) {
		long qb_count=0; boardq.setQb_count(qb_count);
		int qb_ref=boardqMapper.maxRef(); qb_ref=qb_ref+1; boardq.setQb_ref(qb_ref);
		int qb_lev=0; boardq.setQb_lev(qb_lev);
		int qb_sun=0; boardq.setQb_sun(qb_sun);
		boardqMapper.insert(boardq);
		long qb_seq=boardq.getQb_seq();
		
		for(MultipartFile file: files) {
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
    		String fname = sb.toString();
    		long fsize= file.getSize();
    		writeFile(file, fname);
    		Qfile qfile = new Qfile(-1,qb_seq,fname,ofname,fsize);
    		boardqMapper.saveFile(qfile);    		
    		}
    	}
	public void writeFile(MultipartFile file, String fname) {
		File rDir = new File(FILE_STORE);
		if(!rDir.exists()) rDir.mkdirs();
		
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(FILE_STORE+fname);
			fos.write(data);
			fos.flush();
		}catch(IOException ie) {
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {}
		}

	}
	@Override
	public void reply(Boardq boardq){
		int qb_ref=boardq.getQb_ref();
		boardq.setQb_ref(qb_ref);
		int qb_lev=boardq.getQb_lev();
		qb_lev=qb_lev+1;
		boardq.setQb_lev(qb_lev);
		int qb_sun=boardq.getQb_sun();
		boardqMapper.updateSun(boardq);
		qb_sun= qb_sun+1;
		boardq.setQb_sun(qb_sun);
		boardqMapper.insert(boardq);
	}

	@Override
	public void edit(Boardq boardq) {
		boardqMapper.update(boardq);
	}

	@Override
	public void remove(long qb_seq) {
		List<String> Flist = boardqMapper.selectFname(qb_seq);
		for(String fname: Flist) {
			File file = new File(FILE_STORE, fname);
			if(file.exists()) file.delete();
		}
		boardqMapper.deleteFile(qb_seq);
		boardqMapper.delete(qb_seq);

	}

}
