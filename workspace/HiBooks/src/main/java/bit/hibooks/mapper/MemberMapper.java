package bit.hibooks.mapper;

import bit.hibooks.domain.Member;
import bit.hibooks.security.MemberDetails;

public interface MemberMapper {
	void insertMember(Member member);
	Member selectMemberInfo(Member member);
	void updateEnabled(Member member);
}
