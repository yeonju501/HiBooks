package bit.hibooks.java.app;


public class BookDataUser {
	public static void main(String[] args) {
		BookDataManager bdm = new BookDataManagerSec();
		String url = "https://ridibooks.com/category/books/110?&page=";	// 선택한 카테고리 url 지정(리스트 페이지)
		int pageNum = 1;
		while(true) {
			bdm.insertItemInfo(url, pageNum, 500);
			if(pageNum == 110) break;	// 페이지 넘버를 지정( 리스트 한 페이지에 20개의 책, 한 카테고리에서 대략 10페이지 정도 가져올 예정 )
			pageNum += 1;
		}
		bdm.closeCon();
	}
}

