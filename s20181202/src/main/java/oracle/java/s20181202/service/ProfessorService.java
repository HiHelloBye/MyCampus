package oracle.java.s20181202.service;

import java.util.List;

import oracle.java.s20181202.model.Professor;

public interface ProfessorService {

	int lectureupdatep(Professor professor);

	List<Professor> profList(Professor professor);

	int profInsert(Professor professor);

	int proftotal();

	Professor profDetail(int prof_no);

	int profUpate(Professor professor);

}
