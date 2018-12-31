package oracle.java.s20181202.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.controller.vo.WarningVO;
@Repository
public class WarningDaoImpl implements WarningDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public void insertWarning(WarningVO warningVO) {
		session.insert("insertWarning",warningVO);
	}
	@Override
	public int selectWarn(WarningVO warningVO) {
		return session.selectOne("selectWarn",warningVO);
	}
	@Override
	public void updateWarnStudy(WarningVO warningVO) {
		session.update("updateWarnStudy",warningVO);
	}	
	@Override
	public int selectWarnCnt(WarningVO warningVO) {
		return session.selectOne("selectWarnCnt",warningVO);
	}
	@Override
	public void updateWarnLec(WarningVO warningVO) {
		session.update("updateWarnLec",warningVO);		
	}
	@Override 
	public int warnDelLec(WarningVO vo1) {
		return session.delete("warnDelLec",vo1);		
	}
	@Override 
	public int warnDelStu(WarningVO warningVO) {
		return session.delete("warnDelStu",warningVO);		
	}
}
