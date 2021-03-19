package bit.hibooks.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.purchase.CartVo;
import bit.hibooks.service.CartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("purchase")
@AllArgsConstructor
public class CartController {
	private CartService service;
	
	@RequestMapping("add.do")
	public String addtoCart(CartVo cartVo, HttpSession session) {
		log.info(cartVo);
		List<CartVo> list = null;
		Object listObj=session.getAttribute("list");
		if(listObj==null) {
			list = new ArrayList<CartVo>();
		}else {
			list=(List<CartVo>)listObj;
		}
		String itemId= cartVo.getItemId();
		Book book= service.getBook(itemId);
		log.info(book);
		cartVo.setBook(book);
		int vol=cartVo.getVol();
		long price= book.getB_price();
		long total= vol*price;
		cartVo.setBook(book);
		cartVo.setTotal(total);
		list.add(cartVo);
		session.setAttribute("list",list);
		
		//CartListResult cartLR = new CartListResult(book,cartVo);
		//session.setAttribute("cartLR",cartLR);
		
		//return listCart(session);
		return "redirect:../purchase/cart.do";
	}
	
	@RequestMapping("cart.do")
	public String listCart(HttpSession session) {
		return "purchase/cart";
		
	}
	
	@RequestMapping("remove.do")
	public String removeCart(int index, HttpSession session) {
		List<CartVo> list=(List<CartVo>)session.getAttribute("list");
		list.remove(index);
		session.setAttribute("list", list);
		return "redirect:cart.do";
	}
	
	@RequestMapping("change.do")
	public String changeVol(int index,int vol, HttpSession session) {
		List<CartVo> list=(List<CartVo>)session.getAttribute("list");
		CartVo cartVo= list.get(index);
		cartVo.setVol(vol);
		long price=cartVo.getBook().getB_price();
		long total=vol*price;
		cartVo.setTotal(total);
		session.setAttribute("list", list);
		return "redirect:cart.do";
	}
	
	


}
