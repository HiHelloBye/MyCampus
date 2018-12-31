package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import oracle.java.s20181202.model.*;

@Repository
public class MainDaoImpl implements MainDao{
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Book> MainBook(Book book) {
		return session.selectList("MainBook",book);
	}
	@Override
	public List<Study> MainStudy(Study study) {
		return session.selectList("MainStudy",study);
	}
	@Override
	public List<LectureEval> MainpageLec(LectureEval lecE) {
		return session.selectList("MainpageLec",lecE);
	}
	
}
