package bit.test.persistence;

import static bit.hibooks.setting.MemberModeSet.JOIN_F_EMAIL_EXIST;
import static bit.hibooks.setting.MemberModeSet.JOIN_SUCCESS;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.hibooks.domain.Member;
import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.mapper.BookMapper;
import bit.hibooks.mapper.MemberMapper;
import bit.hibooks.setting.MailUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml")

//JUNIT테스트에서 두개의 설정 파일을 설정해주는 방법, 배열 이용
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml",
			"file:src/main/webapp/WEB-INF/spring/root-context.xml"})


public class serviceTest {
	@Autowired
	private MemberMapper mapperM;
	@Autowired
	private BCryptPasswordEncoder bcryptPwdEncoder;
	@Autowired
	private JavaMailSenderImpl mailSender;
//	@Test
//	public void getList() {
//		BookVo bookVo = new BookVo(2, 20, 0);
//		log.info(bookVo.getCp() +" "+ bookVo.getPs());
//		
//		List<Book> bookList = mapper.getBookList(bookVo);
//		
//		log.info(bookList);
//		
//	}
	@Test
	public void join() {
		Member member = new Member();
		member.setM_email("tlsehddh802@gmail.com");
		member.setM_pwd("11111");
		member.setM_name("신동오");
		try{
			String encodedPwd = bcryptPwdEncoder.encode(member.getM_pwd());
			member.setM_pwd(encodedPwd);
			String emailAuth = sendAuthMail(member.getM_email());	// 인증메일 발송 
			log.info(emailAuth);
			member.setM_mailAuth(emailAuth);
			mapperM.insertMember(member);
			
		}catch(DataAccessException dae) {
			log.info(dae);
			
		}
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
            .append("<a href='http://localhost:9080/member/joinConfirm?m_email=")
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
