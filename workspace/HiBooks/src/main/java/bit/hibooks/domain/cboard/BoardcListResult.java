package bit.hibooks.domain.cboard;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardcListResult {
	private int cp;
	private long totalCount;
	private int ps;
	private List<Boardc> list;
	private long totalPageCount;
	
	public BoardcListResult(int cp, long totalCount, int ps, List<Boardc> list) {
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
