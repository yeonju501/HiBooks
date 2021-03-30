package bit.hibooks.service;

import java.util.List;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.search.SearchListResult;

public interface SearchService {
	SearchListResult getSearchListResult(String keyword,int cp, int ps);
	List<Book> getAuto(String keyword);

}
