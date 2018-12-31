package oracle.java.s20181202.model;

public class ExamInfo {
	private int examinfo_no;
	private int lec_no;
	private int uni_no;
	private String exam_type;
	private String que_type;
	private String que_Ex;
	private String exam_strat;
	private String att_term;
	private int member_no;
	
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getExaminfo_no() {
		return examinfo_no;
	}
	public void setExaminfo_no(int examinfo_no) {
		this.examinfo_no = examinfo_no;
	}
	public String getAtt_term() {
		return att_term;
	}
	public void setAtt_term(String att_term) {
		this.att_term = att_term;
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
	public String getExam_type() {
		return exam_type;
	}
	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}
	public String getQue_type() {
		return que_type;
	}
	public void setQue_type(String que_type) {
		this.que_type = que_type;
	}
	public String getQue_Ex() {
		return que_Ex;
	}
	public void setQue_Ex(String que_Ex) {
		this.que_Ex = que_Ex;
	}
	public String getExam_strat() {
		return exam_strat;
	}
	public void setExam_strat(String exam_strat) {
		this.exam_strat = exam_strat;
	}
	
	
}
