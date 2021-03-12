package bit.hibooks.service;

import java.util.List;

import bit.hibooks.domain.admin.RecomListResult;
import bit.hibooks.domain.admin.RecommendVo;
import bit.hibooks.domain.book.Book;

public interface RecommendService {
	List<Book> getBookList(RecommendVo recommendVo);
	Book getBook(long b_seq);
	void sendRecom(RecomListResult recomListResult);

}
