package bit.hibooks.domain;

import java.sql.Date;

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
	private Date m_rdate;
	private String m_auth = "ROLE_USER";	// 시큐리티  as authority(security-context.xml에서 authority로 쓰인다)
	private int enabled=0;	// 시큐리티에서 필요한 컬럼
	private String m_mailAuth;
	private String m_zipNum;
	private String m_addr1;
	private String m_addr2;
	private String m_phone;
}
