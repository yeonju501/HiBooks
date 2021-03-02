package bit.hibooks.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private String m_email;
	private String m_pwd;
	private String m_name;
	private String m_auth = "ROLE_USER";	// 시큐리티  as authority(security-context.xml에서 authority로 쓰인다)
	private int enabled;	// 시큐리티에서 필요한 컬럼
}
