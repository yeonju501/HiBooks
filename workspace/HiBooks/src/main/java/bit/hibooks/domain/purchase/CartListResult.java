package bit.hibooks.domain.purchase;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartListResult {
	private List<CartVo> list;
	private long totalPay;
}
