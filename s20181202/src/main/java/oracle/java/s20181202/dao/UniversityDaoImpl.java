package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.University;
@Repository
public class UniversityDaoImpl implements UniversityDao {
	@Autowired
	private SqlSession session;
	@Override
	public int uinsert(University university) {
		System.out.println("-----------22"+ university.getUni_name());

		return session.insert("uinsert", university);
	}
	@Override
	public int adminunitotal() {
		// TODO Auto-generated method stub
		return session.selectOne("adminunitotal");
	}
	@Override
	public List<University> adminUniList(University university) {
		// TODO Auto-generated method stub
		return session.selectList("adminUniList",university);
	}
	
}
