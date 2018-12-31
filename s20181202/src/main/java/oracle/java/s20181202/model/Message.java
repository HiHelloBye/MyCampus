package oracle.java.s20181202.model;

import java.util.Date;

public class Message {
	private int 	msg_no;
	private String 	msg_sender;
	private String 	msg_reci;
	private Date 	msg_date;
	private String 	msg_cont;
	
	
	
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_reci() {
		return msg_reci;
	}
	public void setMsg_reci(String msg_reci) {
		this.msg_reci = msg_reci;
	}
	
	public String getMsg_cont() {
		return msg_cont;
	}
	public void setMsg_cont(String msg_cont) {
		this.msg_cont = msg_cont;
	}
	
}
