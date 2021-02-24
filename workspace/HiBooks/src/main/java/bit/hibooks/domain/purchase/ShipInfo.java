package bit.hibooks.domain.purchase;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShipInfo {
	private String m_email;
	private long o_seq;
	private String s_addr;
	private String s_name;
	private String s_msg;
	private String s_phone;
}
