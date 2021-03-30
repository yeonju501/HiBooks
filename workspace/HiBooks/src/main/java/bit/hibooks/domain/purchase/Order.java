package bit.hibooks.domain.purchase;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	private long o_seq;
	private String m_email;
	private int o_status;
	private Date o_odate;
	private String o_paytype;
	private String o_shipno;
	private long o_paidAmount;
}
