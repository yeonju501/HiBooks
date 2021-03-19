package bit.hibooks.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.domain.purchase.WishVo;
import bit.hibooks.security.MemberDetails;
import bit.hibooks.service.WishListService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("wishList")
@AllArgsConstructor
public class WishListController {
	
	private WishListService service;
	
	@GetMapping("moveWishPage.do")
	public ModelAndView moveWishP(Authentication auth) {
		MemberDetails md = (MemberDetails) auth.getPrincipal();
		String m_email = md.getUsername();
		return new ModelAndView("purchase/wish-list","bookListInWish", service.getWishList(m_email));
	}
	
	@ResponseBody
	@GetMapping("addItem.do")
	public String addItemToWishList(WishVo wishVo) {
		//log.info(wishVo);
		return service.clickWishButton(wishVo);
	}
	
	@GetMapping("removeItem.do")
	public String removeItem(WishVo wishVo) {
		service.removeItem(wishVo);
		return "redirect: moveWishPage.do";
	}
	@GetMapping("moveCart.do")
	public String moveCart(CartVo cartVo, Authentication auth) {
		MemberDetails memberDetails = (MemberDetails) auth.getPrincipal();
		WishVo wishVo = new WishVo(cartVo.getItemId(), memberDetails.getUsername());
		service.removeItem(wishVo);
		log.info(cartVo);
		return "forward:../purchase/add.do";
	}
}

