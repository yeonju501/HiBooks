package bit.hibooks.domain.purchase;

import java.sql.Date;
import java.util.List;

import bit.hibooks.domain.book.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseResult {
	private long o_seq;
	private Date o_odate;
	private String b_title;
	private long o_paidAmount;
	private String o_shipNo;
}
