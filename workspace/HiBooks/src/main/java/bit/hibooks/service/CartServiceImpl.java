package bit.hibooks.service;

import org.springframework.stereotype.Service;

import bit.hibooks.domain.book.Book;
import bit.hibooks.mapper.PurchaseMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	private PurchaseMapper mapper;
	
	public Book getBook(String itemId) {
		Book book= mapper.getBook(itemId);
		return book;
	}
	

}
