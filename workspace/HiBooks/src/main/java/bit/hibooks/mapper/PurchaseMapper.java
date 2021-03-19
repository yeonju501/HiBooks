package bit.hibooks.mapper;

import java.util.ArrayList;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.purchase.Order;
import bit.hibooks.domain.purchase.OrderDetailResult;
import bit.hibooks.domain.purchase.Orderdetail;
import bit.hibooks.domain.purchase.PurchaseResult;
import bit.hibooks.domain.purchase.ShipInfo;

public interface PurchaseMapper {
	//cart
	Book getBook(String itemId);
	//checkout
	void insertOrder(Order order);
	void insertOrderdetail(Orderdetail odetail);
	void insertShipInfo(ShipInfo shipInfo);
	//사용자 결제확인 페이지
	ArrayList<PurchaseResult> selectShipIng(String m_email);
	ArrayList<PurchaseResult> selectShipComplete(String m_email);
	int selectCount(long o_seq);
	ArrayList<OrderDetailResult> selectOrderDetail(long o_seq);
	
}
