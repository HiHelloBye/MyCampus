package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.BookPhotoDao;
import oracle.java.s20181202.model.BookPhoto;

@Service
public class BookPhotoServiceImpl implements BookPhotoService {

	@Autowired
	private BookPhotoDao bpd;
	
	@Override
	public int insert(BookPhoto bookphoto) {
		return bpd.insert(bookphoto);
	}

	@Override
	public BookPhoto bookphoto(int book_no) {
		
		BookPhoto bookphoto = bpd.bookphoto(book_no);
		
		return bookphoto;
	}

}
