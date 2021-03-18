package bit.hibooks.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import bit.hibooks.domain.IndexListResult;
import bit.hibooks.domain.admin.RecomListResult;
import bit.hibooks.domain.admin.RecommendVo;
import bit.hibooks.domain.book.Book;
import bit.hibooks.mapper.AdminMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class RecommendServiceImpl implements RecommendService {
	private AdminMapper mapper;
	
	@Override
	public List<Book> getBookList(RecommendVo recommendVo) {
		
		List<Book> list=mapper.getBookList(recommendVo);
		return list;
		
		
	}
	
	@Override
	public Book getBook(long b_seq) {
		Book book = mapper.getBook(b_seq);
		return book;
	}
	
	@Override
	public void sendRecom(RecomListResult recomListResult) {
		mapper.insertRecom(recomListResult);
	}


	@Override
	public IndexListResult getSec() {
		RecomListResult recomLRSec1 = mapper.getSec(1);
		log.info(recomLRSec1.getRe_seq1());
		ArrayList<Book> list1 = new ArrayList <Book>();
		list1.add(mapper.getBook(recomLRSec1.getRe_seq1()));
		list1.add(mapper.getBook(recomLRSec1.getRe_seq2()));
		list1.add(mapper.getBook(recomLRSec1.getRe_seq3()));
		list1.add(mapper.getBook(recomLRSec1.getRe_seq4()));
		list1.add(mapper.getBook(recomLRSec1.getRe_seq5()));
		list1.add(mapper.getBook(recomLRSec1.getRe_seq6()));
		list1.add(mapper.getBook(recomLRSec1.getRe_seq7()));
		list1.add(mapper.getBook(recomLRSec1.getRe_seq8()));
		
		RecomListResult recomLRSec2 = mapper.getSec(2);
		ArrayList<Book> list2 = new ArrayList <Book>();
		list1.add(mapper.getBook(recomLRSec2.getRe_seq1()));
		list1.add(mapper.getBook(recomLRSec2.getRe_seq2()));
		list1.add(mapper.getBook(recomLRSec2.getRe_seq3()));
		list1.add(mapper.getBook(recomLRSec2.getRe_seq4()));
		list1.add(mapper.getBook(recomLRSec2.getRe_seq5()));
		list1.add(mapper.getBook(recomLRSec2.getRe_seq6()));
		list1.add(mapper.getBook(recomLRSec2.getRe_seq7()));
		list1.add(mapper.getBook(recomLRSec2.getRe_seq8()));
		return new IndexListResult(list1, list2);
		
		
		
	}

}
