package bit.hibooks.domain.purchase;

import bit.hibooks.domain.book.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVo {
	private String itemId;
	private Book book;
	private int vol = 1;
	private long total;
}
