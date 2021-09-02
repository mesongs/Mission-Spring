package kr.ac.kopo.receipt.vo;

public class ReceiptFileVO {
	
	int fileNo;
	String filePath;
	String fileOriginalName;
	String fileSaveName;
	long fileSize;
	int selectedReceiptNo;
	int selectedPurposeNo;
	String inputMemo;
	String thumbnailFileName;
	int amount; // 이미지에서 추출한 값
	int vat; // 이미지에서 추출한 값
	
	
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
	
	@Override
	public String toString() {
		return "ReceiptFileVO [fileNo=" + fileNo + ", filePath=" + filePath + ", fileOriginalName=" + fileOriginalName
				+ ", fileSaveName=" + fileSaveName + ", fileSize=" + fileSize + ", selectedReceiptNo="
				+ selectedReceiptNo + ", selectedPurposeNo=" + selectedPurposeNo + ", inputMemo=" + inputMemo
				+ ", thumbnailFileName=" + thumbnailFileName + ", amount=" + amount + ", vat=" + vat + "]";
	}
	
	
	
	
}
