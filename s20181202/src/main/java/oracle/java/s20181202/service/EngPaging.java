package oracle.java.s20181202.service;

public class EngPaging {
	private int currentEngPage = 1;
	private int rowEngPage = 10;
	private int pageEngBlock = 10;
	private int startEng;			private int endEng;
	private int startEngPage;		private int endEngPage;
	private int engTotal;			private int totalEngPage;
	
	public EngPaging(int engTotal, String currentEngPage1) {
		this.engTotal = engTotal;
		if(currentEngPage1 !=null) {
			this.currentEngPage = Integer.parseInt(currentEngPage1);
		}
		//
		startEng = (currentEngPage - 1)*rowEngPage + 1;				//시작시1
		endEng = startEng + rowEngPage-1;							//시작시10
		totalEngPage=(int) Math.ceil((double)engTotal/rowEngPage);	//시작시2
		startEngPage = currentEngPage - (currentEngPage - 1) % pageEngBlock;	//시작시1
		//				1			10
		endEngPage = startEngPage+pageEngBlock-1;					//시작시10
		if(endEngPage> totalEngPage) {
			endEngPage = totalEngPage;							//시작2
		}
		System.out.println("startEng"+startEng);
		System.out.println("endEng"+endEng);
	}

	public int getCurrentEngPage() {
		return currentEngPage;
	}

	public void setCurrentEngPage(int currentEngPage) {
		this.currentEngPage = currentEngPage;
	}

	public int getRowEngPage() {
		return rowEngPage;
	}

	public void setRowEngPage(int rowEngPage) {
		this.rowEngPage = rowEngPage;
	}

	public int getPageEngBlock() {
		return pageEngBlock;
	}

	public void setPageEngBlock(int pageEngBlock) {
		this.pageEngBlock = pageEngBlock;
	}

	public int getStartEng() {
		return startEng;
	}

	public void setStartEng(int startEng) {
		this.startEng = startEng;
	}

	public int getEndEng() {
		return endEng;
	}

	public void setEndEng(int endEng) {
		this.endEng = endEng;
	}

	public int getStartEngPage() {
		return startEngPage;
	}

	public void setStartEngPage(int startEngPage) {
		this.startEngPage = startEngPage;
	}

	public int getEndEngPage() {
		return endEngPage;
	}

	public void setEndEngPage(int endEngPage) {
		this.endEngPage = endEngPage;
	}

	public int getEngTotal() {
		return engTotal;
	}

	public void setEngTotal(int engTotal) {
		this.engTotal = engTotal;
	}

	public int getTotalEngPage() {
		return totalEngPage;
	}

	public void setTotalEngPage(int totalEngPage) {
		this.totalEngPage = totalEngPage;
	}
	
	
		
}
