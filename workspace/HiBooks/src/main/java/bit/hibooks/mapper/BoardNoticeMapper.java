package bit.hibooks.mapper;

import bit.hibooks.domain.boardn.BNFile;
import bit.hibooks.domain.boardn.BoardN;

public interface BoardNoticeMapper {
	void insert(BoardN boardN);
	void insertFile(BNFile bNFile);
}
