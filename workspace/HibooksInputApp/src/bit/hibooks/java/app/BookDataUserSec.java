package bit.hibooks.java.app;

public class BookDataUserSec {
	
	public static void main(String[] args) {
		BookDataManager bdm = new BookDataManagerSec();
		String url = "https://ridibooks.com/category/new-releases/100?&page=";	// 선택한 카테고리 url 지정(리스트 페이지)
		int pageNum = 1;
		while(true) {
			bdm.insertItemInfo(url, pageNum, 100);
			if(pageNum == 1) break;	// 페이지 넘버를 지정( 리스트 한 페이지에 20개의 책, 한 카테고리에서 대략 10페이지 정도 가져올 예정 )
		}
		bdm.closeCon();
	}

}
