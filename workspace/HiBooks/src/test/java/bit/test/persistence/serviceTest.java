package bit.test.persistence;

import static bit.hibooks.setting.MemberModeSet.JOIN_F_EMAIL_EXIST;
import static bit.hibooks.setting.MemberModeSet.JOIN_SUCCESS;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.hibooks.domain.Member;
import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.mapper.BookMapper;
import bit.hibooks.mapper.MemberMapper;
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
	private BCryptPasswordEncoder bpe;
	
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
		try{
			Member member = new Member("aaa","aaa","신동오","ㄴㄴㄴ",1);
			String encodedPwd = bpe.encode(member.getM_pwd());
			log.info(encodedPwd);
			member.setM_pwd(encodedPwd);
			
			mapperM.insertMember(member);
			
		}catch(DataAccessException dae) {
			
		}
	}
}
