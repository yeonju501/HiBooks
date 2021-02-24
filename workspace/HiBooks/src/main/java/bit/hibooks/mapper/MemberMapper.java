package bit.hibooks.mapper;

import bit.hibooks.domain.Member;

public interface MemberMapper {
	void insertMember(Member member);
	Member selectMemberInfo(Member member);
}
