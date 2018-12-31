package oracle.java.s20181202.service;

public class TesPaging {
	private int currentTesPage = 1;
	private int rowTesPage = 10;
	private int pageTesBlock = 10;
	private int startTes;			private int endTes;
	private int startTesPage;		private int endTesPage;
	private int tesTotal;			private int totalTesPage;
	
	public TesPaging(int tesTotal, String currentTesPage1) {
		this.tesTotal = tesTotal;
		if(currentTesPage1 !=null) {
			this.currentTesPage = Integer.parseInt(currentTesPage1);
		}
		//
		startTes = (currentTesPage - 1)*rowTesPage + 1;				//시작시1
		endTes = startTes + rowTesPage-1;							//시작시10
		totalTesPage=(int) Math.ceil((double)tesTotal/rowTesPage);	//시작시2
		startTesPage = currentTesPage - (currentTesPage - 1) % pageTesBlock;	//시작시1
		//				1			10
		endTesPage = startTesPage+pageTesBlock-1;					//시작시10
		if(endTesPage> totalTesPage) {
			endTesPage = totalTesPage;							//시작2
		}
		System.out.println("startTes"+startTes);
		System.out.println("endTes"+endTes);
	}

	public int getCurrentTesPage() {
		return currentTesPage;
	}

	public void setCurrentTesPage(int currentTesPage) {
		this.currentTesPage = currentTesPage;
	}

	public int getRowTesPage() {
		return rowTesPage;
	}

	public void setRowTesPage(int rowTesPage) {
		this.rowTesPage = rowTesPage;
	}

	public int getPageTesBlock() {
		return pageTesBlock;
	}

	public void setPageTesBlock(int pageTesBlock) {
		this.pageTesBlock = pageTesBlock;
	}

	public int getStartTes() {
		return startTes;
	}

	public void setStartTes(int startTes) {
		this.startTes = startTes;
	}

	public int getEndTes() {
		return endTes;
	}

	public void setEndTes(int endTes) {
		this.endTes = endTes;
	}

	public int getStartTesPage() {
		return startTesPage;
	}

	public void setStartTesPage(int startTesPage) {
		this.startTesPage = startTesPage;
	}

	public int getEndTesPage() {
		return endTesPage;
	}

	public void setEndTesPage(int endTesPage) {
		this.endTesPage = endTesPage;
	}

	public int getTesTotal() {
		return tesTotal;
	}

	public void setTesTotal(int tesTotal) {
		this.tesTotal = tesTotal;
	}

	public int getTotalTesPage() {
		return totalTesPage;
	}

	public void setTotalTesPage(int totalTesPage) {
		this.totalTesPage = totalTesPage;
	}
	
}
