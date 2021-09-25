package kr.ac.kopo.financial.vo;

public class SmsReportInfoVO {
	
	private String phone;
	private String storeName;
	private String name;
	private String businessNo;
	
	// 어제 날짜, 그저 께 날짜를 파라미터로 전달
	private String yesterday;
	private String dayBefore;
	
	// 받아온 값
	private int dayBeforeSum;
	private int yesterdaySum;
	private String dod;
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getStoreName() {
		return storeName;
	}



	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getBusinessNo() {
		return businessNo;
	}



	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}



	public String getYesterday() {
		return yesterday;
	}



	public void setYesterday(String yesterday) {
		this.yesterday = yesterday;
	}



	public String getDayBefore() {
		return dayBefore;
	}



	public void setDayBefore(String dayBefore) {
		this.dayBefore = dayBefore;
	}



	public int getDayBeforeSum() {
		return dayBeforeSum;
	}



	public void setDayBeforeSum(int dayBeforeSum) {
		this.dayBeforeSum = dayBeforeSum;
	}



	public int getYesterdaySum() {
		return yesterdaySum;
	}



	public void setYesterdaySum(int yesterdaySum) {
		this.yesterdaySum = yesterdaySum;
	}



	public String getDod() {
		return dod;
	}



	public void setDod(String dod) {
		this.dod = dod;
	}

	@Override
	public String toString() {
		return "SmsReportInfoVO [phone=" + phone + ", storeName=" + storeName + ", name=" + name + ", businessNo="
				+ businessNo + ", yesterday=" + yesterday + ", dayBefore=" + dayBefore + ", dayBeforeSum="
				+ dayBeforeSum + ", yesterdaySum=" + yesterdaySum + ", dod=" + dod + "]";
	}


	
	
	
}
