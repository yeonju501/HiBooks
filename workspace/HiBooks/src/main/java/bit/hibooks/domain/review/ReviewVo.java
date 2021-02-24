package bit.hibooks.domain.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {
	private int rcp = 1;
	private int rps = 10;
	private String itemId;
	
	public int getInitRow() {
		return 0;
	}
	public int getEndRow() {
		return rcp * rps;
	}
}
