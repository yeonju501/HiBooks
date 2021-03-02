package bit.hibooks.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import bit.hibooks.domain.Member;
import bit.hibooks.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemberDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String m_email) throws UsernameNotFoundException {
		Member member = new Member();
		member.setM_email(m_email);
		member = mapper.selectMemberInfo(member);
		if(member == null) throw new UsernameNotFoundException("없는 이메일");
		MemberDetails user = new MemberDetails(member); 
		return user;
	}

}
