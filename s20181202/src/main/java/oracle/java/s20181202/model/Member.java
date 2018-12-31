package oracle.java.s20181202.model;

import java.util.Date;

public class Member {
	private int member_no;
	private int member_grade;
	private String member_email;
	private String member_pw;
	private String member_nick;
	private int uni_no;
	private String member_photo;
	private Date reg_date;
	private Date log_date;
	private String approval_status;
	private String approval_key;
	
	// LECTUREEVAL 테이블	
	private int leceval_no;
	private String lec_review;
	private String att_term;
	private String lec_name;
	private int lec_score;
	private String prof_name;
	
	// BOOK 테이블
	private int book_no;
	private String book_name;
	private String book_selling;
	private String book_met;
	private String book_cont;
	private int book_state;
	private String book_photo1;
	
	// STUDY 테이블
	private int study_no;
	private String study_type;
	private String study_title;
	private String study_writer;
	private String study_cont;
	
	// UNIVERSITY 테이블
	private String uni_name;
	
	// 공용 테이블
	private int start;
	private int end;
	
	// MESSAGE 테이블
	private int msg_no;
	private String msg_sender;
	private String msg_reci;
	private int msg_sender_no;
	private int msg_reci_no;
	private String msg_date;
	private String msg_cont;

	
	public int getMsg_sender_no() {
		return msg_sender_no;
	}
	public void setMsg_sender_no(int msg_sender_no) {
		this.msg_sender_no = msg_sender_no;
	}
	public int getMsg_reci_no() {
		return msg_reci_no;
	}
	public void setMsg_reci_no(int msg_reci_no) {
		this.msg_reci_no = msg_reci_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public int getUni_no() {
		return uni_no;
	}
	public void setUni_no(int uni_no) {
		this.uni_no = uni_no;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getApproval_key() {
		return approval_key;
	}
	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}
	
	// LECTUREEVAL 테이블	
	
	public int getLeceval_no() {
		return leceval_no;
	}
	public void setLeceval_no(int leceval_no) {
		this.leceval_no = leceval_no;
	}
	public String getLec_review() {
		return lec_review;
	}

	public void setLec_review(String lec_review) {
		this.lec_review = lec_review;
	}
	public String getAtt_term() {
		return att_term;
	}
	public void setAtt_term(String att_term) {
		this.att_term = att_term;
	}
	
	// BOOK 테이블	
	
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	public int getLec_score() {
		return lec_score;
	}
	public void setLec_score(int lec_score) {
		this.lec_score = lec_score;
	}
	public String getLec_name() {
		return lec_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	
	public String getBook_cont() {
		return book_cont;
	}
	public void setBook_cont(String book_cont) {
		this.book_cont = book_cont;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_selling() {
		return book_selling;
	}
	public void setBook_selling(String book_selling) {
		this.book_selling = book_selling;
	}
	public String getBook_met() {
		return book_met;
	}
	public void setBook_met(String book_met) {
		this.book_met = book_met;
	}

	public int getBook_state() {
		return book_state;
	}
	public void setBook_state(int book_state) {
		this.book_state = book_state;
	}
	
	// STUDY 테이블	
	
	public String getBook_photo1() {
		return book_photo1;
	}
	public void setBook_photo1(String book_photo1) {
		this.book_photo1 = book_photo1;
	}
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getStudy_type() {
		return study_type;
	}
	public void setStudy_type(String study_type) {
		this.study_type = study_type;
	}
	public String getStudy_title() {
		return study_title;
	}
	public void setStudy_title(String study_title) {
		this.study_title = study_title;
	}
	public String getStudy_writer() {
		return study_writer;
	}
	public void setStudy_writer(String study_writer) {
		this.study_writer = study_writer;
	}
	public String getStudy_cont() {
		return study_cont;
	}
	public void setStudy_cont(String study_cont) {
		this.study_cont = study_cont;
	}
	
	// UNIVERSITY 테이블
	public String getUni_name() {
		return uni_name;
	}
	public void setUni_name(String uni_name) {
		this.uni_name = uni_name;
	}
	
	// 공용 테이블
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	// MESSAGE 테이블
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
	public String getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_cont() {
		return msg_cont;
	}
	public void setMsg_cont(String msg_cont) {
		this.msg_cont = msg_cont;
	}
	
}
