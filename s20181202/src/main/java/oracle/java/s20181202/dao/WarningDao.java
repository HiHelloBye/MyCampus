package oracle.java.s20181202.dao;



import oracle.java.s20181202.controller.vo.WarningVO;

public interface WarningDao {
	void insertWarning(WarningVO warningVO);
	int selectWarn(WarningVO warningVO);
	void updateWarnStudy(WarningVO warningVO);
	int selectWarnCnt(WarningVO warningVO);
	void updateWarnLec(WarningVO warningVO);
	int warnDelLec(WarningVO warningVO);
	int warnDelStu(WarningVO warningVO);
}
