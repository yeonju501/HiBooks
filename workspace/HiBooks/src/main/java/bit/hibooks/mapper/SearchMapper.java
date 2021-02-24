package bit.hibooks.mapper;

import java.util.List;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.search.SearchVo;

public interface SearchMapper {
	List<Book> selectByKey(SearchVo searchVo);
	long selectCount(String keyword);
	Book selectBySeq(long b_seq);
	List<Book> selectAuto(SearchVo searchVo);
}
