package bit.hibooks.domain.qboard;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardqListResult {
	private int cp;
	private long totalCount;
	private int ps;
	private List<Boardq> list;
	private long totalPageCount;
	
	public BoardqListResult(int cp, long totalCount, int ps, List<Boardq> list) {
		this.cp = cp;
		this.totalCount = totalCount;
		this.ps = ps;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	
	private long calTotalPageCount() {
		long tpc = totalCount/ps; 
		if(totalCount%ps != 0) tpc++;
		
		return tpc;
	}


}
