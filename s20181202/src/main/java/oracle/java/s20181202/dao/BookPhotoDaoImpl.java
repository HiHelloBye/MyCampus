package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.BookPhoto;

@Repository
public class BookPhotoDaoImpl implements BookPhotoDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(BookPhoto bookphoto) {
		return session.insert("insertBookPhotoSell", bookphoto);
	}

	@Override
	public BookPhoto bookphoto(int book_no) {
		return session.selectOne("selectBookPhoto", book_no);
	}

}
