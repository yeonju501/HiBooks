package bit.hibooks.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookListResult;
import bit.hibooks.domain.book.BookReview;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.domain.review.ReviewResult;
import bit.hibooks.domain.review.ReviewVo;

public interface BookService {
	BookListResult getList(BookVo bookVo);
	
	Book getBook(String itemId);
	// 페이지가 처음 로딩될 때는 댓글을 같이 리스팅한다.
	
	ReviewResult getReviewList(ReviewVo reviewVo); 
	
	// ajax이기 때문에 댓글을 작성,수정 할 때 마다 댓글을 다시 리스팅해준다.
	ReviewResult writeReview(BookReview br, ReviewVo reviewVo) throws DataAccessException;
}
