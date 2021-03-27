package bit.hibooks.domain.file;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardcFile {
	private long f_seq;
	private long b_seq;
	private String f_fname;
	private String f_ofname;
	private long f_size;
}
