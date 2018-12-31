package oracle.java.s20181202.service;

import java.util.List;

import oracle.java.s20181202.model.Book;
import oracle.java.s20181202.model.Message;

public interface BookService {

	List<Book> booksellList(Book book);
	List<Book> bookSearchList(String searchObj);
	
	Book detail(int book_no);
	
	int booktotal();
	int insert(Book book);
	

	int updateSelling(Book book);
	int updateCont(Book book);
	int updateBookState(Book book);
	
	String bookFindMemNic(int member_no);
}
