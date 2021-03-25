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
	private String titleSec1;
	private List<Book> sec1;
	private String titleSec2;
	private List<Book> sec2;
	private String titleSec3;
	private List<Book> sec3;
	private String titleSec4;
	private List<Book> sec4;
}
