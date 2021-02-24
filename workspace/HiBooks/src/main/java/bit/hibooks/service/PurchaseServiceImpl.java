package bit.hibooks.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.domain.purchase.Order;
import bit.hibooks.domain.purchase.Orderdetail;
import bit.hibooks.domain.purchase.PurchaseVo;
import bit.hibooks.domain.purchase.ShipInfo;
import bit.hibooks.mapper.PurchaseMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {
	
	private PurchaseMapper mapper;
	
	@Override
	@Transactional
	public void placeOrder(List<CartVo> list,PurchaseVo purchaseVo) {
		String m_email=purchaseVo.getM_email();
		Order order=new Order(-1,m_email,-1,null,-1,null);
		mapper.insertOrder(order);
		long o_seq=order.getO_seq();
		for(CartVo cartVo:list) {
			String b_itemId=cartVo.getItemId();
			int od_vol=cartVo.getVol();
			long od_total=cartVo.getTotal();	
			Orderdetail odetail=new Orderdetail(o_seq,b_itemId,od_vol,od_total);
			mapper.insertOrderdetail(odetail);
		}
		String s_addr=purchaseVo.getS_addr();
		String s_name=purchaseVo.getS_name();
		String s_msg=purchaseVo.getS_msg();
		String s_phone=purchaseVo.getS_phone();
		ShipInfo shipInfo= new ShipInfo(m_email,o_seq,s_addr,s_name,s_msg,s_phone);
		
		mapper.insertShipInfo(shipInfo);
	}

	
	
}
