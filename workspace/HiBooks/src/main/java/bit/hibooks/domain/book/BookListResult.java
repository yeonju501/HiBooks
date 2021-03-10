package bit.hibooks.domain.book;

import java.util.List;


import lombok.Data;
import lombok.NoArgsConstructor;
import static bit.hibooks.setting.BookModeSet.*;

@NoArgsConstructor
@Data

public class BookListResult {
	private long totalCnt;
	private long novelCnt;
	private long economyCnt;
	private long adviceCnt;
	private long humanCnt;
	private long poemCnt;
	private int cp;
	private int ps;
	private int cate;
	private int totalPage;
	private List<Book> bookList;
	private int rangeSize = 7;	//홀수일때의 로직을 짬.
	private int startPage;
	private int endPage;
	private boolean prev = true;
	private boolean next = true;
	
	public BookListResult(long totalCnt, long novelCnt, long economyCnt, long adviceCnt, long humanCnt, long poemCnt,
			int cp, int ps, List<Book> bookList, int cate) {
		//디비에서 뽑아오는 데이터
		this.totalCnt = totalCnt;
		this.novelCnt = novelCnt;
		this.economyCnt = economyCnt;
		this.adviceCnt = adviceCnt;
		this.humanCnt = humanCnt;
		this.poemCnt = poemCnt;
		this.bookList = bookList;
		
		//브라우저에서 전달하는 데이터 그대로
		this.cp = cp;
		this.ps = ps;
		this.cate = cate;
		
		//위의 데이터로 연산해줘야함.		
		this.totalPage = calTotalPage(cate);
		this.startPage = calStartPage();
		this.endPage = calEndPage();
		this.prev = existPrev();
		this.next = existNext();
	}
	private int calTotalPage(int cate) {
		int tpc=0;
		switch(cate) {
			case NOVEL: tpc = Math.toIntExact(novelCnt)/ps; if(novelCnt%ps != 0) tpc++;break;
			case ECONOMY: tpc = Math.toIntExact(economyCnt)/ps; if(economyCnt%ps != 0) tpc++;break;
			case HUMAN: tpc = Math.toIntExact(humanCnt)/ps; if(humanCnt%ps != 0) tpc++;break;
			case ADVICE: tpc = Math.toIntExact(adviceCnt)/ps; if(adviceCnt%ps != 0) tpc++;break;
			case POEM: tpc = Math.toIntExact(poemCnt)/ps; if(poemCnt%ps != 0) tpc++;break;
			default : tpc = Math.toIntExact(totalCnt)/ps; if(totalCnt%ps != 0) tpc++;
		}
		return tpc;
	}
	private int calStartPage() {
		if(cp < rangeSize/2 + 1) {
			return 1;
		}else return cp - rangeSize/2;
	}
	private int calEndPage() {
		if(cp > totalPage - rangeSize/2) {
			this.next = false;
			endPage = totalPage;
			startPage = endPage - rangeSize + 1;
			return endPage;
		}else return startPage + rangeSize - 1;
	}
	
	private boolean existPrev() {
		if(cp <= rangeSize/2 + 1) return false;
		return true;
	}
	private boolean existNext() {
		if(cp >= totalPage - rangeSize/2) return false;
		return true;
	}

	
}
