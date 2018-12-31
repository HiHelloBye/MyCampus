package oracle.java.s20181202.model;

public class Search {
	public String code;
	public String keyword;
	public String prof_name;
	public String att_term;
	
	
	public String getAtt_term() {
		return att_term;
	}
	public void setAtt_term(String att_term) {
		this.att_term = att_term;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	public String getCode() {
		return code;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	private int study_no;
	private String study_type;
	private String study_title;
	private String study_writer;
	private String study_cont;
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
	private int lec_no;
	private int uni_no;
	private String lec_hw;
	private String lec_ratio;
	private String lec_attend;
	private String lec_exam;
	private String lec_review;
	private float lec_score;
	private int leceval_no;
	private float b;
	
	public float getB() {
		return b;
	}
	public void setB(float b) {
		this.b = b;
	}
	public int getLeceval_no() {
		return leceval_no;
	}
	public void setLeceval_no(int leceval_no) {
		this.leceval_no = leceval_no;
	}
	public int getLec_no() {
		return lec_no;
	}
	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	public int getUni_no() {
		return uni_no;
	}
	public void setUni_no(int uni_no) {
		this.uni_no = uni_no;
	}
	public String getLec_hw() {
		return lec_hw;
	}
	public void setLec_hw(String lec_hw) {
		this.lec_hw = lec_hw;
	}
	public String getLec_ratio() {
		return lec_ratio;
	}
	public void setLec_ratio(String lec_ratio) {
		this.lec_ratio = lec_ratio;
	}
	public String getLec_attend() {
		return lec_attend;
	}
	public void setLec_attend(String lec_attend) {
		this.lec_attend = lec_attend;
	}
	public String getLec_exam() {
		return lec_exam;
	}
	public void setLec_exam(String lec_exam) {
		this.lec_exam = lec_exam;
	}
	public String getLec_review() {
		return lec_review;
	}
	public void setLec_review(String lec_review) {
		this.lec_review = lec_review;
	}
	public float getLec_score() {
		return lec_score;
	}
	public void setLec_score(float lec_score) {
		this.lec_score = lec_score;
	}
	private int book_no;
	private String book_name;
	private String book_writer;
	private String book_pub;
	private String book_date;
	private int book_price;
	private int book_selling;
	private String book_cont1;
	private String book_cont2;
	private String book_met;
	private String book_cont;
	private int book_state;
	private int study_warn;
	private int study_state;
	
	
	public int getStudy_state() {
		return study_state;
	}
	public void setStudy_state(int study_state) {
		this.study_state = study_state;
	}
	public int getStudy_warn() {
		return study_warn;
	}
	public void setStudy_warn(int study_warn) {
		this.study_warn = study_warn;
	}
	public int getBook_state() {
		return book_state;
	}
	public void setBook_state(int book_state) {
		this.book_state = book_state;
	}
	private String book_photo1;
	
	public String getBook_photo1() {
		return book_photo1;
	}
	public void setBook_photo1(String book_photo1) {
		this.book_photo1 = book_photo1;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public int getBook_selling() {
		return book_selling;
	}
	public void setBook_selling(int book_selling) {
		this.book_selling = book_selling;
	}
	public String getBook_cont1() {
		return book_cont1;
	}
	public void setBook_cont1(String book_cont1) {
		this.book_cont1 = book_cont1;
	}
	public String getBook_cont2() {
		return book_cont2;
	}
	public void setBook_cont2(String book_cont2) {
		this.book_cont2 = book_cont2;
	}
	public String getBook_met() {
		return book_met;
	}
	public void setBook_met(String book_met) {
		this.book_met = book_met;
	}
	public String getBook_cont() {
		return book_cont;
	}
	public void setBook_cont(String book_cont) {
		this.book_cont = book_cont;
	}
	private String uni_name;
	private String lec_name;
	public String getUni_name() {
		return uni_name;
	}
	public String getLec_name() {
		return lec_name;
	}
	public void setUni_name(String uni_name) {
		this.uni_name = uni_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	
	private int start;
	private int end;
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
	
	private String currentPage;
	public String getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	
}
