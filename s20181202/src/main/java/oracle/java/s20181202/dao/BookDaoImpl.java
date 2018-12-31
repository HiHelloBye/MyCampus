package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.Book;
import oracle.java.s20181202.model.Message;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Book> booksellList(Book book) {
		return session.selectList("booksellListAll", book);
	}

	@Override
	public int booktotal() {
		
		return session.selectOne("booktotal");
	}

	@Override
	public List<Book> bookSearchList(String searchObj) {
		
		return session.selectList("bookSearchListAll", searchObj);
	}

	@Override
	public int insert(Book book) {
		
		return session.insert("insertBookSell", book);
	}

	@Override
	public Book detail(int book_no) {
		Book book = session.selectOne("detailBook", book_no);
		
		return book;
	}

	@Override
	public int updateSelling(Book book) {
		
		return session.update("updateSelling", book);
	}

	@Override
	public int updateCont(Book book) {
		
		return session.update("updateCont", book);
	}

	@Override
	public int updateBookState(Book book) {
		
		return session.update("updateBookState", book);
	}

	@Override
	public String bookFindMemNic(int member_no) {
		
		return session.selectOne("bookFindMemNic", member_no);
	}
	
}
