package bit.hibooks.mapper;

import java.util.List;

import bit.hibooks.domain.qboard.Boardq;
import bit.hibooks.domain.qboard.BoardqVo;
import bit.hibooks.domain.qboard.Qfile;


public interface BoardqMapper {
	//List<Boardq> selectPerPage(BoardqVo boardqVo);
	//List<Boardq> selectByCatgo(BoardqVo boardqVo);
	List<Boardq> selectByRef(BoardqVo boardqVo);
	long selectCount();
	void updateCount(long qb_seq);
	//long selectCountByCatgo(BoardqVo boardqVo);
	Boardq selectBySeq(long qb_seq);
	List<Qfile> selectQfile(long qb_seq);
	void insert(Boardq boardq);
	void updateSun(Boardq boardq);
	int maxRef();
	int maxSun(int qb_lev);
	void update (Boardq boardq);
	void delete (long seq);
	void saveFile(Qfile qfile);
	List<String> selectFname(long qb_seq);
	void deleteFile(long qb_seq);
	

}
