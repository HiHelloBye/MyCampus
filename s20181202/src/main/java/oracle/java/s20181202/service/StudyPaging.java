package oracle.java.s20181202.service;

public class StudyPaging {
	private int currentBoardPage = 1;
	private int rowPage = 10;
	private int pageBlock = 10;
	private int start;			private int end;
	private int startPage;		private int endPage;
	private int studyTotal;			private int totalPage;
	
	public StudyPaging(int studyTotal, String currentBoardPage1) {
		this.studyTotal = studyTotal;
		if(currentBoardPage1 !=null) {
			this.currentBoardPage = Integer.parseInt(currentBoardPage1);
		}
		//
		start = (currentBoardPage - 1)*rowPage + 1;				//시작시1
		end = start + rowPage-1;							//시작시10
		totalPage=(int) Math.ceil((double)studyTotal/rowPage);	//시작시2
		startPage = currentBoardPage - (currentBoardPage - 1) % pageBlock;	//시작시1
		//				1			10
		endPage = startPage+pageBlock-1;					//시작시10
		if(endPage> totalPage) {
			endPage = totalPage;							//시작2
		}
		System.out.println("start"+start);
		System.out.println("end"+end);
	}
	
	public int getCurrentBoardPage() {
		return currentBoardPage;
	}

	public void setCurrentBoardPage(int currentBoardPage) {
		this.currentBoardPage = currentBoardPage;
	}
	
	public int getRowPage() {
		return rowPage;
	}

	public void setRowPage(int rowPage) {
		this.rowPage = rowPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
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

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStudyTotal() {
		return studyTotal;
	}

	public void setStudyTotal(int studyTotal) {
		this.studyTotal = studyTotal;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
		
}
