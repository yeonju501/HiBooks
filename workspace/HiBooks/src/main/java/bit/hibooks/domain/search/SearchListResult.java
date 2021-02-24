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
	private long totalPageCount;
	
	public SearchListResult(int cp, long totalCount, int ps, List<Book> list){
		this.cp=cp;
		this.totalCount=totalCount;
		this.ps=ps;
		this.list=list;
		this.totalPageCount=calTotalPageCount();
		
	}
	private long calTotalPageCount() {
		long tpc = totalCount/ps;
		if(totalCount%ps != 0) tpc++;
		return tpc;
	}

}
