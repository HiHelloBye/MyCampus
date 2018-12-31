package oracle.java.s20181202.service;

public class Recipaging {
	private int currentPage = 1;
	private int rowPage = 100;
	private int pageBlock = 100;
	private int start;			private int end;
	private int startPage;		private int endPage;
	private int reci_total;			private int totalPage;
	
	public Recipaging(int send_total, String currentPage1) {
		this.reci_total = send_total;
		if(currentPage1 !=null) {
			this.currentPage = Integer.parseInt(currentPage1);
		}
		//
		start = (currentPage - 1)*rowPage + 1;				//시작시1
		end = start + rowPage-1;							//시작시10
		totalPage=(int) Math.ceil((double)reci_total/rowPage);	//시작시2
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
		return reci_total;
	}

	public void setTotal(int total) {
		this.reci_total = total;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
}
