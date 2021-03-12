package bit.hibooks.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bit.hibooks.domain.admin.RecomListResult;
import bit.hibooks.domain.admin.RecommendVo;
import bit.hibooks.domain.book.Book;
import bit.hibooks.mapper.AdminMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
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


}
