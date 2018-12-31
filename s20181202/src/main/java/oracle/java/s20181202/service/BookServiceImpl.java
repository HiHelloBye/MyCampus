package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.BookDao;
import oracle.java.s20181202.model.Book;
import oracle.java.s20181202.model.Message;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bd;

	@Override
	public List<Book> booksellList(Book book) {
		return bd.booksellList(book);
	}

	@Override
	public int booktotal() {
		return bd.booktotal();
	}

	@Override
	public List<Book> bookSearchList(String searchObj) {
		
		return bd.bookSearchList(searchObj);
	}

	@Override
	public int insert(Book book) {
		System.out.println("insert Start...");
		return bd.insert(book);
	}

	@Override
	public Book detail(int book_no) {
		
		Book book = bd.detail(book_no);
		
		return book;
	}

	@Override
	public int updateSelling(Book book) {
		
		return bd.updateSelling(book);
	}

	@Override
	public int updateCont(Book book) {
		
		return bd.updateCont(book);
	}

	@Override
	public int updateBookState(Book book) {
		
		return bd.updateBookState(book);
	}


	@Override
	public String bookFindMemNic(int member_no) {
		
		return bd.bookFindMemNic(member_no);
	}
	
}
