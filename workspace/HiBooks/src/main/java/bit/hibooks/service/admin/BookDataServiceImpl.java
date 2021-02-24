package bit.hibooks.service.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import bit.hibooks.domain.book.Book;
import bit.hibooks.mapper.BookMapper;
import lombok.extern.log4j.Log4j;


@Log4j
@Component
public class BookDataServiceImpl implements BookDataService {
	
	@Autowired
	private BookMapper mapper;
	
	int numSuccess;
	int numFail;
	@Override
	public void insertItemInfo(String url, int pageNum) {
		Document doc = null;
		String urlR = url + pageNum;
		try {
			doc = Jsoup.connect(urlR).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements items = doc.select("div.book_thumbnail > a");
		Book book = null;		
		for(Element item: items) {
			String href = item.attr("href");
			String[] temp = href.split("/");
			String itemId = temp[2].trim();
			book = getItemInfo(itemId); //  getItemInfo(itemId)를 호출.
			try {
				mapper.insertBookInfo(book);
				numSuccess += 1;
			}catch(DataAccessException dae) {
				numFail += 1;
				log.info(dae);
			}
		}
	}

	
	private Book getItemInfo(String itemId) {
		Document doc = null;
		Book book = new Book();
		String url = "https://ridibooks.com/books/" + itemId;
		try {
			doc = Jsoup.connect(url).get();
		}catch(IOException e) {
			e.printStackTrace();
		}
		Elements metaTags = doc.select("meta[property]");
		for(Element meta: metaTags) {
			if(meta.attr("property").equals("og:title")){
				book.setB_title(meta.attr("content"));	// 제목
			}
			if(meta.attr("property").equals("og:image")){
				book.setB_img(meta.attr("content"));	// 이미지링크
			}
			if(meta.attr("property").equals("books:rating:value")){
				double b_rate = Double.parseDouble(meta.attr("content").trim());	// 사용자 평점
				book.setB_rate(b_rate);
			}
		}
		
		String b_itemId = itemId.trim();	// 책 아이디번호
		book.setB_itemId(b_itemId);
		book.setB_writer(doc.selectFirst("p.metadata.metadata_writer").text());				// 저자
		book.setB_publisher(doc.selectFirst("a.publisher_detail_link").text());				// 출판사
		String price = (doc.selectFirst("tr.selling_price_row > td.book_price > span").text()).trim(); 	// 가격(숫자만)
		try {	
			long b_price = Long.parseLong(price.replace(",", ""));
			book.setB_price(b_price);
		}catch(NumberFormatException ne) {
			ne.printStackTrace();
		}
		book.setB_desc(doc.selectFirst("div #introduce_book > p").text()); 	// 책소개( 대부분은 다 이 태그에 있지만, 다른 내용이 있는 경우도 있다 )
		
		return book;
	}

}
