package bit.hibooks.java.app;

import java.util.List;

import bit.hibooks.domain.book.Book;

public interface BookDataManager {
	void insertItemInfo(String url, int pageNum, int cate);
	void closeCon();
}
