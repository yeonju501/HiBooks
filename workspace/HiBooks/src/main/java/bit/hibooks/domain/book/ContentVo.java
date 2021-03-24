package bit.hibooks.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContentVo {
	private String b_itemId;
	private int b_cate;
	private String keyword1;
	private String keyword2;
	private String keyword3;
	private String keyword4;
	private String keyword5;
	private int number = 8;
	//
	private String b_writer;
	/*select * from book where B_CATE= 300 and not B_ITEMID = '754023439' and
		    (B_KEYWORD like '%봄%' and
		    B_KEYWORD like '%레이첼 카슨%' or
		    B_KEYWORD like '%에코리브르%' or
		    B_KEYWORD like '%영향력%' and
		    B_KEYWORD like '%침묵%')
		    order by b_seq;*/
}
