package oracle.java.s20181202.model;

public class Professor {
	private int prof_no;
	private int uni_no;
	private String prof_name;
	//페이지
	private int start; 		     public int getStart() {
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
	private int end;
	public int getProf_no() {
		return prof_no;
	}
	public void setProf_no(int prof_no) {
		this.prof_no = prof_no;
	}
	public int getUni_no() {
		return uni_no;
	}
	public void setUni_no(int uni_no) {
		this.uni_no = uni_no;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	
}
