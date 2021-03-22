package bit.hibooks.mapper;

import java.util.List;

import bit.hibooks.domain.admin.RecomListResult;
import bit.hibooks.domain.admin.RecommendVo;
import bit.hibooks.domain.book.Book;

public interface AdminMapper {
	
	List<Book> getBookList(RecommendVo recommendVo);
	Book getBook(long b_seq);
	void insertRecom(RecomListResult recomListResult);
	void deleteSec(int re_loc);
	RecomListResult getSec(int re_loc);
	long getCount(int b_cate);
	List<Book> getNewBook (int b_cate);

	
}
