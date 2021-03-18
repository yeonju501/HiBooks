package bit.hibooks.mapper;

import java.util.List;

import bit.hibooks.domain.admin.RecomListResult;
import bit.hibooks.domain.admin.RecommendVo;
import bit.hibooks.domain.book.Book;

public interface AdminMapper {
	
	List<Book> getBookList(RecommendVo recommendVo);
	Book getBook(long b_seq);
	void insertRecom(RecomListResult recomListResult);
	RecomListResult getSec(int re_loc);

	
}
