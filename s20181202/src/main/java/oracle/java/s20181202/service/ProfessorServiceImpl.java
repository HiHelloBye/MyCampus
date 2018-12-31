package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.ProfessorDao;
import oracle.java.s20181202.model.Professor;

@Service
public class ProfessorServiceImpl implements ProfessorService {
@Autowired
ProfessorDao pd;

@Override
public int lectureupdatep(Professor professor) {
	
	return pd.lectureupdatep(professor);
}

@Override
public List<Professor> profList(Professor professor) {
	return pd.profList(professor);
}

@Override
public int profInsert(Professor professor) {
	return pd.profInsert(professor);
}



@Override
public int proftotal() {
	// TODO Auto-generated method stub
	return pd.proftotal();
}

@Override
public Professor profDetail(int prof_no) {
	Professor professor = pd.profDetail(prof_no);
	System.out.println("----profDetail------" + prof_no);
	
	return professor;
}

@Override
public int profUpate(Professor professor) {
	return pd.profUpate(professor);
}


}
