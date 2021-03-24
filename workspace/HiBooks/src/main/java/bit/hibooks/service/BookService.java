package bit.hibooks.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookListResult;
import bit.hibooks.domain.book.BookReview;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.domain.purchase.WishVo;
import bit.hibooks.domain.review.ReviewResult;
import bit.hibooks.domain.review.ReviewVo;

public interface BookService {
	BookListResult getList(BookVo bookVo);
	
	Book getBook(String itemId);
	// 페이지가 처음 로딩될 때는 댓글을 같이 리스팅한다.
	
	ReviewResult getReviewList(ReviewVo reviewVo); 
	
	// ajax이기 때문에 댓글을 작성,수정 할 때 마다 댓글을 다시 리스팅해준다.
	ReviewResult writeReview(BookReview br, ReviewVo reviewVo) throws DataAccessException;
	ReviewResult deleteReview(BookReview br, ReviewVo reviewVo);
	ReviewResult updateReview(BookReview br, ReviewVo reviewVo);
	ReviewResult likeReview(BookReview br, ReviewVo reviewVo);
	
	// 사용자별 위시리스트 품목 확인, 상세페이지에서
	String isBookInWish(WishVo wishVo);
	
	// 상세페이지에 추천항목 8개 가져오기, 작가의 책 가져오기
	List<Book> getRecommendedBook(String itemId);
	List<Book> getWriterBook(String itemId);
}
