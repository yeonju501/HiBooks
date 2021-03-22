package bit.hibooks.java.app;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@EnableScheduling
public class BookDataUserNew {
	
	@Scheduled(cron="0 30 0 1 * *")
	public static void main(String[] args) {
	BookDataManager bdm = new BookDataManagerSec();
	String urlNovel = "https://ridibooks.com/category/new-releases/100?&page=";	// 선택한 카테고리 url 지정(리스트 페이지)
	String urlEconomy = "https://ridibooks.com/category/new-releases/200?page=";
	String urlSociety = "https://ridibooks.com/category/new-releases/400?page=";
	String urlSelf = "https://ridibooks.com/category/new-releases/300?page=";
	String urlEssay = "https://ridibooks.com/category/new-releases/110?page=";
	int pageNum = 1;
	while(true) {
		bdm.insertItemInfo(urlNovel, pageNum, 100);
		bdm.insertItemInfo(urlEconomy, pageNum, 200);
		bdm.insertItemInfo(urlSociety, pageNum, 300);
		bdm.insertItemInfo(urlSelf, pageNum, 400);
		bdm.insertItemInfo(urlEssay, pageNum, 500);
		if(pageNum == 1) break;	// 페이지 넘버를 지정( 리스트 한 페이지에 20개의 책, 한 카테고리에서 대략 10페이지 정도 가져올 예정 )
	}
	bdm.closeCon();
	}
	

}
