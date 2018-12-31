package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.Search;

@Repository
public class ResultDaoImpl implements ResultDao {
	@Autowired
	private SqlSession session;
	@Override
	public List<Search> searchA(Search search) {
		return session.selectList("SearchA",search);
	}
	@Override
	public List<Search> searchB(Search search) {
		return session.selectList("SearchB",search);
	}
	@Override
	public List<Search> searchC(Search search) {
		return session.selectList("SearchC",search);
	}
	@Override
	public List<Search> SearchPhoto(Search search) {
		return session.selectList("SearchPhoto",search);
	}
	@Override
	public int searchtotalA(String keyword) {
		return session.selectOne("searchtotalA",keyword);
	}
	@Override
	public int searchtotalB(String keyword) {
		return session.selectOne("searchtotalB",keyword);
	}
	@Override
	public int searchtotalC(String keyword) {
		return session.selectOne("searchtotalC",keyword);
	}
}
