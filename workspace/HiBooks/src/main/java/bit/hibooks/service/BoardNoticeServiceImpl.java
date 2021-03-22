package bit.hibooks.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import bit.hibooks.domain.boardn.BNFile;
import bit.hibooks.domain.boardn.BoardN;
import bit.hibooks.domain.boardn.NoticeContentResult;
import bit.hibooks.domain.boardn.NoticeListResult;
import bit.hibooks.mapper.BoardNoticeMapper;
import bit.hibooks.setting.Filepath;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardNoticeServiceImpl implements BoardNoticeService {
	
	private BoardNoticeMapper mapperBN;
	
	@Override
	public String uploadImgTemp(MultipartFile file) {
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
		String path = Filepath.FILE_STORE_SUMMER+"temp/";
		boolean flag = writeFile(file, saveFileName, path);
		if(flag) {
			String url = "../board-notice-img/temp/"+ saveFileName;
			return url;
		}
		return null;
	}
	
	@Override
	public void writeNotice(BoardN boardN, ArrayList<MultipartFile> files) {
		mapperBN.insert(boardN);
		long bn_seq = boardN.getBn_seq();
		if(files.size() != 0) {
			for(MultipartFile file : files) {
				saveStore(file, bn_seq);
			}
		}
	}
	public NoticeListResult getList() {
		NoticeListResult noticeLR = new NoticeListResult();
		noticeLR.setList(mapperBN.selectNotice());
		return noticeLR;
	}
	public NoticeContentResult getContent(long bn_seq) {
		mapperBN.updateCnt(bn_seq);
		NoticeContentResult ncr = new NoticeContentResult();
		ncr.setBoardN(mapperBN.selectNoticeContent(bn_seq));
		ncr.setFileList(mapperBN.selectContentFile(bn_seq));
		return ncr;
	}
	public String getFileName(long nf_seq) {
		String nf_fname = mapperBN.selectFName(nf_seq);
		return nf_fname;
	}
	public void updateNotice(BoardN boardN, ArrayList<MultipartFile> files) {
		mapperBN.updateNotice(boardN);
		long bn_seq = boardN.getBn_seq();
		mapperBN.deleteFileInfo(bn_seq);
		if(files.size() != 0) {
			for(MultipartFile file : files) {
				saveStore(file, bn_seq);
			}
		}
	}
	private void saveStore(MultipartFile file, long bn_seq) {
		String ofname = file.getOriginalFilename();
		int idx = ofname.lastIndexOf(".");
		System.out.println(ofname+ "  " + idx);
		String ofheader = ofname.substring(0, idx);
		String ext = ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String fname = sb.toString();
		long fsize = file.getSize();
		String path = Filepath.FILE_STORE_SUMMER+"file-added/";
		boolean flag = writeFile(file, fname, path);
		if(flag) {
			mapperBN.insertFile(new BNFile(-1,bn_seq, fname, ofname, fsize));
		}else {
			System.out.println("파일 오류");
		}
	}
	
	private boolean writeFile(MultipartFile file, String saveFileName, String path) {
		File rDir = new File(path);
		if(!rDir.exists()) rDir.mkdirs();
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(path + saveFileName);
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
