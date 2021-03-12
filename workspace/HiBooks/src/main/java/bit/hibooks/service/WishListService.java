package bit.hibooks.service;

import java.util.List;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.purchase.WishVo;

public interface WishListService {
	String clickWishButton(WishVo wishVo);
	List<Book> getWishList(String m_email);
	void removeItem(WishVo wishVo);
}
