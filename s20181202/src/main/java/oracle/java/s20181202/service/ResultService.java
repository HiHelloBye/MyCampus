package oracle.java.s20181202.service;

import java.util.List;

import oracle.java.s20181202.model.Search;

public interface ResultService {
	List<Search> searchA(Search search);
	List<Search> searchB(Search search);
	List<Search> searchC(Search search);
	List<Search> SearchPhoto(Search search);
	int searchtotalA(String keyword);
	int searchtotalB(String keyword);
	int searchtotalC(String keyword);
}
