package bit.hibooks.domain.admin;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RecommendVo {
	
	private List<String> keyword;
	private List<String> cat;

}
