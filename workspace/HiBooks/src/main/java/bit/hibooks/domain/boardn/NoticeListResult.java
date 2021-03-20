package bit.hibooks.domain.boardn;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeListResult {
	ArrayList<BoardN> list;
}
