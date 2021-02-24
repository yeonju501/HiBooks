package bit.hibooks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import bit.hibooks.domain.Member;
import bit.hibooks.mapper.MemberMapper;

import static bit.hibooks.setting.MemberModeSet.*;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapperM;
	
	@Override
	public int join(Member member) {
		try{
			mapperM.insertMember(member);
			return JOIN_SUCCESS;
		}catch(DataAccessException dae) {
			return JOIN_F_EMAIL_EXIST;
		}
	}
	@Override
	public int loginCheck(Member member) {
		Member user = mapperM.selectMemberInfo(member);
		if(user == null) {
			//관리자 로그인 로직 만들기 
			
			return LOGIN_F_NO_MEMBER; //아이디가 없음.
		}else {
			if(!user.getM_pwd().equals( member.getM_pwd() )) {
				return LOGIN_F_WRONG_PASSWORD; //비밀번호가 틀림
			}else if(user.getM_pwd().equals( member.getM_pwd() )){
				return LOGIN_SUCCESS; //로그인 성공
			}
		}
		return -1;
	}
	@Override
	public Member getMemberInfo(Member member) {
		Member loginUser = mapperM.selectMemberInfo(member);
		loginUser.setM_pwd(null);	// 회원정보 조회시 비밀번호 제거
		return loginUser;
	}

}
