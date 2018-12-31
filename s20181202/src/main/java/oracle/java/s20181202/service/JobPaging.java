package oracle.java.s20181202.service;

public class JobPaging {
	private int currentJobPage = 1;
	private int rowJobPage = 10;
	private int pageJobBlock = 10;
	private int startJob;			private int endJob;
	private int startJobPage;		private int endJobPage;
	private int jobTotal;			private int totalJobPage;
	
	public JobPaging(int jobTotal, String currentJobPage1) {
		this.jobTotal = jobTotal;
		if(currentJobPage1 !=null) {
			this.currentJobPage = Integer.parseInt(currentJobPage1);
		}
		//
		startJob = (currentJobPage - 1)*rowJobPage + 1;				//시작시1
		endJob = startJob + rowJobPage-1;							//시작시10
		totalJobPage=(int) Math.ceil((double)jobTotal/rowJobPage);	//시작시2
		startJobPage = currentJobPage - (currentJobPage - 1) % pageJobBlock;	//시작시1
		//				1			10
		endJobPage = startJobPage+pageJobBlock-1;					//시작시10
		if(endJobPage> totalJobPage) {
			endJobPage = totalJobPage;							//시작2
		}
	}

	public int getCurrentJobPage() {
		return currentJobPage;
	}

	public void setCurrentJobPage(int currentJobPage) {
		this.currentJobPage = currentJobPage;
	}

	public int getRowJobPage() {
		return rowJobPage;
	}

	public void setRowJobPage(int rowJobPage) {
		this.rowJobPage = rowJobPage;
	}

	public int getPageJobBlock() {
		return pageJobBlock;
	}

	public void setPageJobBlock(int pageJobBlock) {
		this.pageJobBlock = pageJobBlock;
	}

	public int getStartJob() {
		return startJob;
	}

	public void setStartJob(int startJob) {
		this.startJob = startJob;
	}

	public int getEndJob() {
		return endJob;
	}

	public void setEndJob(int endJob) {
		this.endJob = endJob;
	}

	public int getStartJobPage() {
		return startJobPage;
	}

	public void setStartJobPage(int startJobPage) {
		this.startJobPage = startJobPage;
	}

	public int getEndJobPage() {
		return endJobPage;
	}

	public void setEndJobPage(int endJobPage) {
		this.endJobPage = endJobPage;
	}

	public int getJobTotal() {
		return jobTotal;
	}

	public void setJobTotal(int jobTotal) {
		this.jobTotal = jobTotal;
	}

	public int getTotalJobPage() {
		return totalJobPage;
	}

	public void setTotalJobPage(int totalJobPage) {
		this.totalJobPage = totalJobPage;
	}
	
}
