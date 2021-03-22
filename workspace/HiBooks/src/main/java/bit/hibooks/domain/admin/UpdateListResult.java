package bit.hibooks.domain.admin;

import java.util.List;

import bit.hibooks.domain.book.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateListResult {
	
	private List<Book> listNovel;
	private List<Book> listEconomy;
	private List<Book> listSociety;
	private List<Book> listSelf;
	private List<Book> listEssay;
	
	

}
