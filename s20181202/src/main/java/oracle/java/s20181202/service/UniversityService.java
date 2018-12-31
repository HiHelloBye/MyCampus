package oracle.java.s20181202.service;

import java.util.List;

import oracle.java.s20181202.model.University;

public interface UniversityService {

	int uinsert(University university);
	int adminunitotal();
	List<University> adminUniList(University university);
}
