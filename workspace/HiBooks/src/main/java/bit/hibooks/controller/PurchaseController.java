package bit.hibooks.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.access.ExceptionTranslationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.domain.purchase.PurchaseResult;
import bit.hibooks.domain.purchase.PurchaseVo;
import bit.hibooks.security.MemberDetails;
import bit.hibooks.service.PurchaseService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("purchase")
@AllArgsConstructor
public class PurchaseController {
	private PurchaseService service;
	
	@RequestMapping("checkout.do")
	public String gotoCheckout(HttpSession session, HttpServletResponse response) throws IOException {
		List<CartVo> list = null;
		Object listObj=session.getAttribute("list");
		list = (List<CartVo>)listObj;
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
	
	@ResponseBody
	@GetMapping("placeorder.do")
	public String placeOrder(PurchaseVo purchaseVo, HttpSession session) {
		//log.info(purchaseVo);
		List<CartVo> list = null;
		Object listObj=session.getAttribute("list");
		if(listObj==null) {
			list = new ArrayList<CartVo>();
		}else {
			list= (List<CartVo>) listObj;
		}
		String isSuccess = service.placeOrder(list, purchaseVo);
		list.clear();
		session.setAttribute("list", list);
		return isSuccess;
	}
	
	@GetMapping("orderComplete.do")
	public ModelAndView orderComplete(Authentication auth) {
		//log.info("결제확인 페이지로 이동합니다.");
		MemberDetails memberDetails = null;
		if(auth.isAuthenticated()) {
			memberDetails = (MemberDetails) auth.getPrincipal();
		}
		List<PurchaseResult> shipIngList = service.getShipIng(memberDetails.getUsername());
		List<PurchaseResult> shipCompleteList = service.getShipComplete(memberDetails.getUsername());
		ModelAndView mv = new ModelAndView("purchase/check-order");
		mv.addObject("shipIngList", shipIngList);
		mv.addObject("shipCompleteList", shipCompleteList);
		return mv;
	}
	
	@GetMapping("orderDetail.do")
	public ModelAndView orderDetail(long o_seq) {
		return new ModelAndView("purchase/order-detail","odResultList", service.getOrderDetail(o_seq));
	}
	
	@RequestMapping("jusoPopup.do")
	public String getJusopopup() {
		return "popup/jusoPopup";
	}
}
