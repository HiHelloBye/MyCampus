package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.Lecture;
@Repository
public class LectureDaoImpl implements LectureDao {
	@Autowired SqlSession session;
	
	@Override
	public int letureinsert(Lecture lecture) {
		
		return session.insert("letureinsert" , lecture);
	}

	
	@Override
	public Lecture ldetail(int lec_no) {
		Lecture lecture  = session.selectOne("ldetail", lec_no);
		return lecture;
	}


	@Override
	public List<Lecture> lecturelist(Lecture lecture) {
		// TODO Auto-generated method stub
		return session.selectList("lecturelist" ,lecture);
	}

	@Override
	public int lecturetotal() {
		// TODO Auto-generated method stub
		return session.selectOne("lecturetotal");
	}


	@Override
	public int lectureupdate(Lecture lecture) {
	//	System.out.println("LectureDaoImpl lectureupdate ...");
		int kkk = 0;
        try {
      	    kkk = session.update("lectureupdate1", lecture);	
    		kkk = session.update("lectureupdate2", lecture);
		} catch (Exception e) {
		}
		return kkk;
	}

	@Override
	public Lecture lecturedetail(int lec_no) {

		Lecture lecture = new Lecture();
		try {
			  lecture = session.selectOne("lecturedetail" , lec_no);
			
		} catch (Exception e) {
		}
		return lecture;
	}
	
}
