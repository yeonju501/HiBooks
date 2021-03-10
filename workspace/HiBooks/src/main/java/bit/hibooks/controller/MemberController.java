package bit.hibooks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bit.hibooks.domain.Member;
import bit.hibooks.security.MemberDetails;
import bit.hibooks.service.MemberService;
import lombok.extern.log4j.Log4j;

import static bit.hibooks.setting.MemberModeSet.*;

@Log4j
@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("join.do")
	public String joinPage() {
		
		return "member/join";
	}
	@PostMapping("join.do")
	public ModelAndView join(Member member) {
		int joinCode = service.join(member);
		if(joinCode == JOIN_F_EMAIL_EXIST) {
			//log.info(joinCode);
			return new ModelAndView("member/join","joinCode", joinCode);	// 회원가입 실패 메세지
		}else if(joinCode == JOIN_SUCCESS){
			return new ModelAndView("member/login","joinCode", joinCode);	// 회원가입 성공, 이메일 인증 요구 메세지
		}
		return null;
	}
	@GetMapping("joinConfirm")
	public ModelAndView joinConfirm(Member member) {
		int joinCode = service.checkMailAuth(member);
		return new ModelAndView("member/login","joinCode",joinCode);	// 인증 성공, 또는 실패
	}
	@GetMapping("login.do")
	public String loginPage() {
		return "member/login";
	}
	@PostMapping("login.do")
	public void login() {
	}
	@PostMapping("logout.do")
	public void logout(){
	}
	@GetMapping("termPopup.do")
	public String popupTermPage() {
		return "member/term-popup";
	}
	@GetMapping("moveMyInfo.do")
	public String moveMyInfo() {
		return "member/my-info";
	}
	@RequestMapping("popup/jusoPopup.do")
	public String popupJusoPage() {
		return "popup/jusoPopup";
	}
	@GetMapping("moveUpdate.do")
	public String checkPwdPage() {
		return "member/my-info-pwd";
	}
	@PostMapping("moveUpdate.do")
	public ModelAndView updatePage(Member member) {
		int checkPwdCode = service.checkPwd(member);
		return new ModelAndView("member/my-info","checkPwdCode", checkPwdCode);
	}
	@PostMapping("updateMemberInfo.do")
	public ModelAndView updateMemberInfo(Member member, Authentication auth) {
		service.updateMemberInfo(member);
		MemberDetails md = (MemberDetails) auth.getPrincipal();
		md.setMember(member);
		
		int checkPwdCode = UPDATE_INFO_SUC;
		return new ModelAndView("member/my-info","checkPwdCode", checkPwdCode);
	}
	@PostMapping("updatePwd.do")
	public ModelAndView updatePwd(Member member, Authentication auth) {
		service.updatePwd(member);
		int checkPwdCode = UPDATE_PWD_SUC;
		return new ModelAndView("member/my-info","checkPwdCode",checkPwdCode);
	}
}
