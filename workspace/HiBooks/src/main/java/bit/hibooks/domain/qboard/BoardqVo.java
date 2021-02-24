package bit.hibooks.domain.qboard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardqVo {
	String catgo;
	String keyword;
	private int cp;
	private int ps;
	
	{
		cp=1;
		ps=10;
	}
	
	public int getStartRow() {
		return (cp-1)*ps;
	}
	public int getEndRow() {
		return cp*ps;
	}

}
