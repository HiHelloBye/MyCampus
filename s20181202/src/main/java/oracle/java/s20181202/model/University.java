package oracle.java.s20181202.model;

public class University {
	private int uni_no;
	private String uni_name;
	
	// 조회용
	private String search;       private String keyword;
	private String pageNum;  
	private int start; 		     private int end;
	
	
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
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getUni_no() {
		return uni_no;
	}
	public void setUni_no(int uni_no) {
		this.uni_no = uni_no;
	}
	public String getUni_name() {
		return uni_name;
	}
	public void setUni_name(String uni_name) {
		this.uni_name = uni_name;
	}
	
}
