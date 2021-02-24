package bit.hibooks.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bit.hibooks.domain.book.Book;
import bit.hibooks.domain.search.SearchListResult;
import bit.hibooks.domain.search.SearchVo;
import bit.hibooks.mapper.SearchMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {
	private SearchMapper searchMapper;
	
	@Override
	public SearchListResult getSearchListResult(String keyword, int cp, int ps) {
		long totalCount = searchMapper.selectCount(keyword);
		SearchVo searchVo = new SearchVo(keyword,cp,ps);
		List<Book> list = searchMapper.selectByKey(searchVo);
		return new SearchListResult(cp,totalCount,ps,list);
	}
	
	@Override
	public List<Book> getAuto(String keyword){
		int cp=1;
		int ps=6;
		SearchVo searchVo = new SearchVo(keyword,cp,ps);
		List<Book> list = searchMapper.selectAuto(searchVo);
		return list;
		
	}
	

}
