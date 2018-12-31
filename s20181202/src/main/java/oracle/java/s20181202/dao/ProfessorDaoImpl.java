package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.Professor;
@Repository
public class ProfessorDaoImpl implements ProfessorDao {
	@Autowired
	SqlSession session;
	@Override
	public int lectureupdatep(Professor professor) {
		return session.update("lectureupdatep", professor);
	}
	@Override
	public List<Professor> profList(Professor professor) {
		return session.selectList("profList", professor);
	}
	@Override
	public int profInsert(Professor professor) {
		return session.insert("profInsert", professor);
	}
	@Override
	public int proftotal() {
		// TODO Auto-generated method stub
		return session.selectOne("proftotal");
	}
	@Override
	public Professor profDetail(int prof_no) {
		System.out.println("ProfessorDaoImpl profDetail ..." + prof_no);

		Professor professor = session.selectOne("profDetail", prof_no);
		return professor;
	}
	@Override
	public int profUpate(Professor professor) {
		return session.update("profUpate", professor);
	}

}
