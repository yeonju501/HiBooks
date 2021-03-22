package bit.books.database;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BookDataManagerSec {
	
	@Test
	public void getItemInfo() {	// itemId를 이용해 그 상품의 정보를 추출한다.
		Document doc = null;
		String url = "https://ridibooks.com/books/1648000309";
		try {
			doc = Jsoup.connect(url).get();
		}catch(IOException e) {
			e.printStackTrace();
		}
//		Elements metaTags = doc.select("meta[property]");
//		for(Element meta: metaTags) {
//			if(meta.attr("property").equals("og:title")){
//				log.info(meta.attr("content"));
//			}
//			if(meta.attr("property").equals("og:image")){
//				log.info(meta.attr("content"));
//			}
//			if(meta.attr("property").equals("books:rating:value")){
//				log.info(meta.attr("content"));
//			}
//		}
		String keywords=null;
		Elements metaName = doc.select("meta[name]");
		for (Element meta: metaName) {
			if(meta.attr("name").equals("keywords")) {
				 keywords = meta.attr("content");
				 String [] keyarray = keywords.split(",");
				 String b_cate2=keyarray[3];
				// log.info(b_cate2);
				}
		}
		
		String writer =doc.selectFirst("p.metadata.metadata_writer").text();
		int writerDiv=writer.indexOf("저");
		//log.info(writer);
		String b_writer=writer.substring(0, writerDiv+1);
		String b_translator=writer.substring(writerDiv+1);
		//log.info(b_writer);
		//log.info(b_translator);
//		log.info(doc.selectFirst("a.publisher_detail_link").text());				// 출판사
//		log.info(doc.selectFirst("tr.selling_price_row > td.book_price > span").text()); 	// 가격(숫자만)
//		log.info(doc.selectFirst("div #introduce_book > p").text()); // 책소개
		
		Komoran komoran = new Komoran(DEFAULT_MODEL.STABLE);
		String b_desc= doc.selectFirst("div #introduce_book > p").text();
		KomoranResult analyzeResultList= komoran.analyze(b_desc);
		ArrayList<String> list=(ArrayList<String>)analyzeResultList.getNouns();
		log.info(list);
		ArrayList<String> nouns = new ArrayList<String>();
		for (String noun:list) {
			if(!nouns.contains(noun))
				nouns.add(noun);
		}
		StringBuilder sb= new StringBuilder();
		sb.append(keywords);
		sb.append(",");
		for(String noun:nouns) {
			sb.append(noun);
			sb.append(",");
		}
		String b_keyword= sb.toString();
		//log.info(b_keyword);
	}
	

}
