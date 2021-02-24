package bit.hibooks.java.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import bit.hibooks.domain.Book;

public class BookDataManagerImpl implements BookDataManager {
	
	Connection con;
	
	BookDataManagerImpl(){
		String url = "jdbc:oracle:thin:@localhost:1521:JAVA";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "board", "java");
		}catch(ClassNotFoundException cnfe) {
			System.out.println("#오라클 드라이버 인식 실패");
		}catch(SQLException se) {
			System.out.println("#testConnectionJdbc() exception: " + se);
		}
	}
	
	int numSuccess = 0;
	int numFail = 0;
	private void insert(Book book) {
		String sql = "insert into BOOK values(BOOK_SEQ.nextval, ?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt= null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book.getB_itemId());
			pstmt.setString(2, book.getB_title());
			pstmt.setString(3, book.getB_img());
			pstmt.setDouble(4, book.getB_rate());
			pstmt.setString(5, book.getB_writer());
			pstmt.setString(6, book.getB_publisher());
			pstmt.setLong(7, book.getB_price());
			pstmt.setString(8, book.getB_desc());
			pstmt.setLong(9, book.getB_cate());
			pstmt.executeUpdate();
			numSuccess += 1;
		}catch(SQLException se) {
			System.out.println("입력실패 상품아이디 : "+book.getB_itemId() + ", 원인 : "+se);
			numFail += 1;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
			}
		}
	}
	@Override
	public void closeCon() {
		System.out.println("입력성공횟수 : "+ numSuccess +", 입력실패횟수 : "+ numFail);
		try {
			if(con != null) con.close();
		} catch (SQLException e) {
		}
	}
	
	@Override
	public void insertItemInfo(String url, int pageNum, long cate) {
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
			try {
				book = getItemInfo(itemId); //  getItemInfo(itemId)를 호출.
				book.setB_cate(cate);
				insert(book);
			}catch(NullPointerException ne) {
				System.out.println("파싱오류 : " + itemId);
			}
		}
	}

	
	private Book getItemInfo(String itemId) throws NullPointerException {
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
