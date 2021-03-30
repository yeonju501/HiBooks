package bit.hibooks.service;

import java.util.List;

import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.domain.purchase.OrderDetailResult;
import bit.hibooks.domain.purchase.Orderdetail;
import bit.hibooks.domain.purchase.PurchaseResult;
import bit.hibooks.domain.purchase.PurchaseVo;

public interface PurchaseService {
	String placeOrder(List<CartVo> list,PurchaseVo purchaseVo);
	List<PurchaseResult> getShipIng(String m_email);
	List<PurchaseResult> getShipComplete(String m_email);
	List<OrderDetailResult> getOrderDetail(long o_seq);
}
