package oracle.java.s20181202.service;

import java.util.List;

import oracle.java.s20181202.model.Lecture;

public interface LectureService {

	int letureinsert(Lecture lecture);

	Lecture ldetail(int lec_no);

	List<Lecture> lecturelist(Lecture lecture);
	

	int lectureupdate(Lecture lecture);

	Lecture lecturedetail(int lec_no);



	int lecturetotal();

}
