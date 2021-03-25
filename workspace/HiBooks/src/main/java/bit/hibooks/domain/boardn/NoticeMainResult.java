package bit.hibooks.domain.boardn;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeMainResult {
	private long bn_seq;
	private String bn_topic;
	private String nf_fname;
}
