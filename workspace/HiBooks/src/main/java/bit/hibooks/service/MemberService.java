package bit.hibooks.service;

import bit.hibooks.domain.Member;

public interface MemberService {
	int join(Member member);
	int loginCheck(Member member);
	Member getMemberInfo(Member member);
	int checkMailAuth(Member member);
	int checkPwd(Member member);
	void updateMemberInfo(Member member);
	void updatePwd(Member member);
}
