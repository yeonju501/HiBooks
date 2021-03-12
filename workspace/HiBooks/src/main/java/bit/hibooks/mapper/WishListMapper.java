package bit.hibooks.mapper;

import java.util.ArrayList;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.purchase.WishVo;

public interface WishListMapper {
	void insertWishList(WishVo wishVo);
	void deleteWishList(WishVo wishVo);
	ArrayList<Book> getBookInWishList(String m_email);
	int isBookInWishList(WishVo wishVo);
}
