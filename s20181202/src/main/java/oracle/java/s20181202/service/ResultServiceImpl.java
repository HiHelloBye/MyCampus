package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.ResultDao;
import oracle.java.s20181202.model.Search;

@Service
public class ResultServiceImpl implements ResultService {
	@Autowired
	private ResultDao rd;
	
	@Override
	public List<Search> searchA(Search search) {
		return rd.searchA(search);
	}
	@Override
	public List<Search> searchB(Search search) {
		return rd.searchB(search);
	}
	@Override
	public List<Search> searchC(Search search) {
		return rd.searchC(search);
	}
	@Override
	public List<Search> SearchPhoto(Search search) {
		return rd.SearchPhoto(search);
	}
	@Override
	public int searchtotalA(String keyword) {
		return rd.searchtotalA(keyword);
	}
	@Override
	public int searchtotalB(String keyword) {
		return rd.searchtotalB(keyword);
	}
	@Override
	public int searchtotalC(String keyword) {
		return rd.searchtotalC(keyword);
	}
}
