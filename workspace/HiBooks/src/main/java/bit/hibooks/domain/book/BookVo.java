package bit.hibooks.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class BookVo {
	private int cp;
	private int ps;
	private int cate;
	private String sort;
	public int getInitRow() {
		return (cp-1) * ps;
	}
	public int getEndRow() {
		return cp * ps;
	}
	
}
