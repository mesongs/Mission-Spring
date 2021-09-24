package kr.ac.kopo.taxAgent.vo;

public class TaxBillVO {

	// 수기, 전자 세금계산서
	private String digitalSupplierBNo;
	private String digitalStoreName;
	private int digitalAmount;
	private int digitalVat;
	
	// 전자 계산서 count, sum
	private int digitalTaxBillCount;
	private int digitalAmountSum;
	private int digitalVatSum;
	
	// 수기 계산서 List
	private int no;
	private String hrSupplierBNo;
	private String hrStoreName;
	private int hrAmount;
	private int hrVat;

	// 수기 계산서 count, sum
	private int hrTaxBillCount;
	private int hrAmountSum;
	private int hrVatSum;
	
	public int getDigitalTaxBillCount() {
		return digitalTaxBillCount;
	}
	public void setDigitalTaxBillCount(int digitalTaxBillCount) {
		this.digitalTaxBillCount = digitalTaxBillCount;
	}
	public int getDigitalAmountSum() {
		return digitalAmountSum;
	}
	public void setDigitalAmountSum(int digitalAmountSum) {
		this.digitalAmountSum = digitalAmountSum;
	}
	public int getDigitalVatSum() {
		return digitalVatSum;
	}
	public void setDigitalVatSum(int digitalVatSum) {
		this.digitalVatSum = digitalVatSum;
	}
	public int getHrTaxBillCount() {
		return hrTaxBillCount;
	}
	public void setHrTaxBillCount(int hrTaxBillCount) {
		this.hrTaxBillCount = hrTaxBillCount;
	}
	public int getHrAmountSum() {
		return hrAmountSum;
	}
	public void setHrAmountSum(int hrAmountSum) {
		this.hrAmountSum = hrAmountSum;
	}
	public int getHrVatSum() {
		return hrVatSum;
	}
	public void setHrVatSum(int hrVatSum) {
		this.hrVatSum = hrVatSum;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getHrSupplierBNo() {
		return hrSupplierBNo;
	}
	public void setHrSupplierBNo(String hrSupplierBNo) {
		this.hrSupplierBNo = hrSupplierBNo;
	}
	public String getHrStoreName() {
		return hrStoreName;
	}
	public void setHrStoreName(String hrStoreName) {
		this.hrStoreName = hrStoreName;
	}
	public int getHrAmount() {
		return hrAmount;
	}
	public void setHrAmount(int hrAmount) {
		this.hrAmount = hrAmount;
	}
	public int getHrVat() {
		return hrVat;
	}
	public void setHrVat(int hrVat) {
		this.hrVat = hrVat;
	}
	public String getDigitalSupplierBNo() {
		return digitalSupplierBNo;
	}
	public void setDigitalSupplierBNo(String digitalSupplierBNo) {
		this.digitalSupplierBNo = digitalSupplierBNo;
	}
	public String getDigitalStoreName() {
		return digitalStoreName;
	}
	public void setDigitalStoreName(String digitalStoreName) {
		this.digitalStoreName = digitalStoreName;
	}
	public int getDigitalAmount() {
		return digitalAmount;
	}
	public void setDigitalAmount(int digitalAmount) {
		this.digitalAmount = digitalAmount;
	}
	public int getDigitalVat() {
		return digitalVat;
	}
	public void setDigitalVat(int digitalVat) {
		this.digitalVat = digitalVat;
	}
	
	@Override
	public String toString() {
		return "TaxBillVO [digitalSupplierBNo=" + digitalSupplierBNo + ", digitalStoreName=" + digitalStoreName
				+ ", digitalAmount=" + digitalAmount + ", digitalVat=" + digitalVat + ", no=" + no + ", hrSupplierBNo="
				+ hrSupplierBNo + ", hrStoreName=" + hrStoreName + ", hrAmount=" + hrAmount + ", hrVat=" + hrVat
				+ ", hrTaxBillCount=" + hrTaxBillCount + ", hrAmountSum=" + hrAmountSum + ", hrVatSum=" + hrVatSum
				+ "]";
	}
	
	
	
	
}
