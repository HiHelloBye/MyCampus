package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.Search;

public interface ResultDao {
	List<Search> searchA(Search search);
	List<Search> searchB(Search search);
	List<Search> searchC(Search search);
	List<Search> SearchPhoto(Search search);
	int searchtotalA(String keyword);
	int searchtotalB(String keyword);
	int searchtotalC(String keyword);
}
