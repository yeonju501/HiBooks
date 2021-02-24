package bit.test.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.mapper.BookMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class serviceTest {
	@Autowired
	private BookMapper mapper;
	
	@Test
	public void getList() {
		BookVo bookVo = new BookVo(2, 20, 0);
		log.info(bookVo.getCp() +" "+ bookVo.getPs());
		
		List<Book> bookList = mapper.getBookList(bookVo);
		
		log.info(bookList);
		
	}
}
