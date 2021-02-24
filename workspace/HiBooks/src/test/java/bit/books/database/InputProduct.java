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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
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
	@Test
	public void getItemInfo() {	// itemId를 이용해 그 상품의 정보를 추출한다.
		Document doc = null;
		String url = "https://ridibooks.com/books/1648000309";
		try {
			doc = Jsoup.connect(url).get();
		}catch(IOException e) {
			e.printStackTrace();
		}
		Elements metaTags = doc.select("meta[property]");
		for(Element meta: metaTags) {
			if(meta.attr("property").equals("og:title")){
				log.info(meta.attr("content"));
			}
			if(meta.attr("property").equals("og:image")){
				log.info(meta.attr("content"));
			}
			if(meta.attr("property").equals("books:rating:value")){
				log.info(meta.attr("content"));
			}
		}
		log.info(doc.selectFirst("p.metadata.metadata_writer").text());				// 저자
		log.info(doc.selectFirst("a.publisher_detail_link").text());				// 출판사
		log.info(doc.selectFirst("tr.selling_price_row > td.book_price > span").text()); 	// 가격(숫자만)
		log.info(doc.selectFirst("div #introduce_book > p").text()); 				// 책소개
	}
	
}
 