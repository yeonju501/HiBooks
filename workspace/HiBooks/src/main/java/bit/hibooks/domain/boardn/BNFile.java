package bit.hibooks.domain.boardn;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BNFile {
	private long nf_seq;	//pk
	private long bn_seq; 	// 참조키
	private String nf_fname;
	private String nf_ofname;
	private long nf_fsize;
}
