package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.Professor;

public interface ProfessorDao {

	List<Professor> profList(Professor professor);

	int lectureupdatep(Professor professor);

	int profInsert(Professor professor);

	int proftotal();

	Professor profDetail(int prof_no);

	int profUpate(Professor professor);

}
