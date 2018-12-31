package oracle.java.s20181202.service;

public class JapPaging {
	private int currentJapPage = 1;
	private int rowJapPage = 10;
	private int pageJapBlock = 10;
	private int startJap;			private int endJap;
	private int startJapPage;		private int endJapPage;
	private int japTotal;			private int totalJapPage;
	
	public JapPaging(int japTotal, String currentJapPage1) {
		this.japTotal = japTotal;
		if(currentJapPage1 !=null) {
			this.currentJapPage = Integer.parseInt(currentJapPage1);
		}
		//
		startJap = (currentJapPage - 1)*rowJapPage + 1;				//시작시1
		endJap = startJap + rowJapPage-1;							//시작시10
		totalJapPage=(int) Math.ceil((double)japTotal/rowJapPage);	//시작시2
		startJapPage = currentJapPage - (currentJapPage - 1) % pageJapBlock;	//시작시1
		//				1			10
		endJapPage = startJapPage+pageJapBlock-1;					//시작시10
		if(endJapPage> totalJapPage) {
			endJapPage = totalJapPage;							//시작2
		}
	}

	public int getCurrentJapPage() {
		return currentJapPage;
	}

	public void setCurrentJapPage(int currentJapPage) {
		this.currentJapPage = currentJapPage;
	}

	public int getRowJapPage() {
		return rowJapPage;
	}

	public void setRowJapPage(int rowJapPage) {
		this.rowJapPage = rowJapPage;
	}

	public int getPageJapBlock() {
		return pageJapBlock;
	}

	public void setPageJapBlock(int pageJapBlock) {
		this.pageJapBlock = pageJapBlock;
	}

	public int getStartJap() {
		return startJap;
	}

	public void setStartJap(int startJap) {
		this.startJap = startJap;
	}

	public int getEndJap() {
		return endJap;
	}

	public void setEndJap(int endJap) {
		this.endJap = endJap;
	}

	public int getStartJapPage() {
		return startJapPage;
	}

	public void setStartJapPage(int startJapPage) {
		this.startJapPage = startJapPage;
	}

	public int getEndJapPage() {
		return endJapPage;
	}

	public void setEndJapPage(int endJapPage) {
		this.endJapPage = endJapPage;
	}

	public int getJapTotal() {
		return japTotal;
	}

	public void setJapTotal(int japTotal) {
		this.japTotal = japTotal;
	}

	public int getTotalJapPage() {
		return totalJapPage;
	}

	public void setTotalJapPage(int totalJapPage) {
		this.totalJapPage = totalJapPage;
	}

	
	
}
