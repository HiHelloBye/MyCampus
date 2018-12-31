package oracle.java.s20181202.service;


import oracle.java.s20181202.model.BookPhoto;

public interface BookPhotoService {

	int insert(BookPhoto bookphoto);
	
	BookPhoto bookphoto(int book_no);
}
