package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.Lecture;

public interface LectureDao {

	int letureinsert(Lecture lecture);

	Lecture ldetail(int lec_no);
	List<Lecture> lecturelist(Lecture lecture);
	
	int lecturetotal();

	int lectureupdate(Lecture lecture);

	Lecture lecturedetail(int lec_no);
}
