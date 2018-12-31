package oracle.java.s20181202.service;

public class Sendpaging {
	private int currentPage = 1;
	private int rowPage = 100;
	private int pageBlock = 100;
	private int start;			private int end;
	private int startPage;		private int endPage;
	private int send_total;			private int totalPage;
	
	public Sendpaging(int send_total, String currentPage1) {
		this.send_total = send_total;
		if(currentPage1 !=null) {
			this.currentPage = Integer.parseInt(currentPage1);
		}
		//
		start = (currentPage - 1)*rowPage + 1;				//시작시1
		end = start + rowPage-1;							//시작시10
		totalPage=(int) Math.ceil((double)send_total/rowPage);	//시작시2
		startPage = currentPage - (currentPage - 1) % pageBlock;	//시작시1
		//				1			10
		endPage = startPage+pageBlock-1;					//시작시10
		if(endPage> totalPage) {
			endPage = totalPage;							//시작2
		}
		
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public int getTotal() {
		return send_total;
	}

	public void setTotal(int total) {
		this.send_total = total;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
}
