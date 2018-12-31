package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.University;

public interface UniversityDao {

	int uinsert(University university);
	
	int adminunitotal();
	List<University> adminUniList(University university);
}
