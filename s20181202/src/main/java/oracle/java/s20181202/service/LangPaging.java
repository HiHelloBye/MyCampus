package oracle.java.s20181202.service;

public class LangPaging {
	private int currentLangPage = 1;
	private int rowLangPage = 10;
	private int pageLangBlock = 10;
	private int startLang;			private int endLang;
	private int startLangPage;		private int endLangPage;
	private int langTotal;			private int totalLangPage;
	
	public LangPaging(int langTotal, String currentLangPage1) {
		this.langTotal = langTotal;
		if(currentLangPage1 !=null) {
			this.currentLangPage = Integer.parseInt(currentLangPage1);
		}
		//
		startLang = (currentLangPage - 1)*rowLangPage + 1;				//시작시1
		endLang = startLang + rowLangPage-1;							//시작시10
		totalLangPage=(int) Math.ceil((double)langTotal/rowLangPage);	//시작시2
		startLangPage = currentLangPage - (currentLangPage - 1) % pageLangBlock;	//시작시1
		//				1			10
		endLangPage = startLangPage+pageLangBlock-1;					//시작시10
		if(endLangPage> totalLangPage) {
			endLangPage = totalLangPage;							//시작2
		}
	}

	public int getCurrentLangPage() {
		return currentLangPage;
	}

	public void setCurrentLangPage(int currentLangPage) {
		this.currentLangPage = currentLangPage;
	}

	public int getRowLangPage() {
		return rowLangPage;
	}

	public void setRowLangPage(int rowLangPage) {
		this.rowLangPage = rowLangPage;
	}

	public int getPageLangBlock() {
		return pageLangBlock;
	}

	public void setPageLangBlock(int pageLangBlock) {
		this.pageLangBlock = pageLangBlock;
	}

	public int getStartLang() {
		return startLang;
	}

	public void setStartLang(int startLang) {
		this.startLang = startLang;
	}

	public int getEndLang() {
		return endLang;
	}

	public void setEndLang(int endLang) {
		this.endLang = endLang;
	}

	public int getStartLangPage() {
		return startLangPage;
	}

	public void setStartLangPage(int startLangPage) {
		this.startLangPage = startLangPage;
	}

	public int getEndLangPage() {
		return endLangPage;
	}

	public void setEndLangPage(int endLangPage) {
		this.endLangPage = endLangPage;
	}

	public int getLangTotal() {
		return langTotal;
	}

	public void setLangTotal(int langTotal) {
		this.langTotal = langTotal;
	}

	public int getTotalLangPage() {
		return totalLangPage;
	}

	public void setTotalLangPage(int totalLangPage) {
		this.totalLangPage = totalLangPage;
	}

		
}
