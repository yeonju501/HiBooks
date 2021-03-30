package bit.hibooks.domain.purchase;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailResult {
	private String b_itemId;
	private String b_img;
	private String b_title;
	private long b_price;
	private int od_vol;
	private long od_total;
}
