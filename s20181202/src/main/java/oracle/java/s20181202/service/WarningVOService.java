package oracle.java.s20181202.service;

import oracle.java.s20181202.controller.vo.WarningVO;

public interface WarningVOService {
	void insertWarning(WarningVO warningVO);
	int selectWarn(WarningVO warningVO);
	int selectWarnCnt(WarningVO warningVO);
	void updateWarnStudy(WarningVO warningVO);
	void updateWarnLec(WarningVO warningVO);
	int warnDelLec(WarningVO warningVO);
	int warnDelStu(WarningVO warningVO);
	
}
