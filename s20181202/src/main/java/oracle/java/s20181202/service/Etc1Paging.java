package oracle.java.s20181202.service;

public class Etc1Paging {
	private int currentEtc1Page = 1;
	private int rowEtc1Page = 10;
	private int pageEtc1Block = 10;
	private int startEtc1;			private int endEtc1;
	private int startEtc1Page;		private int endEtc1Page;
	private int etc1Total;			private int totalEtc1Page;
	
	public Etc1Paging(int etc1Total, String currentEtc1Page1) {
		this.etc1Total = etc1Total;
		if(currentEtc1Page1 !=null) {
			this.currentEtc1Page = Integer.parseInt(currentEtc1Page1);
		}
		//
		startEtc1 = (currentEtc1Page - 1)*rowEtc1Page + 1;				//시작시1
		endEtc1 = startEtc1 + rowEtc1Page-1;							//시작시10
		totalEtc1Page=(int) Math.ceil((double)etc1Total/rowEtc1Page);	//시작시2
		startEtc1Page = currentEtc1Page - (currentEtc1Page - 1) % pageEtc1Block;	//시작시1
		//				1			10
		endEtc1Page = startEtc1Page+pageEtc1Block-1;					//시작시10
		if(endEtc1Page> totalEtc1Page) {
			endEtc1Page = totalEtc1Page;							//시작2
		}
		System.out.println("startEtc1"+startEtc1);
		System.out.println("endEtc1"+endEtc1);
	}

	public int getCurrentEtc1Page() {
		return currentEtc1Page;
	}

	public void setCurrentEtc1Page(int currentEtc1Page) {
		this.currentEtc1Page = currentEtc1Page;
	}

	public int getRowEtc1Page() {
		return rowEtc1Page;
	}

	public void setRowEtc1Page(int rowEtc1Page) {
		this.rowEtc1Page = rowEtc1Page;
	}

	public int getPageEtc1Block() {
		return pageEtc1Block;
	}

	public void setPageEtc1Block(int pageEtc1Block) {
		this.pageEtc1Block = pageEtc1Block;
	}

	public int getStartEtc1() {
		return startEtc1;
	}

	public void setStartEtc1(int startEtc1) {
		this.startEtc1 = startEtc1;
	}

	public int getEndEtc1() {
		return endEtc1;
	}

	public void setEndEtc1(int endEtc1) {
		this.endEtc1 = endEtc1;
	}

	public int getStartEtc1Page() {
		return startEtc1Page;
	}

	public void setStartEtc1Page(int startEtc1Page) {
		this.startEtc1Page = startEtc1Page;
	}

	public int getEndEtc1Page() {
		return endEtc1Page;
	}

	public void setEndEtc1Page(int endEtc1Page) {
		this.endEtc1Page = endEtc1Page;
	}

	public int getEtc1Total() {
		return etc1Total;
	}

	public void setEtc1Total(int etc1Total) {
		this.etc1Total = etc1Total;
	}

	public int getTotalEtc1Page() {
		return totalEtc1Page;
	}

	public void setTotalEtc1Page(int totalEtc1Page) {
		this.totalEtc1Page = totalEtc1Page;
	}
	
		
}
