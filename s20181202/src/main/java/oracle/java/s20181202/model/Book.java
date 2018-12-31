package oracle.java.s20181202.model;

public class Book {
	private int 	book_no;
	private String 	book_name;
	private String 	book_writer;
	private String 	book_pub;
	private String 	book_date;
	private int 	book_price;
	private int 	book_selling;
	private String 	book_cont1;		// �긽�깭1
	private String 	book_cont2;		// �긽�깭2
	private String 	book_met;
	private String 	book_cont;		// �궡�슜
	private int 	book_state;		// �뙋留ㅼ셿猷뚯긽�깭
	private int 	member_no;
	
	
	//사진조회용
	private String book_photo1;
	
	//대학교이름용
	private String uni_name;
	
	//페이징 용
	private String 	search;       
	private String 	keyword;
	private String 	pageNum;  
	private int 	start; 		     
	private int 	end;
	
	

	public String getUni_name() {
		return uni_name;
	}
	public void setUni_name(String uni_name) {
		this.uni_name = uni_name;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	public String getBook_photo1() {
		return book_photo1;
	}
	public void setBook_photo1(String book_photo1) {
		this.book_photo1 = book_photo1;
	}
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int tart) {
		this.start = tart;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBook_state() {
		return book_state;
	}
	public void setBook_state(int book_state) {
		this.book_state = book_state;
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
	
}
