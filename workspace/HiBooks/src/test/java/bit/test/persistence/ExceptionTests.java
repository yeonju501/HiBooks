package bit.test.persistence;



import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.annotation.Resource;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.hibooks.domain.Member;
import bit.hibooks.mapper.MemberMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ExceptionTests {
	@Resource
	private MemberMapper mapper;
	
//	@Test
//	public void testException() {	
//		try {
//			Member member1 = new Member("aaa","aaa","aaa","aaa");
//			//Member member2 = new Member("aaa","aaa","aaa","aaa");
//			mapper.insertMember(member1);	// 
//			//mapper.insertMember(member2); 	// PK 중복 에러
//		}catch(DataAccessException e) {
//			Object obj = e.getRootCause();
//			if( obj instanceof DataIntegrityViolationException) {
//				log.info("#####이미 회원으로 등록된 이메일입니다, 다른 이메일을 입력해주세요");
//			}
//		}
//	}
}
