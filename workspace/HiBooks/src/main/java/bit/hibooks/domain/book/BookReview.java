package bit.hibooks.domain.book;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookReview {
	private long br_seq;
	private String b_itemId;
	private String m_email;
	private String br_comment;
	private double br_rate;
	private Date br_rDate;
	private Date br_uDate;
	private int br_like;
	private long br_ref;
	private long br_lev;
	private long br_sun;
}
