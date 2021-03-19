package bit.hibooks.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.domain.purchase.Order;
import bit.hibooks.domain.purchase.OrderDetailResult;
import bit.hibooks.domain.purchase.Orderdetail;
import bit.hibooks.domain.purchase.PurchaseResult;
import bit.hibooks.domain.purchase.PurchaseVo;
import bit.hibooks.domain.purchase.ShipInfo;
import bit.hibooks.mapper.PurchaseMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {
	
	private PurchaseMapper mapper;
	
	@Override
	public String placeOrder(List<CartVo> list,PurchaseVo purchaseVo) {
		try {
			String m_email=purchaseVo.getM_email();
			String o_paytype = purchaseVo.getO_paytype();
			String o_shipno = purchaseVo.getO_shipno();
			long o_paidAmount = purchaseVo.getO_paidAmount();
			Order order = new Order(-1,m_email,-1,null,o_paytype, o_shipno ,o_paidAmount);
			
			mapper.insertOrder(order);
			long o_seq = order.getO_seq();
			for(CartVo cartVo:list) {
				String b_itemId = cartVo.getItemId();
				int od_vol = cartVo.getVol();
				long od_total = cartVo.getTotal();	
				Orderdetail odetail = new Orderdetail(o_seq, b_itemId, od_vol, od_total);
				mapper.insertOrderdetail(odetail);
			}
			String s_addr=purchaseVo.getS_addr();
			String s_name=purchaseVo.getS_name();
			String s_msg=purchaseVo.getS_msg();
			String s_phone=purchaseVo.getS_phone();
			String s_zipNo = purchaseVo.getS_zipNo();
			ShipInfo shipInfo= new ShipInfo(m_email,o_seq,s_addr,s_name,s_msg,s_phone,s_zipNo);
			mapper.insertShipInfo(shipInfo);
			return "y";
		}catch(DataAccessException dae) {
			return "n";
		}
	}

	@Override
	public List<PurchaseResult> getShipIng(String m_email) {
		List<PurchaseResult> list = mapper.selectShipIng(m_email);
		//같은 o_seq를 가진 여러 개의 아이템을 책제목.... 외 n권 으로 표시해야한다.
		// 같은 o_seq를 가진 아이템 제거
		long seq= -1;
		long o_seq = -1;
		for(int i=0; i<list.size(); i++) {
			if( (o_seq = list.get(i).getO_seq()) == seq) {
				list.remove(i);
			}else {
				seq = o_seq;
			}
		}
		// 외 n권으로 표시
		for(PurchaseResult item : list) {
			int cntOfOrderDetail = mapper.selectCount(item.getO_seq());
			item.setB_title(item.getB_title()+" 외 "+ cntOfOrderDetail + " 품목");
		}
		return list;
	}

	@Override
	public List<PurchaseResult> getShipComplete(String m_email) {
		List<PurchaseResult> list = mapper.selectShipComplete(m_email);
		//같은 o_seq를 가진 여러 개의 아이템을 책제목.... 외 n권 으로 표시해야한다.
		// 같은 o_seq를 가진 아이템 제거
		long seq= -1;
		long o_seq = -1;
		for(int i=0; i<list.size(); i++) {
			if( (o_seq = list.get(i).getO_seq()) == seq) {
				list.remove(i);
			}else {
				seq = o_seq;
			}
		}
		// 외 n권으로 표시
		for(PurchaseResult item : list) {
			int cntOfOrderDetail = mapper.selectCount(item.getO_seq());
			item.setB_title(item.getB_title()+" 외 "+ cntOfOrderDetail + " 품목");
		}
		return list;
	}

	@Override
	public List<OrderDetailResult> getOrderDetail(long o_seq) {
		return mapper.selectOrderDetail(o_seq);
	}
}
