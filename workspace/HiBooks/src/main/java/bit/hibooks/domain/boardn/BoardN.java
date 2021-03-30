package bit.hibooks.domain.boardn;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardN {
	private long bn_seq;	//pk
	private String bn_topic;
	private String bn_writer;
	private String bn_email;
	private String bn_subject;
	private String bn_content;
	private Date bn_rdate;
	private Date bn_udate;
	private long bn_count = 0;
}
