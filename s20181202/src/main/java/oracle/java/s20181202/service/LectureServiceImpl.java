package oracle.java.s20181202.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.LectureDao;
import oracle.java.s20181202.model.Lecture;
@Service
public class LectureServiceImpl implements LectureService {
	@Autowired
	private LectureDao ld;
	
	public int letureinsert(Lecture lecture) {
		return ld.letureinsert( lecture);
	}

	

	@Override
	public Lecture ldetail(int lec_no) {
		Lecture lecture = ld.ldetail(lec_no);
		return lecture;
	}
	@Override
	public List<Lecture> lecturelist(Lecture lecture) {
		
		return ld.lecturelist(lecture);
	}



	@Override
	public int lectureupdate(Lecture lecture) {
		// TODO Auto-generated method stub
		return ld.lectureupdate(lecture);
	}



	@Override
	public Lecture lecturedetail(int lec_no) {
		// TODO Auto-generated method stub
		Lecture lecture = ld.lecturedetail(lec_no);
		return lecture;
	}



	@Override
	public int lecturetotal() {
		// TODO Auto-generated method stub
		return ld.lecturetotal();
	}
}
