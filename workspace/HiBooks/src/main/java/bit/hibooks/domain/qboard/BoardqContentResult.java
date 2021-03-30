package bit.hibooks.domain.qboard;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardqContentResult {
	private Boardq boardq;
	private List<Qfile> flist;
}
