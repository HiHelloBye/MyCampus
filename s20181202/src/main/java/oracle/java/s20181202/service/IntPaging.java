package oracle.java.s20181202.service;

public class IntPaging {
	private int currentIntPage = 1;
	private int rowIntPage = 10;
	private int pageIntBlock = 10;
	private int startInt;			private int endInt;
	private int startIntPage;		private int endIntPage;
	private int intTotal;			private int totalIntPage;
	
	public IntPaging(int intTotal, String currentIntPage1) {
		this.intTotal = intTotal;
		if(currentIntPage1 !=null) {
			this.currentIntPage = Integer.parseInt(currentIntPage1);
		}
		//
		startInt = (currentIntPage - 1)*rowIntPage + 1;				//시작시1
		endInt = startInt + rowIntPage-1;							//시작시10
		totalIntPage=(int) Math.ceil((double)intTotal/rowIntPage);	//시작시2
		startIntPage = currentIntPage - (currentIntPage - 1) % pageIntBlock;	//시작시1
		//				1			10
		endIntPage = startIntPage+pageIntBlock-1;					//시작시10
		if(endIntPage> totalIntPage) {
			endIntPage = totalIntPage;							//시작2
		}
		System.out.println("startInt"+startInt);
		System.out.println("endInt"+endInt);
	}

	public int getCurrentIntPage() {
		return currentIntPage;
	}

	public void setCurrentIntPage(int currentIntPage) {
		this.currentIntPage = currentIntPage;
	}

	public int getRowIntPage() {
		return rowIntPage;
	}

	public void setRowIntPage(int rowIntPage) {
		this.rowIntPage = rowIntPage;
	}

	public int getPageIntBlock() {
		return pageIntBlock;
	}

	public void setPageIntBlock(int pageIntBlock) {
		this.pageIntBlock = pageIntBlock;
	}

	public int getStartInt() {
		return startInt;
	}

	public void setStartInt(int startInt) {
		this.startInt = startInt;
	}

	public int getEndInt() {
		return endInt;
	}

	public void setEndInt(int endInt) {
		this.endInt = endInt;
	}

	public int getStartIntPage() {
		return startIntPage;
	}

	public void setStartIntPage(int startIntPage) {
		this.startIntPage = startIntPage;
	}

	public int getEndIntPage() {
		return endIntPage;
	}

	public void setEndIntPage(int endIntPage) {
		this.endIntPage = endIntPage;
	}

	public int getIntTotal() {
		return intTotal;
	}

	public void setIntTotal(int intTotal) {
		this.intTotal = intTotal;
	}

	public int getTotalIntPage() {
		return totalIntPage;
	}

	public void setTotalIntPage(int totalIntPage) {
		this.totalIntPage = totalIntPage;
	}
	
		
}
