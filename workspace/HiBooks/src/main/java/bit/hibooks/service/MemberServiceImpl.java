package bit.hibooks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import bit.hibooks.domain.Member;
import bit.hibooks.mapper.MemberMapper;
import bit.hibooks.setting.MailUtils;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import static bit.hibooks.setting.MemberModeSet.*;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	private MemberMapper mapperM;
	private BCryptPasswordEncoder bcryptPwdEncoder;
	private JavaMailSenderImpl mailSender;
	
	@Override
	public int join(Member member) {
		try{
			String encodedPwd = bcryptPwdEncoder.encode(member.getM_pwd());
			member.setM_pwd(encodedPwd);
			String emailAuth = sendAuthMail(member.getM_email());	// 인증메일 발송 
			member.setM_mailAuth(emailAuth);
			mapperM.insertMember(member);
			return JOIN_SUCCESS;
		}catch(DataAccessException dae) {
			System.out.println(dae);
			return JOIN_F_EMAIL_EXIST;
		}
	}
	
	@Override
	public int loginCheck(Member member) {
		Member user = mapperM.selectMemberInfo(member);
		if(user == null) {
			//관리자 로그인 로직 만들기 // 스프링 시큐리티로 해결 가능!!!
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
	@Override
	public int checkMailAuth(Member member) {	// 이메일 인증시 계정 활성화
		Member memberChecked = mapperM.selectMemberInfo(member);
		String inputMailAuth = member.getM_mailAuth();
		String getMailAuth = memberChecked.getM_mailAuth();
		if(inputMailAuth.equals(getMailAuth)) {
			mapperM.updateEnabled(memberChecked);
			return MAIL_AUTH_SUCCESS;
		}else {
			return MAIL_AUTH_FAIL;
		}
	}
	@Override
	public int checkPwd(Member member) {
		String pwdGet = mapperM.selectMemberInfo(member).getM_pwd();
		if(bcryptPwdEncoder.matches(member.getM_pwd(), pwdGet)) {
			return UPDATE_ACCESS_SUC;
		}else {
			return UPDATE_ACCESS_FAIL;
		}
	}
	@Override
	public void updateMemberInfo(Member member) {
		mapperM.updateMember(member);
		
	}
	public void updatePwd(Member member) {
		String encodedPwd = bcryptPwdEncoder.encode(member.getM_pwd());
		member.setM_pwd(encodedPwd);
		System.out.println(encodedPwd);
		mapperM.updatePwd(member);
		
	}
	private String sendAuthMail(String email) {
		//6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost:8080/member/joinConfirm?m_email=")
            .append(email)
            .append("&m_mailAuth=")
            .append(authKey)
            .append("' target='_blenk'>이메일 인증 확인</a>")
            .toString());
            sendMail.setFrom("accForHibooks@gmail.com", "관리자");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
          return authKey;
    }
	private String getKey(int size) {
	    return getAuthCode(size);
	}
	private String getAuthCode(int size) {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;
        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }
        return buffer.toString();
    }
}
