package oracle.java.s20181202.model;

public class Lecture {
	private int lec_no;
	private int uni_no;
	private String lec_name;
	private int prof_no;
	private int total_score;
	private String prof_name;
	// 조회용
		      
	private int start; 		     private int end;
	
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
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
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
	public String getLec_name() {
		return lec_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public int getProf_no() {
		return prof_no;
	}
	public void setProf_no(int prof_no) {
		this.prof_no = prof_no;
	}
	
	
}
