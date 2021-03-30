package bit.hibooks.domain.cboard;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Boardc {	 
	private long cb_seq;
	private String m_email;
	private String cb_subject;
	private String cb_content;
	private Date cb_rdate;
	private long cb_count = 0;
	
	 /* private String f_ofname;
	 */
}
