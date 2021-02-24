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
	private String m_phone;
}
