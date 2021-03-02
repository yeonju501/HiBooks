package bit.hibooks.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import bit.hibooks.domain.Member;

@SuppressWarnings("serial")
public class MemberDetails implements UserDetails {
	
	private Member member;
	
	public MemberDetails(Member member) {
		this.member = member;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		authList.add(new SimpleGrantedAuthority(member.getM_auth()));
		return authList;
	}

	@Override
	public String getPassword() {
		return member.getM_pwd();
	}

	@Override
	public String getUsername() {
		return member.getM_email();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return member.getEnabled()==1?true:false;
	}
	
	// 회원정보를 불러와야할 경우
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}

}
