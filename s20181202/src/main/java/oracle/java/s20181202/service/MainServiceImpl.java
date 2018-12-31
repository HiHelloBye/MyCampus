package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.MainDao;
import oracle.java.s20181202.model.*;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDao md;

	@Override
	public List<Book> MainBook(Book book) {
		return md.MainBook(book);
	}
	@Override
	public List<Study> MainStudy(Study study) {
		return md.MainStudy(study);
	}
	@Override
	public List<LectureEval> MainpageLec(LectureEval lecE) {
		return md.MainpageLec(lecE);
	}

	
}
