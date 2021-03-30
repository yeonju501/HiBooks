package bit.hibooks.domain.qboard;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Boardq {
	public long qb_seq;
	public String m_email;
	public String qb_subject;
	public String qb_content;
	public Date qb_rdate;
	public long qb_count;
	public int qb_ref;
	public int qb_lev;
	public int qb_sun;
	public int qb_cat;
	
}
