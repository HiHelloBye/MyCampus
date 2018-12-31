package oracle.java.s20181202.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.MessageDao;
import oracle.java.s20181202.model.Message;

@Service
public class MessageServiceImpl implements MessageService {


	@Autowired
	private MessageDao md;
	
	@Override
	public int bookSendMsg(Message message) {
		return md.bookSendMsg(message);
	}


}
