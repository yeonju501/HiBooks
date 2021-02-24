package bit.hibooks.domain.purchase;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orderdetail {
	private long o_seq;
	private String b_itemId;
	private int od_vol;
	private long od_total;
}
