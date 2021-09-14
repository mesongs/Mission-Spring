package kr.ac.kopo.financial.vo;

public class ReturnSalesVO {
	
//  db에서 처리한 결과값을 반환하는 VO
//	아래 두 개는 최근 7일간 카드사별 결제금액
	private String cardName;
	private int approvalAmount;
	private String dealDate;
	private String dealTime;
	private int dayBefore; // 전 전날 매출액
	private int yesterday; // 전 날 매출액
	private String dod; //증감률
	private String lastWeek; // 최근 7일 날짜
	private int lastWeekSales; // 최근 7일간 매출액 
	private String weekBeforeLast; // 지지난주 7일
	private int weekBeforeLastSales; // 지지난주 7일간 매출액
	private int morningSale;
	private int AFTERNOON1Sale;
	private int AFTERNOON2Sale;
	private int EVENINGSale;
	private String customerKind;
	private int customerCount;
	private int customerSale;
	
	private int lastLastMonthSales; 
	private int lastMonthSales;
	private String mom;
	
	public int getLastLastMonthSales() {
		return lastLastMonthSales;
	}
	public void setLastLastMonthSales(int lastLastMonthSales) {
		this.lastLastMonthSales = lastLastMonthSales;
	}
	public int getLastMonthSales() {
		return lastMonthSales;
	}
	public void setLastMonthSales(int lastMonthSales) {
		this.lastMonthSales = lastMonthSales;
	}
	public String getMom() {
		return mom;
	}
	public void setMom(String mom) {
		this.mom = mom;
	}
	public String getCustomerKind() {
		return customerKind;
	}
	public void setCustomerKind(String customerKind) {
		this.customerKind = customerKind;
	}
	public int getCustomerCount() {
		return customerCount;
	}
	public void setCustomerCount(int customerCount) {
		this.customerCount = customerCount;
	}
	public int getCustomerSale() {
		return customerSale;
	}
	public void setCustomerSale(int customerSale) {
		this.customerSale = customerSale;
	}
	public int getMorningSale() {
		return morningSale;
	}
	public void setMorningSale(int morningSale) {
		this.morningSale = morningSale;
	}
	public int getAFTERNOON1Sale() {
		return AFTERNOON1Sale;
	}
	public void setAFTERNOON1Sale(int aFTERNOON1Sale) {
		AFTERNOON1Sale = aFTERNOON1Sale;
	}
	public int getAFTERNOON2Sale() {
		return AFTERNOON2Sale;
	}
	public void setAFTERNOON2Sale(int aFTERNOON2Sale) {
		AFTERNOON2Sale = aFTERNOON2Sale;
	}
	public int getEVENINGSale() {
		return EVENINGSale;
	}
	public void setEVENINGSale(int eVENINGSale) {
		EVENINGSale = eVENINGSale;
	}
	public String getLastWeek() {
		return lastWeek;
	}
	public void setLastWeek(String lastWeek) {
		this.lastWeek = lastWeek;
	}
	public int getLastWeekSales() {
		return lastWeekSales;
	}
	public void setLastWeekSales(int lastWeekSales) {
		this.lastWeekSales = lastWeekSales;
	}
	public String getWeekBeforeLast() {
		return weekBeforeLast;
	}
	public void setWeekBeforeLast(String weekBeforeLast) {
		this.weekBeforeLast = weekBeforeLast;
	}
	public int getWeekBeforeLastSales() {
		return weekBeforeLastSales;
	}
	public void setWeekBeforeLastSales(int weekBeforeLastSales) {
		this.weekBeforeLastSales = weekBeforeLastSales;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	public String getDealTime() {
		return dealTime;
	}
	public void setDealTime(String dealTime) {
		this.dealTime = dealTime;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public int getApprovalAmount() {
		return approvalAmount;
	}
	public void setApprovalAmount(int approvalAmount) {
		this.approvalAmount = approvalAmount;
	}
	public int getDayBefore() {
		return dayBefore;
	}
	public void setDayBefore(int dayBefore) {
		this.dayBefore = dayBefore;
	}
	public int getYesterday() {
		return yesterday;
	}
	public void setYesterday(int yesterday) {
		this.yesterday = yesterday;
	}
	public String getDod() {
		return dod;
	}
	public void setDod(String dod) {
		this.dod = dod;
	}
	
	
	
}
