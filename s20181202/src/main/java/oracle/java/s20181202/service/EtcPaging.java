package oracle.java.s20181202.service;

public class EtcPaging {
	private int currentEtcPage = 1;
	private int rowEtcPage = 10;
	private int pageEtcBlock = 10;
	private int startEtc;			private int endEtc;
	private int startEtcPage;		private int endEtcPage;
	private int etcTotal;			private int totalEtcPage;
	
	public EtcPaging(int etcTotal, String currentEtcPage1) {
		this.etcTotal = etcTotal;
		if(currentEtcPage1 !=null) {
			this.currentEtcPage = Integer.parseInt(currentEtcPage1);
		}
		//
		startEtc = (currentEtcPage - 1)*rowEtcPage + 1;				//시작시1
		endEtc = startEtc + rowEtcPage-1;							//시작시10
		totalEtcPage=(int) Math.ceil((double)etcTotal/rowEtcPage);	//시작시2
		startEtcPage = currentEtcPage - (currentEtcPage - 1) % pageEtcBlock;	//시작시1
		//				1			10
		endEtcPage = startEtcPage+pageEtcBlock-1;					//시작시10
		if(endEtcPage> totalEtcPage) {
			endEtcPage = totalEtcPage;							//시작2
		}
		System.out.println("etcTotal"+etcTotal);
		System.out.println("endEtc"+endEtc);
	}

	public int getCurrentEtcPage() {
		return currentEtcPage;
	}

	public void setCurrentEtcPage(int currentEtcPage) {
		this.currentEtcPage = currentEtcPage;
	}

	public int getRowEtcPage() {
		return rowEtcPage;
	}

	public void setRowEtcPage(int rowEtcPage) {
		this.rowEtcPage = rowEtcPage;
	}

	public int getPageEtcBlock() {
		return pageEtcBlock;
	}

	public void setPageEtcBlock(int pageEtcBlock) {
		this.pageEtcBlock = pageEtcBlock;
	}

	public int getStartEtc() {
		return startEtc;
	}

	public void setStartEtc(int startEtc) {
		this.startEtc = startEtc;
	}

	public int getEndEtc() {
		return endEtc;
	}

	public void setEndEtc(int endEtc) {
		this.endEtc = endEtc;
	}

	public int getStartEtcPage() {
		return startEtcPage;
	}

	public void setStartEtcPage(int startEtcPage) {
		this.startEtcPage = startEtcPage;
	}

	public int getEndEtcPage() {
		return endEtcPage;
	}

	public void setEndEtcPage(int endEtcPage) {
		this.endEtcPage = endEtcPage;
	}

	public int getEtcTotal() {
		return etcTotal;
	}

	public void setEtcTotal(int etcTotal) {
		this.etcTotal = etcTotal;
	}

	public int getTotalEtcPage() {
		return totalEtcPage;
	}

	public void setTotalEtcPage(int totalEtcPage) {
		this.totalEtcPage = totalEtcPage;
	}
	
	
		
}
