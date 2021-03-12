package bit.books.database;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class InputProduct {
	@Test
	public void getItemId() {	// 책 리스트 페이지에서 책고유번호를 추출한다.
		Document doc = null;
		String url = "https://ridibooks.com/category/books/100?order=selling&page=10";
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements items = doc.select("div.book_thumbnail > a");
		for(Element item: items) {
			String href = item.attr("href");
			String[] temp = href.split("/");
			String itemId = temp[2];
			log.info(itemId); 
			//  getItemInfo(itemId)를 호출.
		}
	}
	
	
}
 