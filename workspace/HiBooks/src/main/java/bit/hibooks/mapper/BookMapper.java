package bit.hibooks.mapper;

import java.util.ArrayList;
import java.util.List;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookReview;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.domain.book.ContentVo;
import bit.hibooks.domain.review.ReviewVo;

public interface BookMapper {
	
	void insertBookInfo(Book book);
	
	//리스트페이지
	ArrayList<Book> getBookList(BookVo bookVo);
	long getTotalCnt();
	long getNovelCnt();
	long getEconomyCnt();
	long getAdviceCnt();
	long getHumanCnt();
	long getPoemCnt();
	
	//상품상세페이지
	Book getBook(String itemId);
	ArrayList<BookReview> getReviewList(ReviewVo reviewVo);
	long getReviewCnt(ReviewVo reviewVo);
	List<Book> selectRecommendList(ContentVo contentVo);
	List<Book> selectWriterList(ContentVo contentVo);
	
	//댓글 ajax
	long getMaxRef();
	void insertReview(BookReview br);
	void deleteReview(BookReview br);
	void updateReview(BookReview br);
	void insertRecommend(BookReview br);
	void updateLike(BookReview br);

	
}
