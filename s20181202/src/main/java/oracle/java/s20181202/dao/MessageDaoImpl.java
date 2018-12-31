package oracle.java.s20181202.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int bookSendMsg(Message message) {
			
		int result = 0;
		
		try {
			result = session.insert("bookSendMsg", message);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
