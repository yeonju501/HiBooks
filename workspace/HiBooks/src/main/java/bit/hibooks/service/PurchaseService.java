package bit.hibooks.service;

import java.util.List;

import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.domain.purchase.PurchaseVo;

public interface PurchaseService {
	void placeOrder(List<CartVo> list,PurchaseVo purchaseVo);
	
}
