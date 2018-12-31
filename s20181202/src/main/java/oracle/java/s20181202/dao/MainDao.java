package oracle.java.s20181202.dao;

import java.util.List;
import oracle.java.s20181202.model.*;

public interface MainDao {
	
	List<Book> MainBook(Book book);
	List<Study> MainStudy(Study study);
	
	List<LectureEval> MainpageLec(LectureEval lecE);
}
