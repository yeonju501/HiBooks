package bit.hibooks.domain.search;

import java.util.List;

import bit.hibooks.domain.book.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchListResult {
	private int cp;
	private long totalCount;
	private int ps;
	private List<Book> list;
	private int totalPageCount;
	private int rangeSize;	//홀수일때의 로직을 짬.
	private int startPage;
	private int endPage;
	private boolean prev = true;
	private boolean next = true;
	
	public SearchListResult(int cp, int totalCount, int ps, List<Book> list){
		this.cp=cp;
		this.totalCount=totalCount;
		this.ps=ps;
		this.list=list;
		
		this.rangeSize = 7;
		
		this.totalPageCount=calTotalPageCount();
		this.startPage = calStartPage();
		this.endPage = calEndPage();
		this.prev = existPrev();
		this.next = existNext();
	}
	private int calTotalPageCount() {
		int tpc = Math.toIntExact(totalCount)/ps;
		if(totalCount%ps != 0) tpc++;
		return tpc;
	}
	private int calStartPage() {
		if(cp < rangeSize/2 + 1) {
			return 1;
		}else return cp - rangeSize/2;
	}
	private int calEndPage() {
		if(totalPageCount > 7) {
			if(cp > totalPageCount - rangeSize/2) {
				this.next = false;
				endPage = totalPageCount;
				startPage = endPage - rangeSize + 1;
				return endPage;
			}else return startPage + rangeSize - 1;
		}else {
			return totalPageCount;
		}
	}
	
	private boolean existPrev() {
		if(cp <= rangeSize/2 + 1) return false;
		return true;
	}
	private boolean existNext() {
		if(cp >= totalPageCount - rangeSize/2) return false;
		return true;
	}
}
