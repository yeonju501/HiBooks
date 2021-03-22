package bit.hibooks.mapper;

import java.util.ArrayList;

import bit.hibooks.domain.boardn.BNFile;
import bit.hibooks.domain.boardn.BoardN;

public interface BoardNoticeMapper {
	void insert(BoardN boardN);
	void insertFile(BNFile bNFile);
	ArrayList<BoardN> selectNotice();
	BoardN selectNoticeContent(long bn_seq);
	ArrayList<BNFile> selectContentFile(long bn_seq);
	String selectFName(long nf_seq);
	void updateCnt(long bn_seq);
	void updateNotice(BoardN boardN);
	void deleteFileInfo(long bn_seq);
}
