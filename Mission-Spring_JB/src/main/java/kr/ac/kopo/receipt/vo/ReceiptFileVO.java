package kr.ac.kopo.receipt.vo;


public class ReceiptFileVO {
	
	private int fileNo;
	private String filePath;
	private String fileOriginalName;
	private String fileSaveName;
	private long fileSize;
	private int selectedReceiptNo;
	private int selectedPurposeNo;
	private String inputMemo;
	private String thumbnailFileName;
	private int amount;
	private int vat;
	private String supplierBusinessNo;
	private String receiptDate;
	private String storeName;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getSelectedReceiptNo() {
		return selectedReceiptNo;
	}
	public void setSelectedReceiptNo(int selectedReceiptNo) {
		this.selectedReceiptNo = selectedReceiptNo;
	}
	public int getSelectedPurposeNo() {
		return selectedPurposeNo;
	}
	public void setSelectedPurposeNo(int selectedPurposeNo) {
		this.selectedPurposeNo = selectedPurposeNo;
	}
	public String getInputMemo() {
		return inputMemo;
	}
	public void setInputMemo(String inputMemo) {
		this.inputMemo = inputMemo;
	}
	public String getThumbnailFileName() {
		return thumbnailFileName;
	}
	public void setThumbnailFileName(String thumbnailFileName) {
		this.thumbnailFileName = thumbnailFileName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getVat() {
		return vat;
	}
	public void setVat(int vat) {
		this.vat = vat;
	}
	public String getSupplierBusinessNo() {
		return supplierBusinessNo;
	}
	public void setSupplierBusinessNo(String supplierBusinessNo) {
		this.supplierBusinessNo = supplierBusinessNo;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	@Override
	public String toString() {
		return "ReceiptFileVO [fileNo=" + fileNo + ", filePath=" + filePath + ", fileOriginalName=" + fileOriginalName
				+ ", fileSaveName=" + fileSaveName + ", fileSize=" + fileSize + ", selectedReceiptNo="
				+ selectedReceiptNo + ", selectedPurposeNo=" + selectedPurposeNo + ", inputMemo=" + inputMemo
				+ ", thumbnailFileName=" + thumbnailFileName + ", amount=" + amount + ", vat=" + vat
				+ ", supplierBusinessNo=" + supplierBusinessNo + ", receiptDate=" + receiptDate + ", storeName="
				+ storeName + "]";
	}
	
	
	
}
