package bit.hibooks.domain.qboard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qfile {
	
	public long f_seq;
	public long qb_seq;
	public String f_fname;
	public String f_ofname;
	public long f_fsize;
	
}
