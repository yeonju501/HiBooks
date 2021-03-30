package bit.hibooks.domain.review;

import java.util.List;

import bit.hibooks.domain.book.BookReview;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor

@Data
public class ReviewResult {
	private int rcp;
	private int rps;
	private long reviewCnt;
	private int totalPage;
	private List<BookReview> reviewList;
	
	public ReviewResult(int rcp, int rps, long reviewCnt, List<BookReview> reviewList) {
		
		this.rcp = rcp;
		this.rps = rps;
		this.reviewCnt = reviewCnt;
		this.reviewList = reviewList;
		this.totalPage = calTotalPage();
	} 
	
	private int calTotalPage() {
		int tp = Math.toIntExact(reviewCnt) / rps;
		if(Math.toIntExact(reviewCnt)% rps != 0) tp += 1;
		return tp; 
	}
}
