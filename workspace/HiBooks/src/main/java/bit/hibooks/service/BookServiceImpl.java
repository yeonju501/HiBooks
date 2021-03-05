package bit.hibooks.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.book.BookListResult;
import bit.hibooks.domain.book.BookReview;
import bit.hibooks.domain.book.BookVo;
import bit.hibooks.domain.review.ReviewResult;
import bit.hibooks.domain.review.ReviewVo;
import bit.hibooks.mapper.BookMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {
	
	private BookMapper mapper;
	
	@Override
	public BookListResult getList(BookVo bookVo) {
		//log.info(bookVo.getCp() +" "+ bookVo.getPs());
		
		List<Book> bookList = mapper.getBookList(bookVo);
		long totalCnt = mapper.getTotalCnt();
		long novelCnt = mapper.getNovelCnt();
		long economyCnt = mapper.getEconomyCnt();
		long adviceCnt = mapper.getAdviceCnt();
		long humanCnt = mapper.getHumanCnt();
		long poemCnt = mapper.getPoemCnt();
		
		return new BookListResult(totalCnt, novelCnt, economyCnt, adviceCnt, 
					humanCnt, poemCnt, bookVo.getCp(), bookVo.getPs() , bookList, bookVo.getCate() );
	}

	@Override
	public Book getBook(String itemId) {
		return mapper.getBook(itemId);
	}
	
	@Override
	public ReviewResult getReviewList(ReviewVo reviewVo) {
		long reviewCnt = mapper.getReviewCnt(reviewVo);
		List<BookReview> reviewList = mapper.getReviewList(reviewVo);
		ReviewResult reviewResult = new ReviewResult(reviewVo.getRcp(), reviewVo.getRps(), reviewCnt, reviewList);
		return reviewResult;
	}
	
	@Override
	public ReviewResult writeReview(BookReview br, ReviewVo reviewVo) throws DataAccessException{
		br.setBr_ref(mapper.getMaxRef() + 1);
		mapper.insertReview(br);
		
		return getReviewList(reviewVo);
	}

	@Override
	public ReviewResult deleteReview(BookReview br, ReviewVo reviewVo) {
		mapper.deleteReview(br);
		reviewVo.setItemId(br.getB_itemId());
		return getReviewList(reviewVo);
	}

	@Override
	public ReviewResult updateReview(BookReview br, ReviewVo reviewVo) {
		mapper.updateReview(br);
		return getReviewList(reviewVo);
	}

	@Override
	public ReviewResult likeReview(BookReview br, ReviewVo reviewVo) {
		mapper.insertRecommend(br);
		mapper.updateLike(br);
		return getReviewList(reviewVo);
	}
}
