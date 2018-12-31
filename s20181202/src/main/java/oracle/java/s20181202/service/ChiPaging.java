package oracle.java.s20181202.service;

public class ChiPaging {
	private int currentChiPage = 1;
	private int rowChiPage = 10;
	private int pageChiBlock = 10;
	private int startChi;			private int endChi;
	private int startChiPage;		private int endChiPage;
	private int chiTotal;			private int totalChiPage;
	
	public ChiPaging(int chiTotal, String currentChiPage1) {
		this.chiTotal = chiTotal;
		if(currentChiPage1 !=null) {
			this.currentChiPage = Integer.parseInt(currentChiPage1);
		}
		//
		startChi = (currentChiPage - 1)*rowChiPage + 1;				//시작시1
		endChi = startChi + rowChiPage-1;							//시작시10
		totalChiPage=(int) Math.ceil((double)chiTotal/rowChiPage);	//시작시2
		startChiPage = currentChiPage - (currentChiPage - 1) % pageChiBlock;	//시작시1
		//				1			10
		endChiPage = startChiPage+pageChiBlock-1;					//시작시10
		if(endChiPage> totalChiPage) {
			endChiPage = totalChiPage;							//시작2
		}
		System.out.println("startChi"+startChi);
		System.out.println("endChi"+endChi);
	}

	public int getCurrentChiPage() {
		return currentChiPage;
	}

	public void setCurrentChiPage(int currentChiPage) {
		this.currentChiPage = currentChiPage;
	}

	public int getRowChiPage() {
		return rowChiPage;
	}

	public void setRowChiPage(int rowChiPage) {
		this.rowChiPage = rowChiPage;
	}

	public int getPageChiBlock() {
		return pageChiBlock;
	}

	public void setPageChiBlock(int pageChiBlock) {
		this.pageChiBlock = pageChiBlock;
	}

	public int getStartChi() {
		return startChi;
	}

	public void setStartChi(int startChi) {
		this.startChi = startChi;
	}

	public int getEndChi() {
		return endChi;
	}

	public void setEndChi(int endChi) {
		this.endChi = endChi;
	}

	public int getStartChiPage() {
		return startChiPage;
	}

	public void setStartChiPage(int startChiPage) {
		this.startChiPage = startChiPage;
	}

	public int getEndChiPage() {
		return endChiPage;
	}

	public void setEndChiPage(int endChiPage) {
		this.endChiPage = endChiPage;
	}

	public int getChiTotal() {
		return chiTotal;
	}

	public void setChiTotal(int chiTotal) {
		this.chiTotal = chiTotal;
	}

	public int getTotalChiPage() {
		return totalChiPage;
	}

	public void setTotalChiPage(int totalChiPage) {
		this.totalChiPage = totalChiPage;
	}
	
	
}
