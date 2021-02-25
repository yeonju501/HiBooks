package bit.hibooks.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.domain.purchase.PurchaseVo;
import bit.hibooks.service.PurchaseService;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("purchase")
@AllArgsConstructor
public class PurchaseController {
	private PurchaseService service;
	
	@RequestMapping("checkout.do")
	public String gotoCheckout(HttpSession session, HttpServletResponse response) throws IOException {
		List<CartVo> list = null;
		Object listObj=session.getAttribute("list");
		list=(List<CartVo>)listObj;
		if(list.size()==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('선택된 상품이 없습니다.');</script>");
			out.flush();
			return "purchase/cart";
		}
		session.setAttribute("list",list);
		return "purchase/checkout";
		
	}
	
	
	@RequestMapping("placeorder.do")
	public String placeOrder(PurchaseVo purchaseVo, HttpSession session) {
		
		String m_email=purchaseVo.getM_email();
		List<CartVo> list = null;
		Object listObj=session.getAttribute("list");
		if(listObj==null) {
			list=new ArrayList<CartVo>();
		}else {
			list=(List<CartVo>)listObj;
		}
		service.placeOrder(list,purchaseVo);
		return "redirect:../";
		
	}
	


}
