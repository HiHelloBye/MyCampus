package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.ExamInfo;
@Repository
public class ExamInfoDaoImpl implements ExamInfoDao {
	@Autowired
	private SqlSession session;
	@Override
	public List<ExamInfo> ExamInfoDetail(ExamInfo examInfo) {
		// TODO Auto-generated method stub
		System.out.println("******ExamInfoDetail  Start...");
		return session.selectList("ExamInfoDetail",examInfo);
	}
	@Override
	public int insertExamInfo(ExamInfo examInfo) {
		// TODO Auto-generated method stub
		System.out.println("******insertExamInfo  Start...");
		return session.insert("insertExamInfo",examInfo);
	}
	
}
