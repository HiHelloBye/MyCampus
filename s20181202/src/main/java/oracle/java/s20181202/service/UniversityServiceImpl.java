package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.dao.UniversityDao;
import oracle.java.s20181202.model.University;
@Repository
public class UniversityServiceImpl implements UniversityService {
	@Autowired
	private UniversityDao us;
	@Override
	public int uinsert(University university) {
		System.out.println("-----------11"+ university.getUni_name());
		return us.uinsert(university);
	}
	@Override
	public int adminunitotal() {
		// TODO Auto-generated method stub
		return us.adminunitotal();
	}
	@Override
	public List<University> adminUniList(University university) {
		// TODO Auto-generated method stub
		return us.adminUniList(university);
	}
	
}
