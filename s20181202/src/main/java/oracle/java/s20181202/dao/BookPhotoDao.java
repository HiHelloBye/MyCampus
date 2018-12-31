package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.BookPhoto;

public interface BookPhotoDao {

	int insert(BookPhoto bookphoto);
	
	BookPhoto bookphoto(int book_no); 
}
