package bit.hibooks.mapper;

import java.util.List;

import bit.hibooks.domain.cboard.Boardc;
import bit.hibooks.domain.cboard.BoardcVo;


public interface BoardcMapper {
	List<Boardc> selectPerPage(BoardcVo boardVo);
	List<Boardc> selectByCatgo(BoardcVo boardVo);
	Boardc selectBySeq(long cb_seq);
	long selectCount();
	long selectCountByCatgo(BoardcVo boardVo);
	
	void insert(Boardc board);
	void update(Boardc board);
	void delete(long cb_seq);
}
