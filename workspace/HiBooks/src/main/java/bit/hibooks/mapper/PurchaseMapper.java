package bit.hibooks.mapper;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.purchase.Order;
import bit.hibooks.domain.purchase.Orderdetail;
import bit.hibooks.domain.purchase.ShipInfo;

public interface PurchaseMapper {
	//cart
	Book getBook(String itemId);
	//checkout
	void insertOrder(Order order);
	void insertOrderdetail(Orderdetail odetail);
	void insertShipInfo(ShipInfo shipInfo);

}
