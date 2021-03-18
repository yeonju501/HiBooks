package bit.hibooks.domain;

import java.util.List;

import bit.hibooks.domain.book.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IndexListResult {
	private List<Book> sec1;
	private List<Book> sec2;

}
