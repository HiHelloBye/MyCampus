package oracle.java.s20181202.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.controller.vo.WarningVO;
import oracle.java.s20181202.dao.WarningDao;
@Service
public class WarningVOServiceImpl implements WarningVOService {
	@Autowired
	private WarningDao wd;
	@Override
	public void insertWarning(WarningVO warningVO) {
		wd.insertWarning(warningVO);
	}	
	@Override
	public int selectWarn(WarningVO warningVO) {
		return  wd.selectWarn(warningVO);
	}
	@Override
	public int selectWarnCnt(WarningVO warningVO) {
		return  wd.selectWarnCnt(warningVO);
	}
	@Override
	public void updateWarnStudy(WarningVO warningVO) {
		// TODO Auto-generated method stub
		 wd.updateWarnStudy(warningVO);
	}
	@Override
	public void updateWarnLec(WarningVO warningVO) {
		// TODO Auto-generated method stub
		wd.updateWarnLec(warningVO);
	}
	@Override 
	public int warnDelLec(WarningVO warningVO) {
		return wd.warnDelLec(warningVO);
		
	}
	@Override 
	public int warnDelStu(WarningVO warningVO) {
		return wd.warnDelStu(warningVO);		
	}
	
}
