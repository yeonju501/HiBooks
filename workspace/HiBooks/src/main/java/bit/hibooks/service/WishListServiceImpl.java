package bit.hibooks.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.purchase.WishVo;
import bit.hibooks.mapper.WishListMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WishListServiceImpl implements WishListService {
	
	private WishListMapper mapperWish;
	
	@Override
	public String clickWishButton(WishVo wishVo) {
		try {
			mapperWish.insertWishList(wishVo);
			return "selected";
		}catch(DataAccessException dae) {
			mapperWish.deleteWishList(wishVo);
			return "unselected";
		}
	}

	@Override
	public List<Book> getWishList(String m_email) {
		return mapperWish.getBookInWishList(m_email);
	}

	@Override
	public void removeItem(WishVo wishVo) {
		mapperWish.deleteWishList(wishVo);
	}
	 
}
